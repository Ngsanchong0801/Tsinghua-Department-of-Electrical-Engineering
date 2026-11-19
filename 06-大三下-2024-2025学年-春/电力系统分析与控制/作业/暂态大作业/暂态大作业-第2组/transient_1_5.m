%% 获取数据参数
clear;
load("load3996.mat");
mpc = loadcase('case39_FCUC');
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
S = repmat(1.0.*gen_Pmax,1,time-1);

%% 提取动态部分数据
frequency_0 = 50;%稳定频率50Hz
gen_number = mpc.bus(:,1);%发电机编号
Tj_gen = [15;14;13;13;15;15;10;9;9;15;];%设置
S_gen = mpc.gen(:,9);%发电机机组容量
S_sys = sum(S_gen);%系统容量基值
D_gen = [2.7;2.9;2.1;2.5;2.7;2.6;2.4;2.8;2.2;2.6;];%发电机阻尼常数
TG_sys = 12;%一次调频参数都设置为12
KG_gen = [15;16;22;21;20;28;23;17;18;21;];%发电机一次调频参数

%% 定义决策变量
% 发电机发电量
gen_generate = sdpvar(length(gen(:,1)),time,'full');
% 发电机启停状态（运行为1，停机为0）
gen_state = binvar(length(gen(:,1)),time,'full');
% 将启停成本改写为决策变量构成约束条件
gen_cost_updown = sdpvar(length(gen(:,1)),time-1,'full');
% 频率最低点约束中的sij
s = binvar(length(gen(:,1))^2,time,'full');
% 频率最低点约束中的发电机实际调频功率
delta_PG = sdpvar(1,time,'full');

%% 计算动态部分参量
% 系统惯性时间常数（96列行向量）
Tj_sys = Tj_gen'*(gen_state.*repmat(S_gen,1,time))/S_sys;
% 系统阻尼常数（96列行向量）
D_sys = D_gen'*(gen_state.*repmat(S_gen,1,time))/S_sys;
% 系统一次调频参数（96列行向量）
KG_sys = KG_gen'*(gen_state.*repmat(S_gen,1,time))/S_sys;
% 最大频率变化率RoCoFmax（标幺值）
RoCoF_max = 0.5/frequency_0;
% 最大稳态频率偏差delta_f_ss_max（标幺值）
delta_f_ss_max = 0.3/frequency_0;
% delta_f_cr（标幺值，负载增大，频率为负值）
delta_f_cr = -0.5/frequency_0;
% 系统有功变化delta_PL（标幺值）
delta_PL = 250/S_sys;
% 频率最低点约束中的alpha,beta（列向量）
alpha_gen = (S_gen.*KG_gen.*delta_f_cr)/(4*TG_sys*S_sys);
beta_gen = (pi*delta_f_cr*S_gen.*Tj_gen)/(delta_PL*S_sys);
% 频率最低点约束中的delta_PG_tm（关于时间的函数，是行向量）
matrix_m = length(gen(:,1));
matrix_n = time;
delta_PG_tm = kron(alpha_gen,ones(matrix_m,matrix_n)).*repmat(beta_gen,matrix_m,matrix_n).*s;
delta_PG_tm = sum(delta_PG_tm,1);

%% 计算目标函数
% 由一次项、常数项和启停项构成
object = 0.25*sum(gen_cost_1'*gen_generate) + 0.25*sum(gen_cost_0'*gen_state) + 10*sum(sum(gen_cost_updown));

%% 列写约束条件
cons = [];
% 系统有功平衡约束，总的有功供需是平衡的
cons = [cons,sum(gen_generate,1) == sum(load,1)];
% 从发电机节点映射到全部节点的矩阵
BusGen = sparse(gen,(1:length(gen))',ones(length(gen),1),length(bus),length(gen));
% 线路潮流约束，可以求功率传输分布因子矩阵
matrix_PTDF = sparse(makePTDF(mpc));
cons = [cons,matrix_PTDF * (BusGen*gen_generate - load) <= repmat(branch_Pmax,1,time)];
cons = [cons,matrix_PTDF * (BusGen*gen_generate - load) >= repmat(branch_Pmin,1,time)];
% 发电机出力约束，注意改写为乘以状态
cons = [cons,gen_generate <= gen_state.*repmat(gen_Pmax,1,time)];
cons = [cons,gen_generate >= gen_state.*repmat(gen_Pmin,1,time)];
% 发电机出力爬坡约束，注意同时考虑机组爬坡和启停
cons = [cons,gen_generate(:,2:end) - gen_generate(:,1:end-1) <=  S + (R-S).*gen_state(:,1:end-1)];
cons = [cons,gen_generate(:,1:end-1) - gen_generate(:,2:end) <=  S + (R-S).*gen_state(:,2:end)];
% 将启停成本改写为约束条件，状态差分变量，注意是矩阵逐个对应位置相乘
cons = [cons,gen_cost_updown >= (gen_state(:,2:end) - gen_state(:,1:end-1)).*gen_cost_startup];
cons = [cons,gen_cost_updown >= -1.*(gen_state(:,2:end) - gen_state(:,1:end-1)).*gen_cost_shutdown];
% 开停机时间约束新写法
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
% 频率最低点约束
cons = [cons,delta_PG - delta_f_cr*D_sys >= delta_PL];
cons = [cons,delta_PG <= delta_PG_tm];
cons = [cons,delta_PG <= sum(gen_state.*repmat(S_gen,1,time)-gen_generate,1)/S_sys];
cons = [cons,s <= kron(gen_state,ones(matrix_m,1))];
cons = [cons,s <= repmat(gen_state,matrix_m,1)];
cons = [cons,s >= kron(gen_state,ones(matrix_m,1))+repmat(gen_state,matrix_m,1)-1];
% 最大频率变化率约束/准稳态频率偏差约束
cons = [cons,abs(Tj_sys/delta_PL) >= repmat(1/RoCoF_max,1,time)];
cons = [cons,abs((D_sys+KG_sys)./delta_PL) >= repmat(1/delta_f_ss_max,1,time)];

%% 求解
options = sdpsettings('solver','gurobi');
options.gurobi.TuneTimeLimit = 0;
options.gurobi.ConcurrentMIP = 4;
options.gurobi.Threads = maxNumCompThreads;
result = optimize(cons,object,options);

%% 展示结果
fprintf('求解时间：%.4f 秒\n',result.solvertime);
fprintf('发电成本：%.2f Dollars\n',value(object));
gen_state_value = value(gen_state);
save('1_FCUC_gen_state','gen_state_value');
gen_generate_value = value(gen_generate);
save('1_FCUC_gen_generate','gen_generate_value');
Tj_value = value(Tj_sys);
D_value = value(D_sys);
KG_value = value(KG_sys);
save('1_FCUC_Tj','Tj_value');
save('1_FCUC_D','D_value');
save('1_FCUC_KG','KG_value');
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

gen_state_value = value(gen_state);
save('1_FCUC_JH_gen_state','gen_state_value');
gen_generate_value = value(gen_generate);
save('1_FCUC_JH_gen_generate','gen_generate_value');
Tj_value = value(Tj_sys);
D_value = value(D_sys);
KG_value = value(KG_sys);
save('1_FCUC_JH_Tj','Tj_value');
save('1_FCUC_JH_D','D_value');
save('1_FCUC_JH_KG','KG_value');