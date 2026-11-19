x = -10:0.1:10;

y1 = sin(x);
y2 = cos(x);

plot(x, y1, 'r-', 'LineWidth', 1);
hold on; 
plot(x, y2, 'b-', 'LineWidth', 1);

xlabel('x', 'FontSize', 10);
ylabel('y', 'FontSize', 10);

legend('y=sin(x)', 'y=cos(x)');
title('sin & cos wave', 'FontSize', 10);

%% 大语言模型:
% MATLAB 高品質三角函數繪圖模板
clear; clc;

%% 1. 數據準備
x = linspace(-10, 10, 1000); % 使用 1000 個點確保曲線極其平滑
y1 = sin(x);
y2 = cos(x);

%% 2. 圖形窗口設置
figure('Color', [1 1 1], 'Position', [200, 200, 800, 500]); % 白色背景，設置窗口大小
hold on;

%% 3. 繪製曲線 (使用現代感配色)
% 藍色實線代表 sin(x)，橙色虛線代表 cos(x)
p1 = plot(x, y1, 'Color', [0, 0.45, 0.74], 'LineStyle', '-', 'LineWidth', 2.5);
p2 = plot(x, y2, 'Color', [0.85, 0.33, 0.1], 'LineStyle', '--', 'LineWidth', 2.5);

%% 4. 坐標軸美化
ax = gca; % 獲取當前坐標軸
grid on;
ax.GridLineStyle = ':';
ax.GridAlpha = 0.5;      % 網格線半透明，不干擾視線
ax.LineWidth = 1.2;      % 坐標軸框粗細
ax.FontSize = 12;        % 字體大小
ax.FontName = 'Helvetica'; % 經典且易讀的字體

% 設置標題與標籤 (使用 LaTeX 解析器讓數學符號更美觀)
title('Comparison of $y = \sin(x)$ and $y = \cos(x)$', 'Interpreter', 'latex', 'FontSize', 16);
xlabel('$x$', 'Interpreter', 'latex', 'FontSize', 14);
ylabel('$y$', 'Interpreter', 'latex', 'FontSize', 14);

% 優化刻度範圍
xlim([-10 10]);
ylim([-1.2 1.2]);

%% 5. 圖例與外觀修飾
lgd = legend([p1, p2], {'$y = \sin(x)$', '$y = \cos(x)$'}, ...
    'Interpreter', 'latex', 'Location', 'northeast', 'FontSize', 12);
lgd.EdgeColor = [0.8 0.8 0.8]; % 圖例邊框淺色化

% 移除右上角的坐標軸邊框 (可選，視個人喜好)
% box off; 

hold off;