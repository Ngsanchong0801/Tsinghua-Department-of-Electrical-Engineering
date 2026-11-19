%% 稳态大作业（2）：机组组合
clear
clc

Load_str=load('load3996.mat');
Load=Load_str.Pd;
mpc=case39_UC; 
n=length(mpc.bus(:,1));
m=length(mpc.branch(:,1));
gennum=length(mpc.gen(:,1));
base=mpc.baseMVA;
HP=makePTDF(mpc); 
n_time = 96;

pq=[]; 
pv=[];
vh=[];
pq = find(mpc.bus(:,2) == 1);
pv = find(mpc.bus(:,2) == 2);
vh = find(mpc.bus(:,2) == 3);   

T = 20;
C1 = mpc.gencost(:,6);%一次项成本系数
C0 = mpc.gencost(:,7);%常数项成本系数
M_O = [];
M_O = mpc.gencost(:,2);  %开启成本
M_C = mpc.gencost(:,3);  %停止成本
%% 决策变量
g=sdpvar(gennum,n_time,'full'); % 各个发电机的发电量
P=sdpvar(n,n_time,'full'); % 各个节点的注入功率

X=binvar(gennum,n_time,'full'); % 定义状态变量 
C_OC = sdpvar(gennum,n_time-1,'full');   %启停成本变量
Z = sdpvar(gennum,n_time-1,'full');  %开关动作变量

%% 设置发电机功率及支路功率上下限
gmax=mpc.gen(:,9); % 发电机有功上限
gmin=mpc.gen(:,10); % 发电机有功下限

Plmax=mpc.branch(:,6); % 线路有功上限
Plmin=-Plmax; % 线路有功下限
Pload=mpc.bus(:,3); % 每个节点负荷

%最大爬坡限制 
Gmax = repmat(gmax,1,n_time);
Gmin = repmat(gmin,1,n_time);
Pmax = repmat(Plmax,1,n_time);
Pmin = repmat(Plmin,1,n_time);

Ru = 0.1*repmat(gmax,1,n_time-1);
Rd = Ru;
Su = 0.3*repmat(gmax,1,n_time-1);
Sd = Su;

%% 定义限制条件
cons=[];
cons=[cons,sum(P) == zeros(1,n_time)]; % 每一时刻总有功注入为0（无网损） 
cons=[cons,P(mpc.gen(:,1),:)==g-Load(mpc.gen(:,1),:)]; % 节点功率方程（有发电机）
cons=[cons,P(pq,:)==-Load(pq,:)]; % 节点功率方程（无发电机）
cons=[cons, X.*Gmin <= g <= X.*Gmax ]; % 发电机有功约束  (repmat将原本1列的gmin扩展为96列gmin)
cons=[cons,Pmin <= HP*P <= Pmax]; % 支路有功功率传输约束
cons=[cons, g(:,2:end)-g(:,1:end-1) <= Su + (Ru-Su).*X(:,1:end-1)];  %机组上爬坡约束
cons=[cons, g(:,1:end-1)-g(:,2:end) <= Sd + (Rd-Sd).*X(:,2:end)];  %机组下爬坡约束

%启停成本表述
Z = X(:,2:end)-X(:,1:end-1); %开关动作变量
cons = [cons,C_OC >= diag(M_O)*Z];
cons = [cons,C_OC >= -diag(M_C)*Z];

% 机组最小持续开停机时间约束
Z_ = Z;
Z_ = [ones(gennum,1),Z_];
Z_delta=zeros(gennum,1);
for i = 1:gennum
    nonzero_ids = find(Z_(i,:)~=0);
    if length(nonzero_ids)==1
        Z_delta(i)=20;
    else
        delta = nonzero_ids(2:end)-nonzero_ids(1:end-1);
        Z_delta(i) = min(delta);
    end
end
Z_20 = 20*ones(gennum,1);
cons = [cons,Z_delta>=Z_20];

%% 目标函数
objective = 0.25*( sum(C1'*g + C0'*X )) + sum(C_OC(:)); %成本系数以小时为单位

%% 求解优化问题
options=sdpsettings('solver','gurobi'); 
sol=optimize(cons,objective,options);

%% 绘图展示调度结果
g_optimal = value(g); %机组出力最优解
P_optimal = value(P);
index_gen = mpc.gen(:,1);
solvetime = sol.solvertime;
fprintf('求解时间为%.5f秒\n',solvetime);
fprintf('最小化系统运行成本为%.f$\n',value(objective));

t = 1:n_time;
figure(1); 
stairs(t, g_optimal', 'LineWidth', 1); 
xlim([0,n_time]);
xlabel('时段'); 
ylabel('发电机出力/MW'); 
title('各机组出力'); 
legend(num2str(index_gen));
