clear;
% 初始风电出力（可以设置为不确定集的中点或其他合理值）
Pw_uncertainty = [763.2359455, 862.771469, 923.4990462, 782.7146636, 774.9884481, 922.6467411, ...
                       1024.280981, 926.0361166, 834.9244197, 1084.229306, 1138.096363, 1103.728362, ...
                       1363.979061, 1354.328767, 1245.108429, 1033.184048, 1297.60431, 1275.093171, ...
                       1440.746678, 1451.500196, 1421.972229, 1510.506798, 1502.866813, 1423.662064, ...
                       1434.574957, 1307.777702, 1472.119505, 1458.345527, 1428.098356, 1510.506798, ...
                       1386.952169, 1504.233629, 1450.888923, 1468.257296, 1510.506798, 1461.137568, ...
                       1510.506798, 1510.458111, 1472.202636, 1432.275149, 1404.817708, 1279.709718, ...
                       1415.63164, 1231.459776, 1319.202368, 1130.502147, 1346.81775, 1200.142574, ...
                       1262.164918, 1114.076407, 920.2257143, 962.9566305, 1203.080652, 991.977677, ...
                       892.4609529, 818.8439094, 779.619626, 916.8552525, 690.4858949, 762.1925667, ...
                       507.0310785, 741.9904329, 674.5835724, 542.9291882, 476.0872513, 567.017834, ...
                       616.9181312, 640.8486513, 371.0760999, 680.4597235, 672.1477935, 613.9564678, ...
                       485.381816, 371.0760999, 478.5716602, 482.3349113, 371.0760999, 371.0760999, ...
                       371.0760999, 371.0760999, 371.0760999, 371.0760999, 371.0760999, 625.7949599, ...
                       514.2020471, 371.0760999, 525.5201516, 609.1221926, 406.8032154, 556.2904873, ...
                       513.3329215, 771.982066, 579.5049562, 840.1806216, 652.3069922, 585.8248418];
load("load3996.mat");
load("Pwmax.mat");

% 迭代求解
[x_main, y_main, gen, alpha_main] = main(Pw_uncertainty);  
[u_sub, result_sub] = sub(x_main);
LB1 = alpha_main;
UB1 = result_sub;         
p = [];
p = [p, UB1 - LB1];

% 开始迭代
for iteration = 1:3
    [x_main, y_main, gen, alpha_main] = main(u_sub);   
    [u_sub, result_sub] = sub(x_main);    
    LB = alpha_main;
    UB = min(UB1, result_sub); 
    p = [p, UB - LB];   
end


% 输出最终结果
fprintf('最终下界：%.2f\n', LB);
fprintf('最终上界：%.2f\n', UB);
fprintf('收敛性：%.4f\n', p(end));
fprintf('发电成本：%.2f Dollars\n',alpha_main);

%% 提取求解结果
% 预测/实际负荷功率
load_fact = u_sub;
load_predict = Pw_uncertainty;
load_predict_upper = 0.9*Pw_uncertainty;
load_predict_lower = 1.1*Pw_uncertainty;
hours = 1:96; 
figure(1);
hold on;
plot(hours, load_predict, 'b-', 'LineWidth', 2, 'DisplayName', '预测负荷');
plot(hours, load_fact, 'r--', 'LineWidth', 2, 'DisplayName', '实际负荷');
load_predict_area = fill([hours fliplr(hours)],[load_predict_lower fliplr(load_predict_upper)],[0.93333, 0.83529, 0.82353],'edgealpha', '0', 'facealpha', '.5','DisplayName', '考虑的不确定集');
xlabel('时间 (小时)');
ylabel('负荷功率 (kW)');
title('预测/实际负荷功率曲线');
grid on;
legend('Location', 'best');
hold off;

%各机组出力
gen_state_value = y_main;
time_vector = 1:1:96;
% 使用 hsv 颜色图生成 11 种颜色
colors = hsv(10);

% 绘制阶梯图
figure;
hold on;
for i = 1:size(x_main, 1)
    stairs(time_vector, value(x_main(i,:)), 'LineWidth', 1.5, 'Color', colors(i,:));
end
hold off;

% 设置坐标轴标签
xlabel('时间/15min');
ylabel('发电机出力/MW');
title('各时段各发电机出力');

% 设置图例
legend(num2str(gen), 'Location', 'best');

