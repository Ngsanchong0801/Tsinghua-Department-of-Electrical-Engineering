clc; clear; close all;

%% 指标名称
labels = {'绿电比例','经济性','可靠性','削峰能力','长时韧性','综合能源效率'};

%% 四种方案评分（满分100）
scores = [
    25  85  45  40  30  50;   % 20%
    50  95  60  60  45  60;   % 40%
    75  70  80  80  80  75;   % 60%
    100 45  95  95  95  80    % 80%
];

case_names = {'20%方案','40%方案','60%方案','80%方案'};

%% 角度设置
N = length(labels);
theta = linspace(0, 2*pi, N+1);

%% 创建图形
figure('Position',[200 100 800 650]);
pax = polaraxes;
hold(pax,'on');

%% 半径范围与刻度
rlim([0 100]);
rticks(0:20:100);
rtickformat('%.0f');

%% 绘制每个方案
for i = 1:size(scores,1)
    data = [scores(i,:) scores(i,1)];   % 闭合
    polarplot(theta, data, '-o', 'LineWidth', 2, 'MarkerSize', 6, ...
        'DisplayName', case_names{i});
end

%% 设置角度标签
thetaticks(rad2deg(theta(1:end-1)));
thetaticklabels(labels);

%% 标题与图例
title('综合评价雷达图');
legend('Location','southoutside');

grid on;