%% 获取数据参数
clear;
load("load3996.mat");
load("Pwmax.mat");
mpc = loadcase('case39_UC');
% 节点类型
bus = mpc.bus(:,1);
gen = mpc.gen(:,1);
gen_index = [1;2;3;4;5;6;7;8;9;10];
bus_index_noGen = find(mpc.bus(:,2) == 1);%节点类型为1的节点无发电机
bus_index_hasGen = [30;31;32;33;34;35;36;37;38;39];%有一个发电机的节点
bus_if_hasWind = zeros(39,1);%有风机的节点
bus_if_hasWind(30,1) = 1;
% 负荷
load = Pd;
% 时长
time = 96;
time_0 = 4;
% 机组出力上下限
gen_Pmax = mpc.gen(:,9);
gen_Pmin = mpc.gen(:,10);
% 线路潮流上下限
branch_Pmax = mpc.branch(:,6);
branch_Pmin = -mpc.branch(:,6);
% 机组运行成本，一次项和常数项
gen_cost_1 = mpc.gencost(:,6);
gen_cost_0 = mpc.gencost(:,7);
% 机组启停成本
gen_cost_startup = repmat(mpc.gencost(:,2),1,time-1);
gen_cost_shutdown = repmat(mpc.gencost(:,3),1,time-1);
% 风机处理成本
gen_cost_wind = 0;
% 取10组数据
N = 10;
% 定义爬坡边界，爬坡为0.1倍最大出力，开机关停为0.3倍最大出力
R = repmat(0.1.*gen_Pmax,1,time-1);
S = repmat(0.3.*gen_Pmax,1,time-1);


Pwmax = 1.*Pwmax;

%% 定义决策变量
% 发电机发电量
gen_generate = sdpvar(length(gen(:,1)),time,N,'full');
% 发电机启停状态（运行为1，停机为0）
gen_state = binvar(length(gen(:,1)),time,N,'full');
% 节点注入有功
bus_P = sdpvar(length(bus(:,1)),time,N,'full'); 
% 将启停成本改写为决策变量构成约束条件
gen_cost_updown = sdpvar(length(gen(:,1)),time-1,N,'full');
% 风机发电量
gen_wind = sdpvar(1,time,N,'full');

%% 列写约束条件
cons = [];
object = 0;
for sam = 1:N
    % 系统有功平衡约束，各节点的功率是平衡的
    cons = [cons,bus_P(bus_index_noGen,:,sam) == -load(bus_index_noGen,:)];%无发电机节点
    cons = [cons,bus_P(bus_index_hasGen,:,sam) == bus_if_hasWind(bus_index_hasGen,1)*gen_wind(1,:,sam) + gen_generate(gen_index,:,sam) - load(bus_index_hasGen,:)];%发电机节点
    % 系统有功平衡约束，总的有功供需是平衡的，即每个节点的有功注入之和为0
    cons = [cons,sum(bus_P(bus,:,sam)) == zeros(1,time)];
    % % 线路潮流约束，可以求功率传输分布因子矩阵
    matrix_PTDF = makePTDF(mpc);
    cons = [cons,matrix_PTDF * bus_P(:,:,sam) <= repmat(branch_Pmax,1,time)];
    cons = [cons,matrix_PTDF * bus_P(:,:,sam) >= repmat(branch_Pmin,1,time)];
    % 发电机出力约束，注意改写为乘以状态
    cons = [cons,gen_generate(:,:,sam) <= gen_state(:,:,sam).*repmat(gen_Pmax,1,time)];
    cons = [cons,gen_generate(:,:,sam) >= gen_state(:,:,sam).*repmat(gen_Pmin,1,time)];
    % 风机出力约束
    cons = [cons,gen_wind(:,:,sam) >= 0];
    cons = [cons,gen_wind(:,:,sam) <= Pwmax(:,sam)'];
    % 发电机出力爬坡约束，注意同时考虑机组爬坡和启停
    cons = [cons,gen_generate(:,2:end,sam) - gen_generate(:,1:end-1,sam) <=  S + (R-S).*gen_state(:,1:end-1,sam)];
    cons = [cons,gen_generate(:,1:end-1,sam) - gen_generate(:,2:end,sam) <=  S + (R-S).*gen_state(:,2:end,sam)];
    % 将启停成本改写为约束条件，状态差分变量，注意是矩阵逐个对应位置相乘
    cons = [cons,gen_cost_updown(:,:,sam) >= (gen_state(:,2:end,sam) - gen_state(:,1:end-1,sam)).*gen_cost_startup];
    cons = [cons,gen_cost_updown(:,:,sam) >= -1.*(gen_state(:,2:end,sam) - gen_state(:,1:end-1,sam)).*gen_cost_shutdown];
    % 机组最小开停机时间约束新写法
    U0 = zeros(time,time-time_0);
    for i = 1:(time-time_0)
        for j = (i+1):(i+time_0)
            U0(j,i) = 1;
        end
    end
    U = zeros(time,time-1);
    for i = 1:(time-1)
        U(i,i) = -1;
        U(i+1,i) = 1;
    end
    cons = [cons, gen_state(:,:,sam)*U0 >= time_0.*gen_state(:,:,sam)*U(:,1:time-time_0)];
    cons = [cons, (1-gen_state(:,:,sam))*U0 >= -time_0.*gen_state(:,:,sam)*U(:,1:time-time_0)];
    % 增加到目标函数中
    object = object + (0.25*sum(gen_cost_wind'*gen_wind(:,:,sam)) ...
        + 0.25*sum(gen_cost_1'*gen_generate(:,:,sam)) + 0.25*sum(gen_cost_0'*gen_state(:,:,sam)) + sum(sum(gen_cost_updown(:,:,sam))))/N;
end



%% 求解
options = sdpsettings('solver','gurobi');
result = optimize(cons,object,options);

%% 展示结果
fprintf('求解时间：%.4f 秒\n',result.solvertime);
fprintf('发电成本：%.2f Dollars\n',value(object));
time_vector = 1:1:96;
% 使用 hsv 颜色图生成 11 种颜色
colors = hsv(10);

gen_generate_value = value(gen_generate); 
gen_wind_value = value(gen_wind);
gen_index = gen;
index=[1;2;3;4;5;6;7;8;9;10];

% 机组出力绘图
t = 1:time;
figure(1); 
for sam=1:N
    stairs(t, gen_wind_value(1,:,sam), 'LineWidth',1,'Color', colors(sam,:)); 
    hold on;
end
hold off;
xlim([0,time]);
xlabel('时段'); 
ylabel('风电出力/MW'); 
title('机组出力'); 
legend(num2str(index));

figure(2);
for sam=1:N
    for k = 1:size(gen_generate, 1)
    stairs(t, gen_generate_value(k,:,sam)', 'LineWidth', 1,'Color',colors(k,:)); 
    hold on;
    end
end
hold off;
xlim([0,time]);
xlabel('时段'); 
ylabel('发电机出力/MW'); 
title('机组出力'); 
legend(num2str(gen_index));

figure(3); 
for sam=1:N
    stairs(t, Pwmax(:,sam), 'LineWidth',1,'Color', colors(sam,:)); 
    hold on;
end
hold off;
xlim([0,time]);
xlabel('时段'); 
ylabel('最大出力/MW'); 
title('风机最大出力'); 
legend(num2str(index));

%% 十个样本绘图
t = 1:time;
figure(4); 
% 设置子图排列为2列5行
rows = 5;
cols = 2;
for sam = 1:N
    subplot(rows, cols, sam); % 创建5行2列的子图布局
    % 绘制阶梯图
    stairs(t, gen_wind_value(1,:,sam), 'LineWidth', 1.5, 'Color', colors(sam,:)); 
    hold on;
    % 图形装饰
    grid on;
    title(['样本 ', num2str(sam)]);
    ylabel('出力 (MW)');
    xlabel('时段');   
    % 统一坐标范围
    xlim([0, time]);
    ylim([0, 1000]);
end
% 添加总标题
sgtitle('风电出力时序对比 (10个样本)', 'FontSize', 12, 'FontWeight', 'bold');

%% 十个样本绘图
t = 1:time;
figure(5); 
% 设置子图排列为2列5行
rows = 5;
cols = 2;
for sam = 1:N
    subplot(rows, cols, sam); % 创建5行2列的子图布局
    % 绘制阶梯图
    stairs(t, Pwmax(:,sam), 'LineWidth', 1.5, 'Color', colors(sam,:)); 
    hold on;
    % 图形装饰
    grid on;
    title(['样本 ', num2str(sam)]);
    ylabel('最大出力 (MW)');
    xlabel('时段');   
    % 统一坐标范围
    xlim([0, time]);
    ylim([0, 1500]);
end
% 添加总标题
sgtitle('风电最大出力对比 (10个样本)', 'FontSize', 12, 'FontWeight', 'bold');

%% 十个样本绘图
t = 1:time;
figure(6); 
% 设置子图排列为2列5行
rows = 5;
cols = 2;
for sam = 1:N
    subplot(rows, cols, sam); % 创建5行2列的子图布局
    % 绘制阶梯图
    for k = 1:size(gen_generate, 1)
    stairs(t, gen_generate_value(k,:,sam)', 'LineWidth', 1,'Color',colors(k,:)); 
    hold on;
    end
    hold on;
    % 图形装饰
    grid on;
    title(['样本 ', num2str(sam)]);
    ylabel('出力 (MW)');
    xlabel('时段');   
    % 统一坐标范围
    xlim([0, time]);
    ylim([0, 2000]);
end
% 添加总标题
sgtitle('正常机组出力时序对比 (10个样本)', 'FontSize', 12, 'FontWeight', 'bold');
legend(num2str(gen_index));