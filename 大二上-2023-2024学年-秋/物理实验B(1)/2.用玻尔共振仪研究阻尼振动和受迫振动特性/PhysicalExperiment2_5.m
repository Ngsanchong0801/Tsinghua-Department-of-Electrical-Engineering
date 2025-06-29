clear;
clc;

x = [0.919 0.945 0.951 0.954 0.957 0.981 0.988 1.001 1.004 1.005 1.009 1.012 1.018 1.031 1.048]';
y = [20 30 40 51 60 70 78 88 100 109 118 132 139 150 159]';
x2 = [0.926 0.940 0.954 0.967 0.972 0.977 0.981 0.988 0.999 1.000 1.009 1.021 1.046 1.072 1.096]';
y2 = [21 29 39 50 62 69 78 89 100 111 122 130 140 150 160]';

model = fittype('a * exp(-((x - b)^2) / (2 * c^2))', 'independent', 'x', 'dependent', 'y');
P = fit(x, y, model);   % 进行拟合
P2 = fit(x2, y2, model);

xi = linspace(min(x), max(x), 1000);  % 增加生成曲线的点数
xi2 = linspace(min(x2), max(x2), 1000);  % 增加生成曲线的点数

yi = P(xi);  % 求对应的 y 值
yi2 = P2(xi2);

plot(xi, yi, 'r', 'LineWidth', 1);  % 绘制第一条曲线，红色
hold on;  % 保持图形，以绘制第二条曲线
plot(xi2, yi2, 'b', 'LineWidth', 1);  % 绘制第二条曲线，蓝色

% 添加标签和图例
xlabel('\omega/\omega_0');
ylabel('\theta_m');
legend('\xi=0.0151', '\xi=0.0246');
xlim([min(x) max(x2)]);  % 根据数据范围设置 x 轴的显示范围

grid on;  % 显示网格
title('相频特性曲线');
hold off;  % 取消保持图形状态