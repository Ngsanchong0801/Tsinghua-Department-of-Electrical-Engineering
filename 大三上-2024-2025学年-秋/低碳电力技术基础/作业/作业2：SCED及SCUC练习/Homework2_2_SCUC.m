%% ------本代码仅作示例使用------
% 系统数据说明：
% 此代码中，需要决策一台火电机组、一台新能源机组的各时段出力
% 不考虑网络拓扑（即认为机组和负荷均位于同一节点）
% 负荷为刚性负荷，不考虑切负荷的问题

%% 读取数据
load('5_hw2_data.mat');  % 作业2数据请用此路径读取

% Example_1_SCED中已经讲解的部分此处省略

% 机组数据
% data.gen.ID = [1;2];
% data.gen.type = [1;2];
% data.gen.Pmax = [150;150];
% data.gen.Pmin = [20;0];
% data.gen.cost = [200,300,400;0,0,0];
% data.gen.Pseg = [50,50,50;50,50,50];
% data.gen.Sup = [30;inf];
% data.gen.Sdown = [30;inf];

% 负荷数据
% data.load = [100,100,100,100];

% 新能源数据
% data.renew.ID = 2;
% data.renew.ratio = [0.1,0.3,0.6,0.9];

% 常量
data.num.I = height(data.gen.ID);
data.num.B = width(data.gen.cost);
data.num.T = width(data.load);

% 新增：UC相关参数
% data.gen.Cstart = [100;0]; % 机组启动成本，维度 I x 1（单位：元/次）
% data.gen.Cshut = [100;0]; % 机组停机成本，维度 I x 1（单位：元/次）
% data.gen.Hon = [2;0]; % 机组最小开机时间，维度 I x 1（单位：h）
% data.gen.Hoff = [3;0]; % 机组最小关机时间，维度 I x 1（单位：h）
% 注：一般仅考虑火电水电的启停成本和启停时间

% data.gen.Plast = [110;0]; % 机组上一周期末尾时段总出力，维度 I x 1（单位：MW）
% data.gen.Ulast = [1,1,1;1,1,1]; % 机组上一周期末尾数个时段的启停状态，维度 I x TU（0：停机，1：开机）

%% 定义决策变量
var.Pb = sdpvar(data.num.I,data.num.B,data.num.T,'full');

% 新增：UC相关决策变量（注意，均为0-1变量！）
var.U = binvar(data.num.I,data.num.T,'full'); % 运行状态指示变量 I x T
var.Ustart = binvar(data.num.I,data.num.T,'full'); % 开机指示变量 I x T
var.Ushut = binvar(data.num.I,data.num.T,'full'); % 关机指示变量 I x T

%% 计算目标函数
obj = 0;    % 系统供电成本总和
for t = 1:data.num.T
    obj = obj + sum(var.Pb(:,:,t) .* data.gen.cost, 'all');
end

% 考虑启停成本
obj = obj + sum(var.Ustart .* (data.gen.Cstart*ones(1,data.num.T)), 'all') + sum(var.Ushut .* (data.gen.Cshut*ones(1,data.num.T)), 'all');

%% 生成约束条件
cons = [];
for t = 1:data.num.T
    % 系统功率平衡约束
    cons = [cons, sum(var.Pb(:,:,t), 'all') == data.load(t)];

    for i = 1:data.num.I
        if data.gen.type(i) == 1  % 火电机组
            %% 最小启停机时间约束：
            %% 请结合课上所讲内容以及“3_模型说明”，自行写出正确的约束
            %% 最小开机时间约束：
            cons = [cons, sum(var.U(i, max(1, t - data.gen.Hon(i) + 1):t)) >= data.gen.Hon(i) * var.Ustart(i,t)];
            %% 最小关机时间约束：
            cons = [cons, sum(1 - var.U(i, max(1, t - data.gen.Hoff(i) + 1):t)) >= data.gen.Hoff(i) * var.Ushut(i,t)];

            cons = [cons, sum(var.Pb(i,:,t)) <= data.gen.Pmax(i) * var.U(i,t)];  % 总出力上限
            cons = [cons, sum(var.Pb(i,:,t)) >= data.gen.Pmin(i) * var.U(i,t)];  % 总出力下限

            if t == 1
                cons = [cons, sum(var.Pb(i,:,t)) - data.gen.Plast(i) + data.gen.Ulast(i,end)*(data.gen.Pmin(i)-data.gen.Sup(i)) + var.U(i,t)*(data.gen.Pmax(i)-data.gen.Pmin(i)) <= data.gen.Pmax(i)];  % 初始上爬坡
                cons = [cons, data.gen.Plast(i) - sum(var.Pb(i,:,t)) + var.U(i,t)*(data.gen.Pmin(i)-data.gen.Sdown(i)) + data.gen.Ulast(i,end)*(data.gen.Pmax(i)-data.gen.Pmin(i)) <= data.gen.Pmax(i)];  % 初始下爬坡

                cons = [cons, var.Ustart(i,t) >= var.U(i,t) - data.gen.Ulast(i,end)];  % 初始开机指示
                cons = [cons, var.Ushut(i,t) >= data.gen.Ulast(i,end) - var.U(i,t)];  % 初始关机指示
            else
                cons = [cons, sum(var.Pb(i,:,t)) - sum(var.Pb(i,:,t-1)) + var.U(i,t-1)*(data.gen.Pmin(i)-data.gen.Sup(i)) + var.U(i,t)*(data.gen.Pmax(i)-data.gen.Pmin(i)) <= data.gen.Pmax(i)];  % 上爬坡
                cons = [cons, sum(var.Pb(i,:,t-1)) - sum(var.Pb(i,:,t)) + var.U(i,t)*(data.gen.Pmin(i)-data.gen.Sdown(i)) + var.U(i,t-1)*(data.gen.Pmax(i)-data.gen.Pmin(i)) <= data.gen.Pmax(i)];  % 下爬坡

                cons = [cons, var.Ustart(i,t) >= var.U(i,t) - var.U(i,t-1)];  % 开机指示
                cons = [cons, var.Ushut(i,t) >= var.U(i,t-1) - var.U(i,t)];  % 关机指示
            end
        else  % 新能源机组
            cons = [cons, sum(var.Pb(i,:,t)) <= data.gen.Pmax(i)*data.renew.ratio(data.renew.ID==i,t)];  % 总出力上限
            cons = [cons, sum(var.Pb(i,:,t)) >= data.gen.Pmin(i)];  % 总出力下限
        end

        % 分段出力限制
        for b = 1:data.num.B
            cons = [cons, var.Pb(i,b,t) >= 0];
            cons = [cons, var.Pb(i,b,t) <= data.gen.Pseg(i,b)];
        end
    end
end

%% 求解
options = sdpsettings('solver','gurobi','verbose',2);
result = optimize(cons, obj, options);

%% 结果处理
if result.problem == 0
    % 提取结果
    P_result = value(var.Pb);
    total_cost = value(obj);

    % 显示结果
    fprintf('优化成功！\n');
    fprintf('总成本: %.2f\n', total_cost);

    % 显示每个机组在各时段的总出力
    for i = 1:data.num.I
        fprintf('\n机组 %d 各时段出力:\n', i);
        for t = 1:data.num.T
            fprintf('时段 %d: %.2f MW\n', t, sum(P_result(i,:,t)));
        end
    end
else
    fprintf('优化失败！错误代码: %d\n', result.problem);
end

%% 结果分析：请自行选择合适的图型，展示求解结果
if result.problem == 0
    figure;
    hold on;
    colors = lines(data.num.I);
    for i = 1:data.num.I
        total_output = sum(P_result(i, :, :), 2);
        total_output = squeeze(total_output);

        plot(1:data.num.T, total_output, 'DisplayName', ['机组 ' num2str(i)], 'LineWidth', 1, 'Color', colors(i,:));
    end
    hold off;
    xlabel('时段');
    ylabel('总出力 (MW)');
    title('各机组在各时段的总出力(SCUC)');
    legend;
    grid on;

else
    fprintf('优化失败！错误代码: %d\n', result.problem);
end

