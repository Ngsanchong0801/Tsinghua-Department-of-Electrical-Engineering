% 重力儲能塔效率分析
clear; clc;

%% 1. 參數定義
m = 70e3;           % 質量 (kg)
H = 148;            % 高度 (m)
g = 9.8;            % 重力加速度 (m/s^2)
eta_G = 0.94;       % 電機效率
eta_inv = 0.95;     % 變流器效率
eta_motor = 0.95;   % 齒輪箱效率 (題目標記為 motor)
eta_sys = eta_G * eta_inv * eta_motor; % 總效率係數

rho = 1.225;        % 空氣密度 (kg/m^3)
Ab = 40;            % 迎風面積 (m^2)
Cw = 0.45;          % 空氣阻力係數
mu = 0.02;          % 滑動摩擦係數

T_total = 10;       % 總時間 (s)
dt = 0.01;          % 時間步長
t = 0:dt:T_total;

%% 2. 方案一：三角形速度曲線 (0->5s 加速到 30, 5->10s 減速到 0)
v1 = zeros(size(t));
a1 = zeros(size(t));
for i = 1:length(t)
    if t(i) <= 5
        a1(i) = 30 / 5;
        v1(i) = a1(i) * t(i);
    else
        a1(i) = -30 / 5;
        v1(i) = 30 + a1(i) * (t(i) - 5);
    end
end

%% 3. 方案二：梯形速度曲線 (0.5s 加速到 15, 9s 勻速, 0.5s 減速)
v2 = zeros(size(t));
a2 = zeros(size(t));
for i = 1:length(t)
    if t(i) <= 0.5
        a2(i) = 15 / 0.5;
        v2(i) = a2(i) * t(i);
    elseif t(i) <= 9.5
        a2(i) = 0;
        v2(i) = 15;
    else
        a2(i) = -15 / 0.5;
        v2(i) = 15 + a2(i) * (t(i) - 9.5);
    end
end

%% 4. 功率與效率計算
% 計算機械功率 P_mech = F * v
% F = mg + mu*mg + 0.5*Cw*rho*Ab*v^2 + m*a
P_mech1 = (m*g + mu*m*g + 0.5*Cw*rho*Ab*v1.^2 + m*a1) .* v1;
P_mech2 = (m*g + mu*m*g + 0.5*Cw*rho*Ab*v2.^2 + m*a2) .* v2;

% 輸入電功率 (考慮傳動效率)
P_elec1 = P_mech1 / eta_sys;
P_elec2 = P_mech2 / eta_sys;

% 使用 trapz 計算總電能消耗 (J)
E_in1 = trapz(t, P_elec1);
E_in2 = trapz(t, P_elec2);

% 儲存的勢能 (J)
E_p = m * g * H;

% 計算效率
eta1 = (E_p / E_in1) * 100;
eta2 = (E_p / E_in2) * 100;

%% 5. 繪圖
figure('Color', 'w', 'Position', [100, 100, 1000, 400]);

subplot(1,2,1);
plot(t, v1, 'r', 'LineWidth', 1.5); hold on;
plot(t, v2, 'b', 'LineWidth', 1.5);
title('速度曲線 v(t)'); xlabel('時間 (s)'); ylabel('速度 (m/s)');
legend('方案一', '方案二'); grid on;

subplot(1,2,2);
plot(t, P_elec1/1e6, 'r', 'LineWidth', 1.5); hold on;
plot(t, P_elec2/1e6, 'b', 'LineWidth', 1.5);
title('功率曲線 P(t)'); xlabel('時間 (s)'); ylabel('功率 (MW)');
legend(sprintf('方案一 (%.2f%%)', eta1), sprintf('方案二 (%.2f%%)', eta2));
grid on;

fprintf('方案一效率: %.4f%%\n', eta1);
fprintf('方案二效率: %.4f%%\n', eta2);