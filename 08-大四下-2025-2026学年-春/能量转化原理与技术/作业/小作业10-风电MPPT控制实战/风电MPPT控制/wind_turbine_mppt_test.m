%% 风力发电机最佳叶尖速比MPPT控制仿真 - 教学版
% 本程序用于模拟风力发电机在变化风速下的最佳叶尖速比MPPT控制方法
% 部分核心代码需要同学们自行完成，以加深对风力发电机MPPT控制原理的理解

clc;
clear all;
close all;

%% 1. 风力发电机基本参数设置
% 风机物理参数
rho = 1.25;       % 空气密度，kg/m^3
R = 26.335;       % 叶轮半径，m
J = 1.12e6;       % 风轮转动惯量，kg·m²
beta = 0.01;      % 桨距角，假设为0.01rad（最大功率区域）

%% 2. 计算最佳叶尖速比和最大风能利用系数
% 最佳叶尖速比是风力发电机获取最大风能的关键参数
lambda_range = 2:0.01:15;  % 计算范围
Cp_values = zeros(size(lambda_range));

% 计算不同lambda值下的Cp
for i = 1:length(lambda_range)
    Cp_values(i) = calc_Cp(lambda_range(i), beta);
end

    %----------------------------------------------------------------------
    % [学生完成部分0] 找到最大Cp和对应的lambda_opt
    %----------------------------------------------------------------------
    lambda_opt = 0;    % 请替换此处代码
    Cp_max=0;    % 请替换此处代码
% 输出最佳叶尖速比和最大风能利用系数
fprintf('最佳叶尖速比 λ_opt = %.4f\n', lambda_opt);
fprintf('最大风能利用系数 Cp_max = %.4f\n', Cp_max);

%% 3. 风机在额定风速时的最大功率和最优转速计算
v_10 = 10;       % 风速为10 m/s

% 最佳转速计算 
omega_opt_10 = lambda_opt * v_10 / R;  % rad/s

% 计算最大风能利用系数(在最佳叶尖速比处)
Cp_at_lambda_opt = calc_Cp(lambda_opt, beta);

% 最大功率计算
P_max_10 = 0.5 * rho * pi * R^2 * Cp_at_lambda_opt * v_10^3;  % W

% 显示结果
fprintf('当风速为10 m/s时:\n');
fprintf('- 最大功率 = %.4f MW \n', P_max_10/1e6);
fprintf('- 最优转速 = %.4f rad/s \n', omega_opt_10);
fprintf('- 最大风能利用系数 Cp = %.4f\n', Cp_at_lambda_opt);

%% 4. 绘制风机最大功率曲线
v_range = 3:0.5:11;  % 风速范围从3到11 m/s
omega_range = [];    % 初始化转速数组
P_max_range = [];    % 初始化功率数组

% 计算不同风速下的最大功率和对应转速
for v = v_range
    % 最佳转速计算 (保持最佳叶尖速比λ = lambda_opt)
    omega_opt = lambda_opt * v / R;  % rad/s
    
    % 最大功率计算（使用最大Cp值）
    P_max = 0.5 * rho * pi * R^2 * Cp_at_lambda_opt * v^3;  % W
    
    % 存储结果
    omega_range = [omega_range, omega_opt];
    P_max_range = [P_max_range, P_max];
end

% 绘制风机最大功率曲线
figure(1);
plot(omega_range, P_max_range/1e6, 'b-', 'LineWidth', 2);
grid on;
xlabel('转速 (rad/s)');
ylabel('功率 (MW)');
title('风机最大功率曲线（最佳叶尖速比）');

% 拟合最大功率曲线 P = K * omega^3
P_rated = max(P_max_range);
omega_rated = max(omega_range);
K_opt = P_max_range(end) / omega_range(end)^3;
omega_fit = linspace(min(omega_range), max(omega_range), 100);
P_fit = K_opt * omega_fit.^3;

% 在图上添加拟合曲线
plot(omega_fit, P_fit/1e6, 'r--', 'LineWidth', 1.5);
legend('实际最大功率曲线');
title('风机最大功率曲线');

% 绘制不同叶尖速比下的Cp曲线
figure(2);
lambda_vals = 2:0.1:14;
Cp_vals = zeros(size(lambda_vals));
for i = 1:length(lambda_vals)
    Cp_vals(i) = calc_Cp(lambda_vals(i), beta);
end
plot(lambda_vals, Cp_vals, 'b-', 'LineWidth', 2);
grid on;
xlabel('叶尖速比 λ');
ylabel('风能利用系数 Cp');
title('风能利用系数Cp与叶尖速比λ的关系');
hold on;
plot(lambda_opt, Cp_at_lambda_opt, 'ro', 'MarkerSize', 8, 'LineWidth', 2);
text(lambda_opt+0.5, Cp_at_lambda_opt, ['λ_{opt}=' num2str(lambda_opt) ', Cp_{max}=' num2str(Cp_at_lambda_opt, '%.4f')]);

%% 5. 最佳叶尖速比MPPT控制仿真
% 在此部分我们将实现最佳叶尖速比控制法的模拟

% 模拟参数设置
sim_time = 200;             % 模拟时间，秒
dt = 0.1;                   % 时间步长，秒
time = 0:dt:sim_time;       % 时间序列
 
% 生成变化的风速序列（添加随机波动）
v_base = 8;                 % 基础风速，m/s
v_variation = 3;            % 风速变化幅度，m/s
v_sim = v_base + v_variation * sin(2*pi*time/60) + 0.5*randn(size(time));
v_sim = max(3, min(v_sim, 11));  % 限制风速在3-11 m/s范围内

% 初始化变量
omega_mppt = zeros(size(time));   % 实际转速
P_mech = zeros(size(time));       % 机械功率
P_elec = zeros(size(time));       % 电磁功率
T_mech = zeros(size(time));       % 机械转矩
T_elec = zeros(size(time));       % 电磁转矩
omega_opt_track = zeros(size(time)); % 理论最优转速
Cp_track = zeros(size(time));     % 风能利用系数

% 设置初始转速（假设系统初始时接近最佳转速）
v_init = v_sim(1);
omega_mppt(1) = lambda_opt * v_init / R;
omega_opt_track(1) = omega_mppt(1);

% 计算初始叶尖速比和Cp
lambda_init = omega_mppt(1) * R / v_init;
Cp_init = calc_Cp(lambda_init, beta);
Cp_track(1) = Cp_init;

% 计算初始机械功率和转矩
P_mech(1) = 0.5 * rho * pi * R^2 * Cp_init * v_init^3;
if omega_mppt(1) > 0
    T_mech(1) = P_mech(1) / omega_mppt(1);
else
    T_mech(1) = 0;
end

% 初始电磁功率和转矩 (假设初始时等于机械功率)
P_elec(1) = P_mech(1);
T_elec(1) = T_mech(1);

% MPPT控制循环
for i = 2:length(time)
    v = v_sim(i);  % 当前风速
    
    % 计算当前风速下的理论最优转速
    omega_opt_track(i) = lambda_opt * v / R;
    
    % 计算当前叶尖速比
    lambda_current = omega_mppt(i-1) * R / v;
    
    %----------------------------------------------------------------------
    % [学生完成部分1] 计算当前叶尖速比下的风能利用系数Cp
    % 提示：使用calc_Cp函数计算给定叶尖速比和桨距角下的风能利用系数
    %----------------------------------------------------------------------
    % 请在此处补充代码
    Cp_current = 0; % 此行需要替换为你的代码
    
    Cp_track(i) = Cp_current;
    
    %----------------------------------------------------------------------
    % [学生完成部分2] 计算当前风速下的机械功率和机械转矩
    % 提示：风机捕获的机械功率公式: P = 0.5 * ρ * π * R^2 * Cp * v^3
    %      机械转矩公式: T = P / ω
    %----------------------------------------------------------------------
    % 请在此处补充代码
    P_mech(i) = 0; % 此行需要替换为你的代码
    
    if omega_mppt(i-1) > 0
        T_mech(i) = 0; % 此行需要替换为你的代码
    else
        T_mech(i) = 0;
    end
    
    %----------------------------------------------------------------------
    % [学生完成部分3] 最佳叶尖速比控制的核心算法
    % 目标：计算参考电磁转矩，使风机转速跟踪最优转速（即最佳叶尖速比）
    % 提示：
    % 1. 计算当前转速和最优转速之间的偏差
    % 2. 使用比例控制来调整电磁转矩（T_adjust = K * speed_error）
    % 3. 参考电磁转矩 = 机械转矩 + 调整转矩
    % 4. 控制逻辑：若转速低于最优值，降低电磁转矩；若转速高于最优值，增加电磁转矩
    %----------------------------------------------------------------------
    % 请在此处补充代码
    
    if omega_mppt(i-1) > 0
        % 计算转速偏差
        speed_error = 0; % 此行需要替换为你的代码
        
        % 计算调整转矩
        T_adjust = 0; % 此行需要替换为你的代码
        
        % 设定参考电磁转矩
        T_elec(i) = 0; % 此行需要替换为你的代码
        
        % 限制转矩在合理范围内
        T_elec(i) = max(0, min(T_elec(i), P_rated/omega_rated*1.2));
    else
        T_elec(i) = 0;
    end
    
    % 计算电磁功率
    P_elec(i) = T_elec(i) * omega_mppt(i-1);
    
    %----------------------------------------------------------------------
    % [学生完成部分4] 风机转速动态响应计算
    % 提示：根据转动惯量方程 J * dω/dt = T_mech - T_elec 计算转速变化
    %      新转速 = 旧转速 + (dω/dt) * dt
    %----------------------------------------------------------------------
    % 请在此处补充代码
    omega_dot = 0; % 此行需要替换为你的代码
    omega_mppt(i) = 0; % 此行需要替换为你的代码
    
    % 应用转速限制
    omega_mppt(i) = max(0.2*omega_rated, min(omega_mppt(i), 1.2*omega_rated));
end

%% 6. 结果可视化
% 绘制风速变化和转速跟踪
figure(3);
subplot(4,1,1);
plot(time, v_sim);
grid on;
xlabel('时间 (s)');
ylabel('风速 (m/s)');
title('风速变化');

% 绘制转速跟踪
subplot(4,1,2);
plot(time, omega_mppt/omega_rated, 'b-', time, omega_opt_track/omega_rated, 'r--');
grid on;
xlabel('时间 (s)');
ylabel('转速标幺值');
legend('实际转速', '理论最优转速');
title('最佳叶尖速比法转速跟踪');

% 绘制功率
subplot(4,1,3);
plot(time, P_mech/P_rated, 'b-', time, P_elec/P_rated, 'r--');
grid on;
xlabel('时间 (s)');
ylabel('功率标幺值');
legend('机械功率', '电磁功率');
title('功率对比');

% 绘制叶尖速比
subplot(4,1,4);
lambda_actual = omega_mppt .* R ./ v_sim;
plot(time, lambda_actual, 'b-', time, ones(size(time))*lambda_opt, 'r--');
grid on;
xlabel('时间 (s)');
ylabel('叶尖速比');
legend('实际叶尖速比', '最佳叶尖速比');
title('叶尖速比跟踪');

% 计算性能指标
fprintf('\n性能评估:\n');
% 平均叶尖速比误差
lambda_error = abs(lambda_actual - lambda_opt);
fprintf('- 平均叶尖速比误差: %.4f\n', mean(lambda_error));

% 平均风能利用系数
fprintf('- 平均风能利用系数Cp: %.4f (理论最大: %.4f)\n', mean(Cp_track), Cp_at_lambda_opt);
fprintf('- Cp误差百分比: %.2f%%\n', (Cp_at_lambda_opt-mean(Cp_track))/Cp_at_lambda_opt*100);

% 总能量捕获效率
E_mechanical = trapz(time, P_mech) * dt;
E_electrical = trapz(time, P_elec) * dt;
fprintf('- 总电气能量: %.2f MWh\n', E_electrical/3.6e9);
fprintf('- 电气/机械能量比: %.2f%%\n', E_electrical/E_mechanical*100);

%% 计算风能利用系数的函数
function Cp = calc_Cp(lambda, beta)
    % 风能利用系数计算函数
    % 输入:
    %   lambda - 叶尖速比
    %   beta - 桨距角 (rad)
    % 输出:
    %   Cp - 风能利用系数
    
    % 计算lambda_i参数
    lambda_i = 1 / (1/(lambda + 0.08*beta) - 0.035/(beta^3+1));
    
    % 计算Cp (使用风机Cp-lambda模型)
    Cp = 0.5 * (116/lambda_i - 0.4*beta - 5) * exp(-21/lambda_i);
    
    % 限制Cp在合理范围内
    Cp = max(0, Cp);
end 