clear; clc; close all;

%% 1. 基础数据与物理常数
R_gas = 8.314; F = 96485; T = 358.15; z = 2;
Area  = 0.234;                  % m^2
R_ohm = 0.343 / (Area * 10000); % Ohm (基于面电阻率 0.343 Ohm*cm^2)
E_rev = 1.232;                  % 85C, 1MPa 下的可逆电压 [V]

% 实验数据 (200A - 1000A)
I_exp = 200:100:1000;
V_exp = [1.518 1.562 1.601 1.637 1.669 1.699 1.726 1.753 1.779];

%% 2. 拟合计算 (提取 Tafel 经验参数)
j_exp     = I_exp / (Area * 10000);   % A/cm^2
V_ohm_exp = I_exp * R_ohm;
V_act_exp = V_exp - E_rev - V_ohm_exp;

% 线性拟合 ln(j) vs V_act 以获取后续工况所需的参数 p
p = polyfit(log(j_exp), V_act_exp, 1);

%% 3. 【任务 4】能量流分析与典型工况对比
j_targets_Am2 = [1000, 4000]; 
j_targets     = j_targets_Am2 / 10000;  % 转换为 A/cm^2
I_targets     = j_targets * (Area * 10000); 

% 电压分量计算
V_rev_t = E_rev;                       
V_ohm_t = I_targets * R_ohm;           
V_act_t = polyval(p, log(j_targets));  % 基于实验数据拟合预测
V_tot_t = V_rev_t + V_ohm_t + V_act_t; 

% 功率能量流 (P = V * I)
P_in    = V_tot_t .* I_targets;   % 输入总电功 [W]
P_ideal = V_rev_t .* I_targets;   % 理论分解功 [W]
P_act   = V_act_t .* I_targets;   % 活化损失功率 [W]
P_ohm   = V_ohm_t .* I_targets;   % 欧姆损失功率 [W]

% 理想产氢量 (Nm3/h)
H2_flow = (I_targets / (z * F)) * 22.4 * 3600; 

%% 4. 结果输出与可视化
for i = 1:2
    fprintf('\n工况 %d: 电流密度 = %d A/m^2\n', i, j_targets_Am2(i));
    fprintf('  总电压: %.3f V\n', V_tot_t(i));
    fprintf('  理想产氢量: %.4f Nm^3/h\n', H2_flow(i));
    fprintf('  功率分解: 分解功 %.1f%%, 活化损耗 %.1f%%, 欧姆损耗 %.1f%%\n', ...
        (P_ideal(i)/P_in(i))*100, (P_act(i)/P_in(i))*100, (P_ohm(i)/P_in(i))*100);
end

% 绘制能量组成对比堆叠图
figure('Color', 'w');
h = bar(j_targets_Am2, [P_ideal; P_act; P_ohm]', 'stacked');
set(h(1), 'FaceColor', [0.2 0.6 0.2]); % 绿色代表有效功
set(h(2), 'FaceColor', [0.9 0.6 0.1]); % 橙色代表活化损耗
set(h(3), 'FaceColor', [0.8 0.2 0.2]); % 红色代表欧姆损耗

xlabel('电流密度 (A/m^2)'); ylabel('功率 (W)');
legend('理论分解功', '活化损失', '欧姆损失', 'Location', 'NorthWest');
title('不同工况能量流组成对比');
grid on;