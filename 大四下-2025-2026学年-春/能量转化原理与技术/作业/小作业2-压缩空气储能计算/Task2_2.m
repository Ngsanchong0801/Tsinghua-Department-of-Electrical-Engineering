%% 三级压缩系统温度计算程序
clear; clc;

% ================== 1. 系统参数设置 ==================
T0 = 298;           % 初始环境温度 (K)
T_cool = 293;       % 冷却介质温度 (K)
epsilon = 0.7;      % 冷却效率
beta_total = 70;    % 总压缩比
n_stages = 3;       % 压缩级数
k = 1.4;            % 绝热指数 (空气)
cp = 1.005;         % kJ/(kg*K)
w_stage = zeros(1, n_stages);

% ================== 2. 计算单级参数 ==================
% 单级压比 beta_sin = beta_total^(1/n_stages)
% 对应的温度升高倍数 tau = beta_sin^((k-1)/k)
tau = beta_total^((k-1) / (n_stages * k));

% 初始化结果存储（用于绘图或记录）
T_in = zeros(1, n_stages);
T_out = zeros(1, n_stages);

% ================== 3. 迭代计算 ======================
current_Tin = T0;

fprintf('--- 三级压缩系统计算结果 ---\n');
fprintf('级数\t进口温度(K)\t出口温度(K)\t出口温度(°C)\n');

for i = 1:n_stages
    T_in(i) = current_Tin;
    
    % 压缩过程
    T_out(i) = T_in(i) * tau;
    
    % 打印当前级结果
    fprintf('%d\t\t%.2f\t\t%.2f\t\t%.2f\n', i, T_in(i), T_out(i), T_out(i)-273.15);
    
    % 冷却过程 (计算下一级的进口温度)
    if i < n_stages
        current_Tin = T_out(i) - epsilon * (T_out(i) - T_cool);
    end

    % 计算该级功耗 (kJ/kg)
    w_stage(i) = cp * (T_out(i) - T_in(i));
end

w_total = sum(w_stage);
fprintf('总单位功耗为: %.2f kJ/kg\n', w_total);
