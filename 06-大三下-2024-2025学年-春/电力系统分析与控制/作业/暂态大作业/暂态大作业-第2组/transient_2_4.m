function [a_value, b_value, c_value, d_value] = transient_3_1()
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

% 线性化段的数量/样本点个数
line_num = 4;
assess_num = 10;
%线性化的评估点KG，FR，Tj,一共10个点
KG_ass = [15,16,22,21,20,28,23,17,18,21;];
FR_ass = [0.25,0.35,0.3,0.25,0.3,0.35,0.32,0.31,0.25,0.3;]; 
Tj_ass = [15,14,13,13,15,15,10,9,9,15;];

%% 提取动态部分数据
frequency_0 = 50;%稳定频率50Hz
gen_number = mpc.bus(:,1);%发电机编号
Tj_gen = [15;14;13;13;15;15;10;9;9;15;];%设置
S_gen = mpc.gen(:,9);%发电机机组容量
S_sys = sum(S_gen);%系统容量基值
D_gen = [2.7;2.9;2.1;2.5;2.7;2.6;2.4;2.8;2.2;2.6;];%发电机阻尼常数
TG_sys = 12;%一次调频参数都设置为12
KG_gen = [15;16;22;21;20;28;23;17;18;21;];%发电机一次调频参数
FR_gen = [0.3;0.3;0.3;0.3;0.3;0.3;0.3;0.3;0.3;0.3;];%再热器系数
TR_gen = 12;%再热器时间常数


%% 定义决策变量
%自定义符号取max
t1 = sdpvar(1,assess_num,'full');
t2 = sdpvar(1,assess_num,'full');
t3 = sdpvar(1,assess_num,'full');

a = sdpvar(1,line_num,'full');
b = sdpvar(1,line_num,'full');
c = sdpvar(1,line_num,'full');
d = sdpvar(1,line_num,'full');

%max中所需的01变量
t1_bi = binvar(1,assess_num,'full');
t2_bi = binvar(1,assess_num,'full');
t3_bi = binvar(1,assess_num,'full');

%一个足够大的标量
A = 100;

% 频率最低点约束中的发电机实际调频功率
delta_PG = sdpvar(length(gen(:,1)),line_num,'full');

%% 计算动态部分参量
% 最大频率变化率RoCoFmax（标幺值）
RoCoF_max = 0.5/frequency_0;
% 最大稳态频率偏差delta_f_ss_max（标幺值）
delta_f_ss_max = 0.3/frequency_0;
% delta_f_cr（标幺值，负载增大，频率为负值）
delta_f_cr = -0.5/frequency_0;
% 系统有功变化delta_PL（标幺值）
delta_PL = 500/S_sys;


%% 列写约束条件
cons = [];
object = 0;
% test = [1 50 0.27 900];

for i = 1:assess_num
    % 频率最低点约束
    cons = [cons,a(1,1)*KG_ass(1,i) + b(1,1)*FR_ass(1,i) + c(1,1)*Tj_ass(1,i) + d(1,1) <= t1(1,i)];
    cons = [cons,a(1,1)*KG_ass(1,i) + b(1,1)*FR_ass(1,i) + c(1,1)*Tj_ass(1,i) + d(1,1) + t1_bi(1,i)*A >= t1(1,i)];
    cons = [cons,a(1,2)*KG_ass(1,i) + b(1,2)*FR_ass(1,i) + c(1,2)*Tj_ass(1,i) + d(1,2) <= t1(1,i)];
    cons = [cons,a(1,2)*KG_ass(1,i) + b(1,2)*FR_ass(1,i) + c(1,2)*Tj_ass(1,i) + d(1,2) + (1 - t1_bi(1,i) )*A >= t1(1,i)];
    cons = [cons,t1(1,i) <= t2(1,i)];
    cons = [cons,t2(1,i) <= t1(1,i) + t2_bi(1,i)*A];

    cons = [cons,a(1,3)*KG_ass(1,i) + b(1,3)*FR_ass(1,i) + c(1,3)*Tj_ass(1,i) + d(1,3) <= t2(1,i)];
    cons = [cons,a(1,3)*KG_ass(1,i) + b(1,3)*FR_ass(1,i) + c(1,3)*Tj_ass(1,i) + d(1,3) + (1 - t2_bi(1,i) )*A >= t2(1,i)];
    cons = [cons,t2(1,i) <= t3(1,i)];
    cons = [cons,t3(1,i) <= t2(1,i) + t3_bi(1,i)*A];

    cons = [cons,a(1,4)*KG_ass(1,i) + b(1,4)*FR_ass(1,i) + c(1,4)*Tj_ass(1,i) + d(1,4) <= t3(1,i)];
    cons = [cons,a(1,4)*KG_ass(1,i) + b(1,4)*FR_ass(1,i) + c(1,4)*Tj_ass(1,i) + d(1,4) + (1 - t3_bi(1,i) )*A >= t3(1,i)];
    
    %% 计算目标函数
    % 由一次项、常数项和启停项构成
    % 由公式计算出f_nadir（待线性化）
    omiga_n = sqrt((KG_ass(1,i) + D_gen(1,1)) ./ Tj_ass(1,i) / TR_gen);
    ksai = (Tj_ass(1,i) + TR_gen * (D_gen(1,1) + FR_ass(1,i))) ./ (2 * sqrt((KG_ass(1,i) + D_gen(1,1)) .* Tj_ass(1,i) * TR_gen));
    omiga_d = omiga_n .* sqrt(1 - ksai .^ 2);
    t_m = 1 ./ omiga_d .* atan(omiga_d ./ (ksai .* omiga_n - 1/TR_gen));
    f_nadir = -delta_PL ./ (KG_ass(1,i) + D_gen(1,1)) .* (1 + sqrt(KG_ass(1,i) * TR_gen ./ Tj_ass(1,i)) .* exp(-ksai .* omiga_n .* t_m));
    % f_nadir =  test(1,i);
    f_nadir = f_nadir*1000
    % -delta_PL ./ (KG_ass(1,i) + D_gen(1,1))
    %     (1 + sqrt(KG_ass(1,i) * TR_gen ./ Tj_ass(1,i)) .* exp(-ksai .* omiga_n .* t_m))
    object = object + (t3(1,i) - f_nadir)*(t3(1,i) - f_nadir);
end

%% 求解
options = sdpsettings('solver','gurobi');
options.gurobi.TuneTimeLimit = 0;
options.gurobi.ConcurrentMIP = 4;
% options.gurobi.MIPGap = 0.000005;
options.gurobi.Threads = maxNumCompThreads;
result = optimize(cons,object,options);

%% 展示结果
fprintf('求解时间：%.4f 秒\n',result.solvertime);
fprintf('发电成本：%.2f Dollars\n',value(object));

a_value = value(a)/1000
b_value = value(b)/1000
c_value = value(c)/1000
d_value = value(d)/1000
t1_value = value(t1)
t2_value = value(t2)
t3_value = value(t3)
value(t1_bi)
value(t2_bi)
value(t3_bi)
f_nadir
