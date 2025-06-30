function pq_decomposition_33_node()
    clear;
    clc;

    pm = case14; 
    bus = pm.bus;
    bus(:, 9) = bus(:, 9) .* (2 * pi / 360); % 转换为弧度制
    gen = pm.gen;
    base = pm.baseMVA;
    n = size(pm.bus, 1);
    Y = makeYbus(pm); % 生成节点导纳矩阵

    % 节点分类
    PQ = find(bus(:, 2) == 1); % PQ节点
    PV = find(bus(:, 2) == 2); % PV节点
    ref = find(bus(:, 2) == 3); % 平衡节点
    P_num = sort([PQ; PV]); % 有功待求节点
    Q_num = PQ; % 无功待求节点
    H_num = sort([PQ; PV]); % 相角待求节点
    V_num = PQ; % 电压幅值待求节点

    % 初始化电压和相角（为所有节点分配完整长度）
    H = bus(:, 9); % 节点电压相角
    V = bus(:, 8); % 节点电压幅值

    % 参考潮流结果
    evalc('key = runpf(pm)');
    bus_H = key.bus(:, 9) .* (2 * pi / 360);
    bus_V = key.bus(:, 8);

    % 计算初始误差
    loss_PQ = loss(H(H_num), bus_H(H_num)) + loss(V(V_num), bus_V(V_num));
    disp('初始误差:');
    disp(loss_PQ);

    % B矩阵分解
    B0 = imag(Y);
    B1 = B0(P_num, H_num);
    B2 = B0(Q_num, V_num);

    % 迭代求解
    i = 1;
    while i <= 50 && loss_PQ >= 1e-20
        % 有功功率不平衡
        derta_P = dertaP(gen, bus, Y, P_num, H_num, V_num, H, V, base);
        dertaH = (B1 \ (derta_P ./ V(P_num))) ./ V(P_num);
        H(H_num) = H(H_num) - dertaH;

        % 无功功率不平衡
        derta_Q = dertaQ(gen, bus, Y, Q_num, H_num, V_num, H, V, base);
        dertaV = B2 \ (derta_Q ./ V(Q_num));
        V(V_num) = V(V_num) - dertaV;

        % 更新误差
        loss_PQ = loss(H(H_num), bus_H(H_num)) + loss(V(V_num), bus_V(V_num));
        fprintf('第%d次迭代误差：%.4e\n', i, loss_PQ);
        i = i + 1;
    end

    % 转换为角度制
    H = H .* (360 / (2 * pi));
    bus_H = bus_H .* (360 / (2 * pi));

    % 输出结果
    fprintf('\n最终每个节点的电压幅值和相角：\n');
    fprintf('节点编号\t电压幅值 (p.u.)\t电压相角 (度)\n');
    for j = 1:n
        fprintf('%d\t\t%.4f\t\t%.4f\n', j, V(j), H(j));
    end
end

% 计算有功功率不平衡量
function dertaP = dertaP(gen, bus, Y, P_num, H_num, V_num, H, V, base)
    PQd = bus(:, 3);
    PQa = -PQd;
    n_gen = size(gen, 1);
    for i = 1:n_gen
        PQa(gen(i, 1)) = PQa(gen(i, 1)) + gen(i, 2);
    end
    PQa = PQa / base;

    n = size(bus, 1);
    P = zeros(n, 1);
    G = real(Y);
    B = imag(Y);

    for i = 1:n
        for j = 1:n
            P(i) = P(i) + V(i) * V(j) * (G(i, j) * cos(H(i) - H(j)) + B(i, j) * sin(H(i) - H(j)));
        end
    end

    dertaP = PQa(P_num) - P(P_num);
end

% 计算无功功率不平衡量
function dertaQ = dertaQ(gen, bus, Y, Q_num, H_num, V_num, H, V, base)
    PQd = bus(:, 4);
    PQa = -PQd;
    n_gen = size(gen, 1);
    for i = 1:n_gen
        PQa(gen(i, 1)) = PQa(gen(i, 1)) + gen(i, 3);
    end
    PQa = PQa / base;

    n = size(bus, 1);
    Q = zeros(n, 1);
    G = real(Y);
    B = imag(Y);

    for i = 1:n
        for j = 1:n
            Q(i) = Q(i) + V(i) * V(j) * (G(i, j) * sin(H(i) - H(j)) - B(i, j) * cos(H(i) - H(j)));
        end
    end

    dertaQ = PQa(Q_num) - Q(Q_num);
end

% 损失函数（平方误差总和）
function l = loss(a, b)
    l = sum((a - b).^2);
end
