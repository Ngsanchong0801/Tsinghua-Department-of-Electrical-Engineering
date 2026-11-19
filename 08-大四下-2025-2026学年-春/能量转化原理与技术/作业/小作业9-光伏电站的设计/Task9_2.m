clc; clear; close all;

%% 作业8 第（2）问：计算单位面积功率密度、光电转换效率、所需硅片数量和占地面积

%% 已知参数
G  = 800;          % 实际光照强度 W/m^2
G0 = 1000;         % 参考光照强度 W/m^2
UT = 26e-3;        % 温度电压 V

% 第（1）问选择 N 型硅片
Iph0 = 9.20;       % N型硅片参考光生电流 A
Is   = 3.71e-12;   % N型硅片反向饱和电流 A

% 硅片尺寸
L = 150e-3;        % 长度 m
W = 180e-3;        % 宽度 m
A_cell = L * W;    % 单片硅片面积 m^2

% 光伏电站目标功率
P_required = 5e6;  % 5 MW = 5×10^6 W

%% 计算实际光照下的光生电流
Iph = (G / G0) * Iph0;

%% 计算开路电压
Voc = UT * log(Iph / Is + 1);

%% 扫描电压，计算功率-电压曲线
U = linspace(0, Voc, 2000);

I = Iph - Is .* (exp(U ./ UT) - 1);
P = U .* I;

%% 找最大功率点
[Pmax, idx] = max(P);
Ump = U(idx);
Imp = I(idx);

%% 计算单位面积功率密度
power_density = Pmax / A_cell;     % W/m^2

%% 计算光电转换效率
% 光电转换效率 = 输出最大功率 / 入射光功率
% 入射光功率 = 光照强度 × 单片硅片面积
Pin = G * A_cell;
eta = Pmax / Pin;

%% 计算所需硅片数量
N_cell = ceil(P_required / Pmax);

%% 计算占地面积
% 这里按理想情况计算，即仅考虑硅片总面积，不考虑支架间距、维护通道、倾角阴影等工程因素
A_total = N_cell * A_cell;

%% 输出结果
fprintf('========== 第（2）问计算结果 ==========\n');
fprintf('所选硅片类型：N型硅片\n\n');

fprintf('单片硅片面积 A_cell = %.6f m^2\n', A_cell);
fprintf('最大功率点电压 Ump = %.4f V\n', Ump);
fprintf('最大功率点电流 Imp = %.4f A\n', Imp);
fprintf('单片最大输出功率 Pmax = %.4f W\n\n', Pmax);

fprintf('单位面积功率密度 = %.4f W/m^2\n', power_density);
fprintf('光电转换效率 eta = %.4f\n', eta);
fprintf('光电转换效率 eta = %.2f %%\n\n', eta * 100);

fprintf('目标发电功率 = %.2f MW\n', P_required / 1e6);
fprintf('至少需要硅片数量 = %d 片\n', N_cell);
fprintf('硅片总占地面积 = %.4f m^2\n', A_total);

%% 绘制所选 N 型硅片功率-电压曲线
figure;
plot(U, P, 'LineWidth', 1.8); hold on;
plot(Ump, Pmax, 'o', 'MarkerSize', 8, 'LineWidth', 1.8);

grid on;
xlabel('电压 U / V');
ylabel('功率 P / W');
title('N型硅片在 G = 800 W/m^2 下的功率-电压曲线');
legend('N型硅片 P-U 曲线', '最大功率点', 'Location', 'best');