clear;
mpc = loadcase('case39_FCUC');
gen = mpc.gen(:,1);
load('1_FCUC_F_gen_state');FCUC_gen_state = gen_state_value;
load('1_FCUC_F_gen_generate');FCUC_gen_generate = gen_generate_value;
load('1_FCUC_F_Tj');FCUC_Tj = Tj_value;
load('1_FCUC_F_KG');FCUC_KG = KG_value;
load('1_FCUC_F_D');FCUC_D = D_value;

load('1_FCUC_BJ_gen_state');UC_gen_state = gen_state_value;
load('1_FCUC_BJ_gen_generate');UC_gen_generate = gen_generate_value;
load('1_FCUC_BJ_Tj');UC_Tj = Tj_value;
load('1_FCUC_BJ_KG');UC_KG = KG_value;
load('1_FCUC_BJ_D');UC_D = D_value;

time_vector = 1:1:96;
colors = hsv(10);

figure(1);
hold on;
for i = 1:size(FCUC_gen_generate, 1)
    stairs(time_vector, value(FCUC_gen_generate(i,:)), 'LineWidth', 1.5, 'Color', colors(i,:));
end
hold off;
xlabel('时间/15min');
ylabel('发电机出力/MW');
title('考虑精细模型时各时段各发电机出力');
legend(num2str(gen), 'Location', 'best');

figure(2);
hold on;
for i = 1:size(UC_gen_generate, 1)
    stairs(time_vector, value(UC_gen_generate(i,:)), 'LineWidth', 1.5, 'Color', colors(i,:));
end
hold off;
xlabel('时间/15min');
ylabel('发电机出力/MW');
title('不考虑精细模型时各时段各发电机出力');
legend(num2str(gen), 'Location', 'best');

figure(3);
set(gcf, 'Position', [0, 0, 600, 600]);
hold on;
for i = 1:size(FCUC_gen_state, 1)
    subplot(size(FCUC_gen_state, 1), 1, i);
    stairs(time_vector, value(FCUC_gen_state(i,:)), 'LineWidth', 1.5, 'Color', colors(i,:));
    ylim([-0.1 1.1]);
    if i == 1
        title('考虑精细模型时各机组启停状态');
    end
end
hold off;
xlabel('时间/15min');

figure(4);
set(gcf, 'Position', [0, 0, 600, 600]);
hold on;
for i = 1:size(UC_gen_state, 1)
    subplot(size(UC_gen_state, 1), 1, i);
    stairs(time_vector, value(UC_gen_state(i,:)), 'LineWidth', 1.5, 'Color', colors(i,:));
    ylim([-0.1 1.1]);
    if i == 1
        title('不考虑精细模型时各机组启停状态');
    end
end
hold off;
xlabel('时间/15min');

% 假设已有以下变量：
% time_vector - 时间轴数据 (1×96)
% FCUC_Tj, UC_Tj - 第一组对比数据 (1×96)
% FCUC_KG, UC_KG - 第二组对比数据 (1×96)
% FCUC_D, UC_D - 第三组对比数据 (1×96)

% 创建画布
figure(5);
% 第一子图：Tj对比
subplot(3,1,1);
plot(time_vector, FCUC_Tj, 'b-', 'LineWidth', 1.5); hold on;
plot(time_vector, UC_Tj, 'r--', 'LineWidth', 1.5);
hold off;
grid on;
ylabel('Tj');
title('系统惯性时间常数对比');
legend('考虑精细模型', '不考虑精细模型', 'Location', 'best');
xlim([min(time_vector), max(time_vector)]);

% 第二子图：KG对比
subplot(3,1,2);
plot(time_vector, FCUC_KG, 'b-', 'LineWidth', 1.5); hold on;
plot(time_vector, UC_KG, 'r--', 'LineWidth', 1.5);
hold off;
grid on;
ylabel('KG');
title('一次调频系数对比');
legend('考虑精细模型', '不考虑精细模型', 'Location', 'best');
xlim([min(time_vector), max(time_vector)]);

% 第三子图：D对比
subplot(3,1,3);
plot(time_vector, FCUC_D, 'b-', 'LineWidth', 1.5); hold on;
plot(time_vector, UC_D, 'r--', 'LineWidth', 1.5);
hold off;
grid on;
xlabel('时间/15min');
ylabel('D');
title('系统阻尼系数对比');
legend('考虑精细模型', '不考虑精细模型', 'Location', 'best');
xlim([min(time_vector), max(time_vector)]);

% 调整子图间距
set(gcf, 'Color', 'w');
ha = findobj(gcf, 'type', 'axes');
linkaxes(ha, 'x');  % 链接x轴
set(ha(1:2), 'XTickLabel', '');  % 隐藏上方子图的x轴标签

% 可选：保存图像
% saveas(gcf, '参数对比图.png');



figure(7);
hold on;

% 颜色定义 (保持与原始代码一致)
colors = hsv(size(FCUC_gen_generate, 1)); 

% 绘制FCUC方案曲线 (实线)
for i = 1:size(FCUC_gen_generate, 1)
    stairs(time_vector, value(FCUC_gen_generate(i,:)), 'LineWidth', 1.5, ...
        'Color', colors(i,:), 'LineStyle', '-', ...
        'DisplayName', ['FCUC-G' num2str(gen(i))]);
end

% 绘制UC方案曲线 (虚线)
for i = 1:size(UC_gen_generate, 1)
    stairs(time_vector, value(UC_gen_generate(i,:)), 'LineWidth', 1.5, ...
        'Color', colors(i,:), 'LineStyle', '--', ...
        'DisplayName', ['UC-G' num2str(gen(i))]);
end

hold off;

% 图形美化
grid on;
xlabel('时间/15min');
ylabel('发电机出力/MW');
title('发电机出力对比 (实线:考虑精细模型vs虚线:不考虑精细模型)');
legend(num2str(gen), 'Location', 'best');
% 调整坐标轴
xlim([min(time_vector) max(time_vector)]);
set(gcf, 'Color', 'w');