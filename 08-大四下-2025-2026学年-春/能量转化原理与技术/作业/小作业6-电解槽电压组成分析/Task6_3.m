clear; clc; close all;

%% 1. 基础数据与常数
R_gas = 8.314; F = 96485; T = 358.15; z = 2;
Area = 0.234; % m^2
R_ohm = 0.343 / (Area * 10000); % Ohm/cm^2 转换后的总电阻
E_rev = 1.232; % 之前计算的可逆电压

I_exp = 200:100:1000;
V_exp = [1.518 1.562 1.601 1.637 1.669 1.699 1.726 1.753 1.779];

j = I_exp / (Area * 10000); % A/cm^2
eta_act = V_exp - E_rev - (I_exp * R_ohm); % 提取活化过电位

%% 2. 方法 A：塔菲尔 (Tafel) 线性拟合
% 线性模型: eta = b * ln(j) + a
p_tafel = polyfit(log(j), eta_act, 1);
b_t = p_tafel(1); 
a_t = p_tafel(2);
j0_tafel = exp(-a_t / b_t);
alpha_tafel = (R_gas * T) / (z * b_t * F);

%% 3. 方法 B：Butler-Volmer (B-V) 非线性拟合
% 定义 B-V 函数: j = j0 * [exp(A*eta) - exp(-B*eta)]
% 简化假设 alpha = 0.5 (或作为变量拟合)
bv_func = @(params, eta) params(1) * (exp((params(2)*z*F*eta)/(R_gas*T)) - ...
                                     exp(-(1-params(2))*z*F*eta/(R_gas*T)));

% 初始猜测 [j0, alpha]
initial_guess = [j0_tafel, 0.5]; 
options = optimset('Display','off');
params_bv = lsqcurvefit(bv_func, initial_guess, eta_act, j, [0, 0], [1, 1], options);

j0_bv = params_bv(1);
alpha_bv = params_bv(2);

%% 4. 结果对比与绘图
fprintf('--- 拟合结果对比 ---\n');
fprintf('指标\t\tTafel 方法\tB-V 方法\n');
fprintf('alpha\t\t%.4f\t\t%.4f\n', alpha_tafel, alpha_bv);
fprintf('j0 (A/cm2)\t%.4e\t%.4e\n', j0_tafel, j0_bv);

% 绘图
eta_fine = linspace(min(eta_act), max(eta_act), 100);
j_tafel_fit = exp((eta_fine - a_t)/b_t);
j_bv_fit = bv_func(params_bv, eta_fine);

figure('Color', 'w');
plot(eta_act, j, 'ko', 'MarkerFaceColor', 'k'); hold on;
plot(eta_fine, j_tafel_fit, 'r--', 'LineWidth', 1.5);
plot(eta_fine, j_bv_fit, 'b-', 'LineWidth', 1.5);
grid on; xlabel('活化过电位 \eta_{act} (V)'); ylabel('电流密度 j (A/cm^2)');
legend('实验数据', 'Tafel 拟合', 'Butler-Volmer 拟合', 'Location', 'NorthWest');
title('B-V 与 Tafel 拟合效果对比');