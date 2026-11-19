clear;
clc;
% 定义范围
T = 300:1:370;        % 温度 (K)
p = 5:1:100;          % 压力 (bar)
[T_grid, P_grid] = meshgrid(T, p);

% 常数
R = 8.314e-3;         % kJ/(mol*K)
F = 96.485;           % kJ/(V*mol) (法拉第常数)
p_std = 1;            % bar

% 计算 Delta G (T, p_std)
dG_std = -237.13 + 0.164 .* (T_grid - 298.15);

% 计算 Delta G (T, p)
dG = dG_std - (3/2) .* R .* T_grid .* log(P_grid ./ p_std);

% 计算电压 E (V)
E = -dG ./ (2 * F);

% 绘图
figure;
surf(T_grid, P_grid, E);
xlabel('温度 T (K)');
ylabel('压力 p (bar)');
zlabel('电压 E (V)');
title('氢氧燃料电池电压三维曲面图');
colorbar;
grid on;

% 计算典型条件 (340K, 20bar) 下的电压
T_tip = 340;
p_tip = 20;
dG_tip_std = -237.13 + 0.164 * (T_tip - 298.15);
dG_tip = dG_tip_std - (3/2) * R * T_tip * log(p_tip / p_std);
E_tip = -dG_tip / (2 * F);

fprintf('在 340K, 20bar 下的电压为: %.4f V\n', E_tip);