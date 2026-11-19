clc;
clear;
%% 1. 數據定義
% 溫度 (K)
T = [298.15; 300; 373.15; 400; 500; 600; 700; 800; 900; 1000; 1100; 1200; 1300];

% 焓變 H (kJ/mol)
H = [-285.83; -285.771; -283.874; -242.846; -243.826; -244.758; -245.632; ...
     -246.443; -247.185; -247.857; -248.46; -248.997; -249.473];

% 熵變 S (J/mol·K)
S = [-163.302; -163.106; -157.324; -47.238; -49.428; -51.128; -52.476; ...
     -53.561; -54.435; -55.143; -55.720; -56.188; -56.569];

T0 = 298.15; % 環境基準溫度

%% 2. 熱力學計算
G = H - (T .* S) / 1000; 

% 輸出 G 的結果
fprintf('--- 吉布斯自由能 G (kJ/mol) ---\n');
disp(table(T, G, 'VariableNames', {'Temperature_K', 'Gibbs_Free_Energy'}));

% 燃料電池理論效率 n_fc = G / H
n_fc = G ./ H;

% 卡諾循環效率 n_kanuo = 1 - T0/T
n_kanuo = 1 - T0 ./ T;

%% 4. 繪圖
figure('Color', [1, 1, 1]);
hold on; grid on;

% 繪製效率曲線
plot(T, n_fc, 'r-o', 'LineWidth', 1.5, 'MarkerSize', 4, 'DisplayName', '燃料电池 (\DeltaG/\DeltaH)');
plot(T, n_kanuo, 'b-o', 'LineWidth', 1.5, 'MarkerSize', 4, 'DisplayName', '卡诺循环 (1-T_0/T)');

% 圖表修飾
xlabel('溫度 K', 'FontSize', 12);
ylabel('效率', 'FontSize', 12);
title('卡诺循环VS燃料电池', 'FontSize', 14);
legend('Location', 'best');
set(gca, 'LineWidth', 1);

