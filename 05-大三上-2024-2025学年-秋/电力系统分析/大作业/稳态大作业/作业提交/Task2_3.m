clear;
clc;

pm = case14;
base = pm.baseMVA;
Y = makeYbus(pm);
bus = pm.bus;
bus(:, 9) = bus(:, 9) .* (2 * pi / 360); % 转换相角为弧度制
gen = pm.gen;
n = size(pm.bus, 1);

% 节点分类
list_1 = find(bus(:, 2) == 1); % PQ节点
list_2 = find(bus(:, 2) == 2); % PV节点
list_3 = find(bus(:, 2) == 3); % 平衡节点

P_num = sort([list_1; list_2]); 
Q_num = list_1; 
H_num = P_num;
V_num = list_1;

% 初始化节点的电压和相角
H = bus(:, 9); 
V = bus(:, 8); 

% 提取待求节点的初始值
H_unknown = H(H_num); % 待求相角
V_unknown = V(V_num); % 待求电压幅值

key = runpf(pm); % 参考潮流计算
bus_H = key.bus(:, 9) .* (2 * pi / 360); % 参考潮流相角
bus_V = key.bus(:, 8); % 参考潮流电压幅值

fprintf('初始误差：\n');
fprintf('相角总平方误差：%.4e\n', loss(H_unknown, bus_H(H_num)));
fprintf('电压幅值总平方误差：%.4e\n', loss(V_unknown, bus_V(V_num)));

iter_times = 50;
Delta = zeros(iter_times, 3);
fprintf('\n开始迭代：\n');
tic; % 记录迭代开始时间
for i = 1:iter_times
    [delta_H, delta_V] = newton(gen, bus, Y, P_num, Q_num, H_num, V_num, H_unknown, V_unknown, base);
    H_unknown = H_unknown - delta_H; % 更新待求相角
    V_unknown = V_unknown - V_unknown .* delta_V; % 更新待求电压幅值

    % 更新所有节点的相角和电压
    H(H_num) = H_unknown;
    V(V_num) = V_unknown;

    % 计算当前迭代的误差
    loss_PQ = loss(H(H_num), bus_H(H_num)) + loss(V(V_num), bus_V(V_num)); % 总误差
    Delta(i, :) = [i, sum(abs(delta_V)), sum(abs(delta_H))];

    fprintf('第%d次迭代：\n', i);
    fprintf('总平方误差 (loss_PQ)：%.4e\n', loss_PQ);
    fprintf('相角误差绝对值总和 (DeltaH)：%.4e\n', Delta(i, 3));
    fprintf('电压幅值误差绝对值总和 (DeltaV)：%.4e\n\n', Delta(i, 2));
end
elapsed_time = toc; % 记录迭代结束时间

H = H .* (360 / (2 * pi));
bus_H = bus_H .* (360 / (2 * pi));

fprintf('\n最终计算时间：%.4f 秒\n', elapsed_time);
fprintf('\n自定义牛顿-拉夫逊法计算结果：\n');
fprintf('节点编号\t电压幅值 (p.u.)\t电压相角 (度)\n');
for i = 1:n
    fprintf('%d\t\t%.4f\t\t\t%.4f\n', i, V(i), H(i));
end

fprintf('\nrunpf函数中的牛顿-拉夫逊法计算结果：\n');
fprintf('节点编号\t电压幅值 (p.u.)\t电压相角 (度)\n');
for i = 1:n
    fprintf('%d\t\t%.4f\t\t\t%.4f\n', i, bus_V(i), bus_H(i));
end

% 绘图：误差收敛情况
figure(2);
subplot(2, 1, 1);
plot(Delta(:, 1), Delta(:, 2), 'o-');
xlabel('Iteration');
ylabel('DeltaV');
title('Convergence of Voltage Magnitude');
grid on;

subplot(2, 1, 2);
plot(Delta(:, 1), Delta(:, 3), 'o-');
xlabel('Iteration');
ylabel('DeltaH');
title('Convergence of Voltage Angle');
grid on;

function l = loss(a, b)
    l = sum((a - b).^2);
end
