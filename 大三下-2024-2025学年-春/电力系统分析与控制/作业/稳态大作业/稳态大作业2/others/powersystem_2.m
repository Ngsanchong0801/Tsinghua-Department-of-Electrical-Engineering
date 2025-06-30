%% 数据读取
clear;
load("load3996.mat");
mpc = loadcase('case39_UC');
% 节点类型
bus = mpc.bus(:,1);
gen = mpc.gen(:,1);
gen_index = [1;2;3;4;5;6;7;8;9;10];
bus_index_noGen = find(mpc.bus(:,2) == 1);%节点类型为1的节点无发电机
bus_index_hasGen = [30;31;32;33;34;35;36;37;38;39];%有一个发电机的节点
% 负荷
load = Pd;
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


%% 决策变量
% 发电机发电量
gen_generate = sdpvar(length(gen(:,1)),time,'full');
% 发电机启停状态（运行为1，停机为0）
gen_state = binvar(length(gen(:,1)),time,'full');
% 节点注入有功
bus_P = sdpvar(length(bus(:,1)),time,'full'); 
% 将启停成本改写为决策变量构成约束条件
gen_cost_updown = sdpvar(length(gen(:,1)),time-1,'full');

%% 目标函数
% 由一次项、常数项和启停项构成
object = 0.25*sum(gen_cost_1'*gen_generate) + 0.25*sum(gen_cost_0'*gen_state) + sum(sum(gen_cost_updown));

%% 约束条件
cons = [];
% 系统有功平衡约束，各节点的功率是平衡的
cons = [cons,bus_P(bus_index_noGen,:) == -load(bus_index_noGen,:)];%无发电机节点
cons = [cons,bus_P(bus_index_hasGen,:) == gen_generate(gen_index,:) - load(bus_index_hasGen,:)];%单发电机节点
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
% % % 机组最小开停机时间约束
cons = [cons,gen_state(:,2:93) + gen_state(:,3:94) + gen_state(:,4:95) + gen_state(:,5:96) >= 4.*(gen_state(:,2:93) - gen_state(:,1:92))];
cons = [cons,(1-gen_state(:,2:93)) + (1-gen_state(:,3:94)) + (1-gen_state(:,4:95)) + (1-gen_state(:,5:96)) >= -4.*(gen_state(:,2:93) - gen_state(:,1:92))];

% %% 新写法
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



%% 求解
options = sdpsettings('solver','gurobi');
result = optimize(cons,object,options);

%% 展示结果
fprintf('求解时间：%.4f 秒\n',result.solvertime);
fprintf('发电成本：%.2f Dollars\n',value(object));
gen_state_value = value(gen_state);
time_vector = 1:1:96;
% 使用 hsv 颜色图生成 11 种颜色
colors = hsv(10);

% 绘制阶梯图
figure;
hold on;
for i = 1:size(gen_generate, 1)
    stairs(time_vector, value(gen_generate(i,:)), 'LineWidth', 1.5, 'Color', colors(i,:));
end
hold off;

% 设置坐标轴标签
xlabel('时间/15min');
ylabel('发电机出力/MW');
title('各时段各发电机出力');

% 设置图例
legend(num2str(gen), 'Location', 'best');
