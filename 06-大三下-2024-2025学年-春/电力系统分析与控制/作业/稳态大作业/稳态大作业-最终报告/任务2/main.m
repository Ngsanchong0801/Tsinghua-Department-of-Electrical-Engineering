function [x_main, y_main, gen_main, alpha_main] = main(u_sub)
    %% 获取数据参数
    mpc = loadcase('case39_UC');
    % 节点类型
    bus = mpc.bus(:,1);
    gen = mpc.gen(:,1);
    gen_index = [1;2;3;4;5;6;7;8;9;10];
    bus_index_noGen = find(mpc.bus(:,2) == 1);%节点类型为1的节点无发电机
    bus_index_hasGen = [30;31;32;33;34;35;36;37;38;39];%有一个发电机的节点
    bus_if_hasWind = zeros(39,1);%有风机的节点
    bus_if_hasWind(30,1) = 1;
    % 负荷
    load = matfile("load3996.mat").Pd;
    % 时长
    time = 96;
    time_0 = 4;
    % 机组出力上下限
    gen_Pmax = mpc.gen(:,9);
    gen_Pmin = mpc.gen(:,10);
    % 线路潮流上下限
    branch_Pmax = mpc.branch(:,6);
    branch_Pmin = -mpc.branch(:,6);
    % 机组运行成本，一次项和常数项
    gen_cost_1 = mpc.gencost(:,6);
    gen_cost_0 = mpc.gencost(:,7);
    % 机组启停成本
    gen_cost_startup = repmat(mpc.gencost(:,2),1,time-1);
    gen_cost_shutdown = repmat(mpc.gencost(:,3),1,time-1);
    % 定义爬坡边界，爬坡为0.1倍最大出力，开机关停为0.3倍最大出力
    R = repmat(0.1.*gen_Pmax,1,time-1);
    S = repmat(0.3.*gen_Pmax,1,time-1);
    % 风机处理成本
    gen_cost_wind = 0;

    %% 定义决策变量
    % 发电机发电量
    gen_generate = sdpvar(length(gen(:,1)),time,'full');
    % 发电机启停状态（运行为1，停机为0）
    gen_state = binvar(length(gen(:,1)),time,'full');
    % 节点注入有功
    bus_P = sdpvar(length(bus(:,1)),time,'full'); 
    % 将启停成本改写为决策变量构成约束条件
    gen_cost_updown = sdpvar(length(gen(:,1)),time-1,'full');
    % 风电出力（作为不确定参数的占位符）
    gen_wind = sdpvar(1,time,'full');
    
    %% 计算目标函数
    % 由一次项、常数项和启停项构成
    object = 0.25*sum(gen_cost_wind'*gen_wind) + 0.25*sum(gen_cost_1'*gen_generate) + 0.25*sum(gen_cost_0'*gen_state) + sum(sum(gen_cost_updown));
    
    %% 列写约束条件
    cons = [];
    % 系统有功平衡约束，各节点的功率是平衡的
    cons = [cons,bus_P(bus_index_noGen,:) == -load(bus_index_noGen,:)];%无发电机节点
    cons = [cons,bus_P(bus_index_hasGen,:) == gen_generate(gen_index,:) + bus_if_hasWind(bus_index_hasGen,1)*gen_wind- load(bus_index_hasGen,:)];%单发电机节点
    % 系统有功平衡约束，总的有功供需是平衡的，即每个节点的有功注入之和为0
    cons = [cons,sum(bus_P(bus,:)) == zeros(1,time)];
    % 线路潮流约束，可以求功率传输分布因子矩阵
    matrix_PTDF = makePTDF(mpc);
    cons = [cons,matrix_PTDF * bus_P <= repmat(branch_Pmax,1,time)];
    cons = [cons,matrix_PTDF * bus_P >= repmat(branch_Pmin,1,time)];
    % 发电机出力约束，注意改写为乘以状态
    cons = [cons,gen_generate <= gen_state.*repmat(gen_Pmax,1,time)];
    cons = [cons,gen_generate >= gen_state.*repmat(gen_Pmin,1,time)];
    % 发电机出力爬坡约束，注意同时考虑机组爬坡和启停
    cons = [cons,gen_generate(:,2:end) - gen_generate(:,1:end-1) <=  S + (R-S).*gen_state(:,1:end-1)];
    cons = [cons,gen_generate(:,1:end-1) - gen_generate(:,2:end) <=  S + (R-S).*gen_state(:,2:end)];
    % 将启停成本改写为约束条件，状态差分变量，注意是矩阵逐个对应位置相乘
    cons = [cons,gen_cost_updown >= (gen_state(:,2:end) - gen_state(:,1:end-1)).*gen_cost_startup];
    cons = [cons,gen_cost_updown >= -1.*(gen_state(:,2:end) - gen_state(:,1:end-1)).*gen_cost_shutdown];
    % 机组最小开停机时间约束新写法
    U0 = zeros(time,time-time_0);
    for i = 1:(time-time_0)
        for j = (i+1):(i+time_0)
            U0(j,i) = 1;
        end
    end
    U = zeros(time,time-1);
    for i = 1:(time-1)
        U(i,i) = -1;
        U(i+1,i) = 1;
    end
    cons = [cons, gen_state*U0 >= time_0.*gen_state*U(:,1:time-time_0)];
    cons = [cons, (1-gen_state)*U0 >= -time_0.*gen_state*U(:,1:time-time_0)];
    
    % 风电出力约束（使用不确定集）
    cons = [cons, gen_wind <= u_sub]; % u_sub 是子问题返回的最坏情况下的风电出力
    
    %% 求解
    options = sdpsettings('solver','gurobi');
    result = optimize(cons,object,options);
    
    %返回变量值
    x_main = value(gen_generate);
    y_main = value(gen_state);
    gen_main = gen;
    alpha_main = value(object);
end