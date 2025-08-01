%% 稳态大作业（1）：多时段经济调度
clear
clc
%% 数据读取
Load_str=load('load3996.mat');
Load=Load_str.Pd;
mpc=case39_ED; 
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
gmax=mpc.gen(:,9); % 发电机有功上限
gmin=mpc.gen(:,10); % 发电机有功下限
Plmin=-Plmax; % 线路有功下限
Pload=mpc.bus(:,3); % 每个节点负荷
Plmax=mpc.branch(:,6); % 线路有功上限


%% 决策变量
g=sdpvar(gennum,n_time,'full'); % 各个发电机的发电量
P=sdpvar(n,n_time,'full'); % 各个节点的注入功率

%潮流约束
%Plmax=0.95*mpc.branch(:,6); % 线路有功上限
%Plmax=0.96*mpc.branch(:,6); % 线路有功上限
%Plmax=0.97*mpc.branch(:,6); % 线路有功上限
%Plmax=0.98*mpc.branch(:,6); % 线路有功上限
%Plmax=0.99*mpc.branch(:,6); % 线路有功上限
Plmax=mpc.branch(:,6); % 线路有功上限
%Plmax=1.1*mpc.branch(:,6); % 线路有功上限
%Plmax=1.2*mpc.branch(:,6); % 线路有功上限
%Plmax=1.3*mpc.branch(:,6); % 线路有功上限
%Plmax=1.4*mpc.branch(:,6); % 线路有功上限

%% 定义限制条件
cons=[];
cons=[cons,sum(P) == zeros(1,n_time)]; % 每一时刻总有功注入为0（无网损） 
cons=[cons,P(mpc.gen(:,1),:)==g-Load(mpc.gen(:,1),:)]; % 节点功率方程（有发电机）
cons=[cons,P(pq,:)==-Load(pq,:)]; % 节点功率方程（无发电机）
cons=[cons,repmat(gmin,1,n_time)<=g<=repmat(gmax,1,n_time)]; % 发电机有功约束  (repmat将原本1列的gmin扩展为96列gmin)
cons=[cons,repmat(Plmin,1,n_time)<=HP*P<=repmat(Plmax,1,n_time)]; % 支路有功功率传输约束
cons=[cons,-0.1*repmat(gmax,1,n_time-1)<=g(:,2:end)-g(:,1:end-1)<=0.1*repmat(gmax,1,n_time-1)];  %机组爬坡约束

%爬坡约束
%cons=[cons,-0.08*repmat(gmax,1,n_time-1)<=g(:,2:end)-g(:,1:end-1)<=0.08*repmat(gmax,1,n_time-1)];  %机组爬坡约束
%cons=[cons,-0.09*repmat(gmax,1,n_time-1)<=g(:,2:end)-g(:,1:end-1)<=0.09*repmat(gmax,1,n_time-1)];  %机组爬坡约束
cons=[cons,-0.1*repmat(gmax,1,n_time-1)<=g(:,2:end)-g(:,1:end-1)<=0.1*repmat(gmax,1,n_time-1)];  %机组爬坡约束
%cons=[cons,-0.3*repmat(gmax,1,n_time-1)<=g(:,2:end)-g(:,1:end-1)<=0.3*repmat(gmax,1,n_time-1)];  %机组爬坡约束
%cons=[cons,-0.5*repmat(gmax,1,n_time-1)<=g(:,2:end)-g(:,1:end-1)<=0.5*repmat(gmax,1,n_time-1)];  %机组爬坡约束
%cons=[cons,-0.7*repmat(gmax,1,n_time-1)<=g(:,2:end)-g(:,1:end-1)<=0.7*repmat(gmax,1,n_time-1)];  %机组爬坡约束
%cons=[cons,-0.9*repmat(gmax,1,n_time-1)<=g(:,2:end)-g(:,1:end-1)<=0.9*repmat(gmax,1,n_time-1)];  %机组爬坡约束


%% 目标函数
objective = 0.25*sum( mpc.gencost(:,6)'*g ); %成本系数以小时为单位

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
