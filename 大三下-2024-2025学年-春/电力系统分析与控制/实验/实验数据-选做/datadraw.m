data=short;

% 截取 Domain 在 [5, 15] 范围内的数据
data = data(data.Domain >= 5 & data.Domain <= 25, :);
% 创建图形窗口并设置整体布局
figure('Color', 'white', 'Position', [100, 100, 800, 900]);  
tiledlayout(5, 1, 'TileSpacing', 'compact', 'Padding', 'compact');  % 5行1列紧凑布局[6,7](@ref)

% 自定义颜色方案（使用SCI配色）
colors = lines(7);  % 创建7种独特颜色
lineWidth = 1.5;    % 统一线宽

%% 第一张图：TERMINAL VOLTAGE和U1
nexttile;
hold on;
plot(data.Domain, data.('TERMINALVOLTAGE'), 'Color', colors(1,:), 'LineWidth', lineWidth, 'DisplayName', 'TERMINAL VOLTAGE');
plot(data.Domain, data.U1, 'Color', colors(2,:), 'LineWidth', lineWidth, 'LineStyle', '--', 'DisplayName', 'U1');
hold off;
title('Terminal Voltage Comparison', 'FontSize', 11);
ylabel('Voltage (V)', 'FontSize', 10);
grid on;
box on;
legend('show', 'Location', 'best', 'FontSize', 9);  % 图例位置优化[2](@ref)

%% 第二张图：TERMINAL CURRENT和I1
nexttile;
hold on;
plot(data.Domain, data.('TERMINALCURRENT'), 'Color', colors(3,:), 'LineWidth', lineWidth, 'DisplayName', 'TERMINAL CURRENT');
plot(data.Domain, data.I1, 'Color', colors(4,:), 'LineWidth', lineWidth, 'LineStyle', '--', 'DisplayName', 'I1');
hold off;
title('Terminal Current Comparison', 'FontSize', 11);
ylabel('Current (A)', 'FontSize', 10);
grid on;
box on;
legend('show', 'Location', 'best', 'FontSize', 9);

%% 第三张图：P1和P2
nexttile;
hold on;
plot(data.Domain, data.P1, 'Color', colors(5,:), 'LineWidth', lineWidth, 'DisplayName', 'P1');
plot(data.Domain, data.P2, 'Color', colors(6,:), 'LineWidth', lineWidth, 'LineStyle', ':', 'DisplayName', 'P2');
hold off;
title('Active Power Comparison', 'FontSize', 11);
ylabel('Power (W)', 'FontSize', 10);
grid on;
box on;
legend('show', 'Location', 'best', 'FontSize', 9);

%% 第四张图：Q1和Q2
nexttile;
hold on;
plot(data.Domain, data.Q1, 'Color', colors(1,:), 'LineWidth', lineWidth, 'DisplayName', 'Q1');
plot(data.Domain, data.Q2, 'Color', colors(2,:), 'LineWidth', lineWidth, 'LineStyle', '-.', 'DisplayName', 'Q2');
hold off;
title('Reactive Power Comparison', 'FontSize', 11);
ylabel('Reactive Power (VAR)', 'FontSize', 10);
grid on;
box on;
legend('show', 'Location', 'best', 'FontSize', 9);

%% 第五张图：OMEGA
nexttile;
plot(data.Domain, data.OMEGA, 'Color', colors(7,:), 'LineWidth', lineWidth, 'DisplayName', 'OMEGA');
title('Frequncy', 'FontSize', 11);
ylabel('Velocity (rad/s)', 'FontSize', 10);
xlabel('Domain', 'FontSize', 10);
grid on;
box on;

% 整体标题和格式优化
sgtitle('三相短路', 'FontSize', 13, 'FontWeight', 'bold');

% 调整子图间距（可选）
set(gcf, 'Units', 'normalized', 'OuterPosition', [0 0 1 1]);  % 全屏显示优化[7](@ref)