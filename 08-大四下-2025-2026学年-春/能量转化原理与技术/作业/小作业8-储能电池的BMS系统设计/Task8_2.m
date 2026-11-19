clc;
clear;
close all;

%% ===============================
%  2. 均衡电路设计仿真
%% ===============================

% 电池容量 Ah
C = [300; 330; 340];

% 初始 SOC
SOC0 = [0.1; 0.1; 0.1];

% 充电电流 A
I_charge = 30;

% 充电时间 8 h
t_total = 8 * 3600;

% 仿真步长 60 s
dt = 60;

% 时间向量
t = 0:dt:t_total;
N = length(t);

% 均衡电阻
R_bal = 0.2;

% 均衡阈值
deltaU = 0.01;

% 每 10 min 检测一次
check_interval = 10 * 60;

%% 开路电压函数
U_oc = @(SOC) -0.7644 .* exp(-26.6346 .* SOC) ...
    + 3.2344 ...
    + 0.4834 .* SOC ...
    - 1.2057 .* SOC.^2 ...
    + 0.9641 .* SOC.^3;

%% ===============================
%  1. 无均衡情况
%% ===============================

SOC_no_bal = SOC0;

SOC_no_bal_hist = zeros(3, N);
U_no_bal_hist = zeros(3, N);

SOC_no_bal_hist(:, 1) = SOC_no_bal;
U_no_bal_hist(:, 1) = U_oc(SOC_no_bal);

for k = 2:N

    % 三块电池串联，充电电流相同
    dSOC = I_charge * dt ./ (C * 3600);

    SOC_no_bal = SOC_no_bal + dSOC;

    % 限制 SOC 不超过 1
    SOC_no_bal(SOC_no_bal > 1) = 1;

    % 保存数据
    SOC_no_bal_hist(:, k) = SOC_no_bal;
    U_no_bal_hist(:, k) = U_oc(SOC_no_bal);

end

%% ===============================
%  2. 有均衡情况
%% ===============================

SOC_bal = SOC0;

SOC_bal_hist = zeros(3, N);
U_bal_hist = zeros(3, N);

SOC_bal_hist(:, 1) = SOC_bal;
U_bal_hist(:, 1) = U_oc(SOC_bal);

for k = 2:N

    % 充电引起的 SOC 增加
    dSOC_charge = I_charge * dt ./ (C * 3600);
    SOC_bal = SOC_bal + dSOC_charge;

    % 当前电压
    U_now = U_oc(SOC_bal);
    U_avg = mean(U_now);

    % 每 10 min 判断一次是否需要均衡
    if mod(t(k), check_interval) == 0

        for i = 1:3

            % 若该电池电压高于平均电压 0.01 V 以上，则闭合均衡开关
            if U_now(i) - U_avg > deltaU

                % 均衡电流
                I_bal = U_now(i) / R_bal;

                % 均衡放电导致 SOC 减少
                dSOC_bal = I_bal * dt / (C(i) * 3600);

                SOC_bal(i) = SOC_bal(i) - dSOC_bal;

            end

        end

    end

    % 限制 SOC 范围
    SOC_bal(SOC_bal > 1) = 1;
    SOC_bal(SOC_bal < 0) = 0;

    % 保存数据
    SOC_bal_hist(:, k) = SOC_bal;
    U_bal_hist(:, k) = U_oc(SOC_bal);

end

%% ===============================
%  3. 绘制 SOC 曲线
%% ===============================

figure;

plot(t/3600, SOC_no_bal_hist(1, :) * 100, 'LineWidth', 1.2);
hold on;
plot(t/3600, SOC_no_bal_hist(2, :) * 100, 'LineWidth', 1.2);
plot(t/3600, SOC_no_bal_hist(3, :) * 100, 'LineWidth', 1.2);

plot(t/3600, SOC_bal_hist(1, :) * 100, '--', 'LineWidth', 1.2);
plot(t/3600, SOC_bal_hist(2, :) * 100, '--', 'LineWidth', 1.2);
plot(t/3600, SOC_bal_hist(3, :) * 100, '--', 'LineWidth', 1.2);

grid on;
xlabel('时间 / h');
ylabel('SOC / %');
title('无均衡与有均衡情况下三块电池 SOC 变化曲线');

legend( ...
    'BT1 无均衡', 'BT2 无均衡', 'BT3 无均衡', ...
    'BT1 有均衡', 'BT2 有均衡', 'BT3 有均衡', ...
    'Location', 'best');

%% ===============================
%  4. 绘制电压曲线
%% ===============================

figure;

plot(t/3600, U_no_bal_hist(1, :), 'LineWidth', 1.2);
hold on;
plot(t/3600, U_no_bal_hist(2, :), 'LineWidth', 1.2);
plot(t/3600, U_no_bal_hist(3, :), 'LineWidth', 1.2);

plot(t/3600, U_bal_hist(1, :), '--', 'LineWidth', 1.2);
plot(t/3600, U_bal_hist(2, :), '--', 'LineWidth', 1.2);
plot(t/3600, U_bal_hist(3, :), '--', 'LineWidth', 1.2);

grid on;
xlabel('时间 / h');
ylabel('电池开路电压 / V');
title('无均衡与有均衡情况下三块电池电压变化曲线');

legend( ...
    'BT1 无均衡', 'BT2 无均衡', 'BT3 无均衡', ...
    'BT1 有均衡', 'BT2 有均衡', 'BT3 有均衡', ...
    'Location', 'best');

%% ===============================
%  5. 输出充电结束时 SOC 和电压
%% ===============================

fprintf('\n========== 无均衡充电结束结果 ==========\n');
for i = 1:3
    fprintf('BT%d: SOC = %.4f%%, U = %.4f V\n', ...
        i, SOC_no_bal_hist(i, end) * 100, U_no_bal_hist(i, end));
end

fprintf('\n========== 有均衡充电结束结果 ==========\n');
for i = 1:3
    fprintf('BT%d: SOC = %.4f%%, U = %.4f V\n', ...
        i, SOC_bal_hist(i, end) * 100, U_bal_hist(i, end));
end