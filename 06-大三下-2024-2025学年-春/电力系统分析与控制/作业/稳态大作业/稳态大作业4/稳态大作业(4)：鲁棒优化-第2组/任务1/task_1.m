clear;
P_DR=1*[80, 70, 60, 50, 70, 70, 90, 100, 120, 150, 170, 200, 140, 100, 100, 120, 140, 150, 190, 200, 200, 190, 100, 80];  % 这个是可转移负荷的参数   需求响应负荷在调度周期内的总 用电需求
p_pv_forecast_0 = [0 0 0 0 0 0 0 109.63 314.82 642.22 1080 1110.37 1214.81 1054.07 905.19 917.78  771.11 540 312.59 73.33 0 0 0 0];
p_l_forecast_0 = [360.52,325.68,309.74,278.04,273.12,401.53,521.55,537.1,569.97,716.76,756.46,943.14,765.51,692.35,687.43,663.08,754.22,739.33,805.8,860.72,888.87,676.07,499.5,406.39];
u = [p_pv_forecast_0,p_l_forecast_0];

%% 迭代求解两阶段鲁棒优化问题
[x_main,y_main,alpha_main] = main(u);  
[u_sub,result_sub] = sub(x_main);
LB1 = alpha_main;
UB1 = result_sub;         
p = [];
p = [p,UB1 - LB1];
%开始迭代
for iteration = 1:3
    [x_main,y_main,alpha_main] = main(u_sub);   
    [u_sub,result_sub] = sub(x_main);    
    LB = alpha_main;
    UB = min(UB1,result_sub); 
    p = [p,UB-LB];   
end

%% 提取求解结果
% 预测/实际负荷功率
load_fact = u_sub(1,25:48);
load_predict = p_l_forecast_0;
hours = 1:24; 
figure(1);
hold on;
plot(hours, load_predict, 'b-', 'LineWidth', 2, 'DisplayName', '预测负荷');
plot(hours, load_fact, 'r--', 'LineWidth', 2, 'DisplayName', '实际负荷');
xlabel('时间 (小时)');
ylabel('负荷功率 (kW)');
title('预测/实际负荷功率曲线');
grid on;
legend('Location', 'best');
hold off;

% 预测/实际光伏出力
pv_fact = u_sub(1,1:24);
pv_predict = p_pv_forecast_0;
hours = 1:24; 
figure(2);
hold on;
plot(hours, pv_predict, 'b-', 'LineWidth', 2, 'DisplayName', '预测光伏出力');
plot(hours, pv_fact, 'r--', 'LineWidth', 2, 'DisplayName', '实际光伏出力');
xlabel('时间 (小时)');
ylabel('光伏出力 (kW)');
title('预测/实际光伏出力曲线');
grid on;
legend('Location', 'best');
hold off;

% 微燃机输出功率及微电网购售电功率
machine_generate = y_main(1:24,1)';
machine_sellbuy = y_main(169:192,1)' - y_main(145:168,1)';
hours = 1:24; 
bar_width = 0.35;
pos_generate = hours - bar_width/2;
pos_sellbuy = hours + bar_width/2;
figure(3);
hold on;
bar(pos_generate, machine_generate,bar_width,'DisplayName','微燃机输出功率');
bar(pos_sellbuy, machine_sellbuy,bar_width,'DisplayName','微电网购售电功率');
xlabel('时间 (小时)');
ylabel('电量 (kW)');
title('微燃机输出功率及微电网购售电功率');
grid on;
legend('Location', 'best');
hold off;

% 储能充放电功率
price = y_main(49:72,1)' - y_main(25:48,1)';
hours = 1:24; 
figure(4);
hold on;
bar(hours,price,bar_width,'DisplayName','储能充放电功率');
xlabel('时间 (小时)');
ylabel('功率 (kW)');
title('储能充放电功率');
grid on;
legend('Location', 'best');
hold off;

% 需求响应负荷实际/期望用电计划
demandresponse_fact = y_main(73:96,1)';
demandresponse_expect = P_DR;
hours = 1:24; 
bar_width = 0.35;
pos_fact= hours - bar_width/2;
pos_expect = hours + bar_width/2;
figure(5);
hold on;
bar(pos_fact, demandresponse_fact ,bar_width,'DisplayName','需求响应实际用电');
bar(pos_expect, demandresponse_expect ,bar_width,'DisplayName','需求响应期望用电');
xlabel('时间 (小时)');
ylabel('电量 (kW)');
ylim([0,250]);
title('需求响应负荷实际/期望用电计划');
grid on;
legend('Location', 'best');
hold off;

% 电价
price = [0.48;0.48;0.48;0.48;0.48;0.48;0.48;0.9;1.35;1.35;1.35;0.9;0.9;0.9;0.9;0.9;0.9;0.9;1.35;1.35;1.35;1.35;1.35;0.48]';
hours = 1:24; 
figure(6);
hold on;
bar(hours,price,bar_width,'DisplayName','日前电价');
xlabel('时间 (小时)');
ylabel('电价 (¥)');
title('日前电价');
grid on;
legend('Location', 'best');
hold off;