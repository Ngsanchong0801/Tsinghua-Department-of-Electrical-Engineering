clear;
clc;
x = [0.919	0.945	0.951	0.954	0.957	0.981	0.988	1.001	1.004	1.005	1.009	1.012	1.018	1.031	1.048]';
y = [52	79	100	119	132	147	154	157	154	147	136 121 103 78 54]';
x2 =[0.919	0.945	0.951	0.954	0.957	0.981	0.988	1.001	1.004	1.005	1.009	1.012	1.018	1.031	1.048]';
y2 = [32 45	58	71	80	86	90	91	89	86	77	70	58	46	31]';
model = fittype('a * exp(-((x - b)^2) / (2 * c^2))', 'independent', 'x', 'dependent', 'y');
P = fit(x, y, model);   % 进行拟合
P2 = fit(x2,y2,model);
xi = linspace(min(x), max(x), 100);
xi2 = linspace(min(x2), max(x2), 100);
yi = P(xi);  % 求对应的 y 值
yi2 = P2(xi2);
plot(xi, yi, 'r', 'LineWidth', 1);  % 绘制第一条曲线，红色
hold on;  % 保持图形，以绘制第二条曲线
plot(xi2, yi2, 'b', 'LineWidth', 1);  % 绘制第二条曲线，蓝色
% 添加标签和图例
xlabel('\omega/\omega_0');
ylabel('\theta_m');
legend('\xi=0.0151', '\xi=0.0246');

% 显示图形
grid on;  % 显示网格
title('幅频特性曲线');
hold off;  % 取消保持图形状态
