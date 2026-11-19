% 定义数据矩阵
data = [
    0.7404, 0.8551, 1.4808, 1.4, -1.4808;
    0.7685, 0.9172, 1.7058, 9.364, -25.0131;
    0.7677, 0.9201, 1.7193, -68.5257, 0
];

% 定义x轴的角度标签
x = 1:5;
x_labels = {'0°', '30°', '60°', '90°', '120°'};

% 绘制每一行数据
figure;
hold on;
plot(x, data(1, :), '-o', 'DisplayName', '理论值'); % 第一组数据：理论值
plot(x, data(2, :), '-o', 'DisplayName', '电阻负载'); % 第二组数据：电阻负载
plot(x, data(3, :), '-o', 'DisplayName', '阻感负载'); % 第三组数据：阻感负载
hold off;

% 设置X轴标签和图例
set(gca, 'XTick', x, 'XTickLabel', x_labels);
xlabel('触发角');
ylabel('比值');
title('各个触发角交流线电压与整流电压的比值');
legend('show');
grid on;
