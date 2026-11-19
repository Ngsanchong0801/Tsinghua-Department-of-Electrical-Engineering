function [u_new,result_new] = sub(x)

%% 参数设置
%燃气轮机参数设置
pg_max=800;         %燃气轮机最大功率限制
pg_min=80;          %燃气轮机最小功率限制
a=0.67;             %燃气轮机成本系数a,b设置
b=0;

%蓄电池参数设置
ps_max=500;         %储能允许最大充放电给功率
Es_max=1800;        %蓄电池调度过程中允许的最大剩余容量
Es_min=400;         %蓄电池调度过程中允许的最小剩余容量
Es_0=1000;          %调度过程中初始容量

Ks=0.38;            %折算后充放电成本
yita=0.95;          %充放电效率

%需求响应负荷参数设置
K_DR=0.32;          %需求响应负荷单位调度成本
D_DR=2940;          %需求响应总用电需求
D_DR_min=50;        %需求响应功率最小值
D_DR_max=200;       %需求响应功率最大值

%配电网交互功率参数设置
pm_max=1500;        %微电网与配电网交互功率最大值

%% 数据设置
%配电网日前交易电价
price = [0.48;0.48;0.48;0.48;0.48;0.48;0.48;0.9;1.35;1.35;1.35;0.9;0.9;0.9;0.9;0.9;0.9;0.9;1.35;1.35;1.35;1.35;1.35;0.48]';

%光伏日前预测
p_pv_forecast_0 = [0 0 0 0 0 0 0 109.63 314.82 642.22 1080 1110.37 1214.81 1054.07 905.19 917.78  771.11 540 312.59 73.33 0 0 0 0];

%负荷日前预测
p_l_forecast_0 = [360.52,325.68,309.74,278.04,273.12,401.53,521.55,537.1,569.97,716.76,756.46,943.14,765.51,692.35,687.43,663.08,754.22,739.33,805.8,860.72,888.87,676.07,499.5,406.39];

% 不确定性集
% 光伏区间最大单侧偏差
Dp_pv_max=0.15*p_pv_forecast_0;
% 负荷区间最大单侧偏差
DPL_max=0.1*p_l_forecast_0;

% 可转移负荷
P_DR=1*[80, 70, 60, 50, 70, 70, 90, 100, 120, 150, 170, 200, 140, 100, 100, 120, 140, 150, 190, 200, 200, 190, 100, 80];  % 这个是可转移负荷的参数   需求响应负荷在调度周期内的总 用电需求

time = 24;

%% 列写矩阵
% c向量（行向量）
c = [a.*ones(1,24),(Ks*yita).*ones(1,24),(Ks/yita).*ones(1,24),zeros(1,24),K_DR*ones(1,24),K_DR*ones(1,24),price,-price,zeros(1,24),zeros(1,24)];
% D矩阵和d矩阵（所有涉及Dy>=d，不含Dy>=0型的约束包括2,7,9）
D = [eye(24),zeros(24,216);
     -eye(24),zeros(24,216);
     zeros(24,24),yita.*tril(ones(24)),(-1/yita).*tril(ones(24)),zeros(24,168);
     zeros(24,24),-yita.*tril(ones(24)),(1/yita).*tril(ones(24)),zeros(24,168);
     zeros(24,72),eye(24),zeros(24,144);
     zeros(24,72),-eye(24),zeros(24,144);];
d = [repmat(pg_min,24,1);
     repmat(-pg_max,24,1);
     repmat(Es_min - Es_0,24,1);
     repmat(Es_0 - Es_max,24,1);
     repmat(D_DR_min,24,1);
     repmat(-D_DR_max,24,1);];
% K矩阵和k矩阵（所有涉及Ky==k的约束包括6,8,12,14）
K = [zeros(24,24),yita.*ones(24),(-1/yita).*ones(24),zeros(24,168);
     zeros(24,72),ones(24),zeros(24,144);
     zeros(24,72),eye(24),eye(24),-eye(24),zeros(24,96);
     -eye(24),eye(24),-eye(24),eye(24),zeros(24,48),-eye(24),eye(24),-eye(24),eye(24);];
k = [zeros(24,1);
     repmat(D_DR,24,1);
     P_DR';
     zeros(24,1);];
% F矩阵、G矩阵和h矩阵（所有涉及Fx+Gy>=h的约束包括4,5,15,16）
G = [zeros(24,48),-eye(24),zeros(24,168);
     zeros(24,24),-eye(24),zeros(24,192);
     zeros(24,144),-eye(24),zeros(24,72);
     zeros(24,168),-eye(24),zeros(24,48);];
F = [ps_max.*eye(24),zeros(24,24);
     -ps_max.*eye(24),zeros(24,24);
     zeros(24,24),pm_max.*eye(24);
     zeros(24,24),-pm_max.*eye(24);];
h = [zeros(24,1);
     -repmat(ps_max,24,1);
     zeros(24,1);
     -repmat(pm_max,24,1);];
% I矩阵和u向量
I = [zeros(24,192),eye(24),zeros(24,24);
     zeros(24,192),zeros(24,24),eye(24);];
% deltaU


%% 决策变量
gamma = sdpvar(144,1,'full');
lambda = sdpvar(96,1,'full');
nu = sdpvar(96,1,'full');
pai = sdpvar(48,1,'full');
BPV = binvar(1,24,'full');
BL = binvar(1,24,'full');
BPV_aux = sdpvar(1,24,'full');
BL_aux = sdpvar(1,24,'full');

%% 变量关系
u_PV = p_pv_forecast_0 - BPV .* Dp_pv_max;
u_L = p_l_forecast_0  + BL .* DPL_max;
u = [u_PV,u_L]; 
u_forecast = [p_pv_forecast_0,p_l_forecast_0];
delta_u = [-Dp_pv_max,DPL_max]';
pai_hat = 1000;
B = [BPV,BL];
B_aux = [BPV_aux,BL_aux];
x_use = x;

%% 约束条件
cons_sub = [];
cons_sub = [cons_sub,D'*gamma + K'*lambda + G'*nu + I'*pai <= c'];
cons_sub = [cons_sub,B_aux >= -pai_hat.* B];
cons_sub = [cons_sub,B_aux <= pai_hat.* B];
cons_sub = [cons_sub,B_aux >= pai' - pai_hat.*(ones(1,48)-B)];
cons_sub = [cons_sub,B_aux <= pai' + pai_hat.*(ones(1,48)-B)];
cons_sub = [cons_sub,pai <= repmat(pai_hat,48,1)];
cons_sub = [cons_sub,sum(BPV) <= 6];
cons_sub = [cons_sub,sum(BL) <= 12];
cons_sub = [cons_sub,gamma >= zeros(144,1)];
cons_sub = [cons_sub,nu >= zeros(96,1)];

%% 目标函数
object_sub = d'*gamma + (h-F*x_use)'*nu + u_forecast*pai + delta_u'*B_aux' + k'*lambda;

%% 进行优化求解
options = sdpsettings('solver','gurobi');
result = optimize(cons_sub,-object_sub,options);

u_new = value(u);
result_new = value(object_sub);
end