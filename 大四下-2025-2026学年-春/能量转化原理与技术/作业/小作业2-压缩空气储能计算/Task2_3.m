clear; clc;

% ================== 参数定义 ==================
V = 1892;           % 储气室体积 (m^3)
p0 = 1e5;           % 初始压力 (Pa)
R = 287;            % 空气气体常数 (J/kg*K)
T0 = 298;           % 环境温度 (K)
T_cool = 293;       % 冷却介质温度 (K)
P_in = 1.5e6;       % 输入功率 (W)
epsilon = 0.7;      % 冷却效率
k = 1.4;            % 绝热指数
cp = 1005;          % 定压比热 (J/kg*K)
beta_final = 70;    % 最终压比

% ================== 定义单位功函数 L(beta) ==================
% 该函数计算当总压比为 b 时，压缩 1kg 空气所需的总功
L_func = @(b) calculate_L(b, T0, T_cool, epsilon, k, cp);

% ================== 执行数值积分 ==================
% 时间 t = (p0*V / (P_in*R*T0)) * integral( L(beta) dbeta )
A = (p0 * V) / (P_in * R * T0);
t_seconds = A * integral(@(b) arrayfun(L_func, b), 1, beta_final);
t_hours = t_seconds / 3600;

fprintf('--- 数值积分结果 ---\n');
fprintf('A 系数 (基于 T0): %.6f\n', A);
fprintf('实际运行时间 t: %.2f 小时\n', t_hours);

% ================== 辅助函数：计算瞬时功 ==================
function L = calculate_L(b, T0, T_cool, epsilon, k, cp)
    beta_s = b^(1/3); % 当前时刻的单级压比
    tau = beta_s^((k-1)/k);
    
    % 第一级
    Tin1 = T0;
    Tout1 = Tin1 * tau;
    % 第二级
    Tin2 = Tout1 - epsilon * (Tout1 - T_cool);
    Tout2 = Tin2 * tau;
    % 第三级
    Tin3 = Tout2 - epsilon * (Tout2 - T_cool);
    Tout3 = Tin3 * tau;
    
    % 总单位功 (J/kg)
    L = cp * ((Tout1-Tin1) + (Tout2-Tin2) + (Tout3-Tin3));
end