%% ------本代码仅作示例使用------
% 系统数据说明：
% 此代码中，需要决策一台火电机组、一台新能源机组的各时段出力
% 不考虑网络拓扑（即认为机组和负荷均位于同一节点）
% 负荷为刚性负荷，不考虑切负荷的问题

%% 读取数据
% load('5_hw2_data.mat');  % 作业2数据请用此方法读取

% 此处使用示例数据，完成作业2时请使用上面的读取方式
% 示例数据与作业数据结构相同，但数值不同
% 下面以示例数据为例，说明数据结构

% 优化时段步长
% 简单起见，本次作业取为1h并省去后续相关转换
% 例如从"出清功率"到"能量成本"的计算，应当乘以时间步长，但此处为1因此省略（详见下文）
data.num.tau = 1;

% 机组数据
data.gen.ID = [1;2]; % 机组编号，维度 I x 1
data.gen.type = [1;2]; % 机组类型，维度 I x 1（1：火电机组，2：新能源机组）
data.gen.Pmax = [150;150]; % 机组最大出力，维度 I x 1（单位：MW）
data.gen.Pmin = [20;0]; % 机组最小出力，维度 I x 1（单位：MW）
data.gen.cost = [200,300,400;0,0,0]; % 机组成本，维度 I x B（单位：元/MWh）
data.gen.Pseg = [50,50,50;50,50,50]; % 机组分段出力上限，维度 I x B（单位：MW），与data.gen.cost对应
data.gen.Sup = [30;inf];    % 上爬坡容量，维度 I x 1（单位：MW/h），新能源无爬坡限制
data.gen.Sdown = [30;inf];  % 下爬坡容量，维度 I x 1（单位：MW/h），新能源无爬坡限制

% 负荷数据
data.load = [100,100,100,100]; % 负荷需求，维度 1 x T（单位：MW）

% 新能源数据
data.renew.ID = 2; % 新能源机组编号，维度 R x 1，其中 R 为新能源机组数，此处ID与data.gen.ID对应
data.renew.ratio = [0.1,0.3,0.6,0.9]; % 新能源机组最大出力比率，维度 R x T，该值与Pmax的乘积为新能源机组各时段的实际最大出力

% 常量
data.num.I = height(data.gen.ID); % 机组数
data.num.B = width(data.gen.cost); % 机组成本曲线段数（所有机组成本曲线均为分段线性函数）
data.num.T = width(data.load); % 时间段数
%% 定义决策变量
var.Pb = sdpvar(data.num.I,data.num.B,data.num.T,'full'); % 分段出力决策变量 I x B x T

%% 计算目标函数
obj = 0;    % 系统供电成本总和
for t = 1:data.num.T
    obj = obj + sum(var.Pb(:,:,t) .* data.gen.cost, 'all');
    % 上述矩阵维度均为 I x B，因此直接逐元素相乘，再求和即可

    % 一般来说，此处需要乘以时段步长tau进行转换
    % 例如tau=0.25时，单个时段序号t代表15min，因此从功率到能量需要乘以0.25
end

%% 计算约束条件
cons = [];
for t = 1:data.num.T
    % 系统功率平衡约束
    cons = [cons, sum(var.Pb(:,:,t), 'all') == data.load(t)];

    for i = 1:data.num.I
        % 总出力限制
        cons = [cons, sum(var.Pb(i,:,t)) >= data.gen.Pmin(i)];  % 下限
        if data.gen.type(i) == 1  % 火电机组
            cons = [cons, sum(var.Pb(i,:,t)) <= data.gen.Pmax(i)];  % 上限

            % 爬坡约束
            % 通常也需要注意时段步长tau
            if t > 1
                cons = [cons, sum(var.Pb(i,:,t)) - sum(var.Pb(i,:,t-1)) <= data.gen.Sup(i)];  % 上爬坡
                cons = [cons, sum(var.Pb(i,:,t)) - sum(var.Pb(i,:,t-1)) >= -data.gen.Sdown(i)];  % 下爬坡
            end
        else  % 新能源机组
            cons = [cons, sum(var.Pb(i,:,t)) <= data.gen.Pmax(i)*data.renew.ratio(data.renew.ID==i,t)];  % 上限
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
