%% 风力发电机最佳叶尖速比MPPT控制仿真 - 完整版
% 本程序用于模拟风力发电机在变化风速下的最佳叶尖速比MPPT控制方法

clc;
clear all;
close all;

%% 1. 风力发电机基本参数设置
rho = 1.25;       % 空气密度，kg/m^3
R = 26.335;       % 叶轮半径，m
J = 1.12e6;       % 风轮转动惯量，kg·m²
beta = 0.01;      % 桨距角，rad

%% 2. 计算最佳叶尖速比和最大风能利用系数
lambda_range = 2:0.01:15;
Cp_values = zeros(size(lambda_range));

for i = 1:length(lambda_range)
    Cp_values(i) = calc_Cp(lambda_range(i), beta);
end

%----------------------------------------------------------------------
% [学生完成部分0] 找到最大Cp和对应的lambda_opt
%----------------------------------------------------------------------
[Cp_max, idx_max] = max(Cp_values);
lambda_opt = lambda_range(idx_max);

fprintf('最佳叶尖速比 λ_opt = %.4f\n', lambda_opt);
fprintf('最大风能利用系数 Cp_max = %.4f\n', Cp_max);

%% 3. 风机在额定风速时的最大功率和最优转速计算
v_10 = 10;       % 风速为10 m/s

omega_opt_10 = lambda_opt * v_10 / R;  % rad/s

Cp_at_lambda_opt = calc_Cp(lambda_opt, beta);

P_max_10 = 0.5 * rho * pi * R^2 * Cp_at_lambda_opt * v_10^3;  % W

fprintf('\n当风速为10 m/s时:\n');
fprintf('- 最大功率 = %.4f MW \n', P_max_10/1e6);
fprintf('- 最优转速 = %.4f rad/s \n', omega_opt_10);
fprintf('- 最大风能利用系数 Cp = %.4f\n', Cp_at_lambda_opt);

%% 4. 绘制风机最大功率曲线
v_range = 3:0.5:11;
omega_range = [];
P_max_range = [];

for v = v_range
    omega_opt = lambda_opt * v / R;
    P_max = 0.5 * rho * pi * R^2 * Cp_at_lambda_opt * v^3;
    
    omega_range = [omega_range, omega_opt];
    P_max_range = [P_max_range, P_max];
end

figure(1);
plot(omega_range, P_max_range/1e6, 'b-', 'LineWidth', 2);
grid on;
xlabel('转速 (rad/s)');
ylabel('功率 (MW)');
title('风机最大功率曲线（最佳叶尖速比）');
hold on;

P_rated = max(P_max_range);
omega_rated = max(omega_range);
K_opt = P_max_range(end) / omega_range(end)^3;

omega_fit = linspace(min(omega_range), max(omega_range), 100);
P_fit = K_opt * omega_fit.^3;

plot(omega_fit, P_fit/1e6, 'r--', 'LineWidth', 1.5);
legend('实际最大功率曲线', 'P = K\omega^3拟合曲线', 'Location', 'best');
title('风机最大功率曲线');

%% 绘制不同叶尖速比下的Cp曲线
figure(2);
lambda_vals = 2:0.1:14;
Cp_vals = zeros(size(lambda_vals));

for i = 1:length(lambda_vals)
    Cp_vals(i) = calc_Cp(lambda_vals(i), beta);
end

plot(lambda_vals, Cp_vals, 'b-', 'LineWidth', 2);
grid on;
xlabel('叶尖速比 \lambda');
ylabel('风能利用系数 Cp');
title('风能利用系数 Cp 与叶尖速比 \lambda 的关系');
hold on;

plot(lambda_opt, Cp_at_lambda_opt, 'ro', 'MarkerSize', 8, 'LineWidth', 2);
text(lambda_opt+0.5, Cp_at_lambda_opt, ...
    ['\lambda_{opt}=' num2str(lambda_opt, '%.2f') ...
    ', Cp_{max}=' num2str(Cp_at_lambda_opt, '%.4f')]);

legend('Cp-\lambda曲线', '最大Cp点', 'Location', 'best');

%% 5. 最佳叶尖速比MPPT控制仿真
sim_time = 200;
dt = 0.1;
time = 0:dt:sim_time;

v_base = 8;
v_variation = 3;

rng(1);   % 固定随机数种子，方便复现实验结果
v_sim = v_base + v_variation * sin(2*pi*time/60) + 0.5*randn(size(time));
v_sim = max(3, min(v_sim, 11));

omega_mppt = zeros(size(time));
P_mech = zeros(size(time));
P_elec = zeros(size(time));
T_mech = zeros(size(time));
T_elec = zeros(size(time));
omega_opt_track = zeros(size(time));
Cp_track = zeros(size(time));

v_init = v_sim(1);
omega_mppt(1) = lambda_opt * v_init / R;
omega_opt_track(1) = omega_mppt(1);

lambda_init = omega_mppt(1) * R / v_init;
Cp_init = calc_Cp(lambda_init, beta);
Cp_track(1) = Cp_init;

P_mech(1) = 0.5 * rho * pi * R^2 * Cp_init * v_init^3;

if omega_mppt(1) > 0
    T_mech(1) = P_mech(1) / omega_mppt(1);
else
    T_mech(1) = 0;
end

P_elec(1) = P_mech(1);
T_elec(1) = T_mech(1);

% 比例控制系数
Kp_T = 2e5;

%% MPPT控制循环
for i = 2:length(time)
    
    v = v_sim(i);
    
    omega_opt_track(i) = lambda_opt * v / R;
    
    lambda_current = omega_mppt(i-1) * R / v;
    
    %----------------------------------------------------------------------
    % [学生完成部分1] 计算当前叶尖速比下的风能利用系数Cp
    %----------------------------------------------------------------------
    Cp_current = calc_Cp(lambda_current, beta);
    
    Cp_track(i) = Cp_current;
    
    %----------------------------------------------------------------------
    % [学生完成部分2] 计算当前风速下的机械功率和机械转矩
    %----------------------------------------------------------------------
    P_mech(i) = 0.5 * rho * pi * R^2 * Cp_current * v^3;
    
    if omega_mppt(i-1) > 0
        T_mech(i) = P_mech(i) / omega_mppt(i-1);
    else
        T_mech(i) = 0;
    end
    
    %----------------------------------------------------------------------
    % [学生完成部分3] 最佳叶尖速比控制的核心算法
    %----------------------------------------------------------------------
    if omega_mppt(i-1) > 0
        
        % 实际转速与最优转速的偏差
        % 若 speed_error > 0，说明实际转速偏高，需要增加电磁转矩使其减速
        % 若 speed_error < 0，说明实际转速偏低，需要减小电磁转矩使其加速
        speed_error = omega_mppt(i-1) - omega_opt_track(i);
        
        % 比例控制调节转矩
        T_adjust = Kp_T * speed_error;
        
        % 参考电磁转矩
        T_elec(i) = T_mech(i) + T_adjust;
        
        % 限制电磁转矩在合理范围内
        T_elec(i) = max(0, min(T_elec(i), P_rated/omega_rated*1.2));
        
    else
        T_elec(i) = 0;
    end
    
    P_elec(i) = T_elec(i) * omega_mppt(i-1);
    
    %----------------------------------------------------------------------
    % [学生完成部分4] 风机转速动态响应计算
    %----------------------------------------------------------------------
    omega_dot = (T_mech(i) - T_elec(i)) / J;
    
    omega_mppt(i) = omega_mppt(i-1) + omega_dot * dt;
    
    omega_mppt(i) = max(0.2*omega_rated, min(omega_mppt(i), 1.2*omega_rated));
end

%% 6. 结果可视化
figure(3);

subplot(4,1,1);
plot(time, v_sim, 'LineWidth', 1.2);
grid on;
xlabel('时间 (s)');
ylabel('风速 (m/s)');
title('风速变化');

subplot(4,1,2);
plot(time, omega_mppt/omega_rated, 'b-', ...
     time, omega_opt_track/omega_rated, 'r--', 'LineWidth', 1.2);
grid on;
xlabel('时间 (s)');
ylabel('转速标幺值');
legend('实际转速', '理论最优转速', 'Location', 'best');
title('最佳叶尖速比法转速跟踪');

subplot(4,1,3);
plot(time, P_mech/P_rated, 'b-', ...
     time, P_elec/P_rated, 'r--', 'LineWidth', 1.2);
grid on;
xlabel('时间 (s)');
ylabel('功率标幺值');
legend('机械功率', '电磁功率', 'Location', 'best');
title('功率对比');

subplot(4,1,4);
lambda_actual = omega_mppt .* R ./ v_sim;
plot(time, lambda_actual, 'b-', ...
     time, ones(size(time))*lambda_opt, 'r--', 'LineWidth', 1.2);
grid on;
xlabel('时间 (s)');
ylabel('叶尖速比');
legend('实际叶尖速比', '最佳叶尖速比', 'Location', 'best');
title('叶尖速比跟踪');

%% 7. 性能评估
fprintf('\n性能评估:\n');

lambda_error = abs(lambda_actual - lambda_opt);
fprintf('- 平均叶尖速比误差: %.4f\n', mean(lambda_error));

fprintf('- 平均风能利用系数Cp: %.4f (理论最大: %.4f)\n', ...
    mean(Cp_track), Cp_at_lambda_opt);

fprintf('- Cp误差百分比: %.2f%%\n', ...
    (Cp_at_lambda_opt - mean(Cp_track)) / Cp_at_lambda_opt * 100);

% 注意：trapz(time, P) 已经是对时间积分，单位为 J，不需要再乘 dt
E_mechanical = trapz(time, P_mech);
E_electrical = trapz(time, P_elec);

fprintf('- 总机械能量: %.4f MWh\n', E_mechanical/3.6e9);
fprintf('- 总电气能量: %.4f MWh\n', E_electrical/3.6e9);
fprintf('- 电气/机械能量比: %.2f%%\n', E_electrical/E_mechanical*100);

%% 8. 风能利用系数计算函数
function Cp = calc_Cp(lambda, beta)
    lambda_i = 1 / (1/(lambda + 0.08*beta) - 0.035/(beta^3 + 1));
    
    Cp = 0.5 * (116/lambda_i - 0.4*beta - 5) * exp(-21/lambda_i);
    
    Cp = max(0, Cp);
end