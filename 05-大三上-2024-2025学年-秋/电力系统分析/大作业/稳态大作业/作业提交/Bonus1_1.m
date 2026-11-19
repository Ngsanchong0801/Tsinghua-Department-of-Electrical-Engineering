function pq_decomposition_33_node()
    clear;
    clc;

    % 加载33节点系统
    pm = case33bw;
    bus = pm.bus;
    bus(:, 9) = bus(:, 9) .* (2 * pi / 360); % 转换为弧度制
    gen = pm.gen;
    base = pm.baseMVA;
    n = size(pm.bus, 1);
    Y = makeYbus(pm); % 生成节点导纳矩阵

    % 节点分类
    list_1 = []; % PQ节点的索引
    list_2 = []; % PV节点的索引
    list_3 = []; % 平衡节点的索引
    for i = 1:n
        if (bus(i, 2) == 1)
            list_1(end + 1, 1) = i;
        elseif (bus(i, 2) == 2)
            list_2(end + 1, 1) = i;
        elseif (bus(i, 2) == 3)
            list_3(end + 1, 1) = i;
        end
    end

    P_num = sort([list_1; list_2]);
    Q_num = list_1;
    H_num = sort([list_1; list_2]);
    V_num = list_1;

    % 初始化电压和相角
    H = bus(H_num, 9);
    V = bus(V_num, 8);

    % 参考潮流结果
    evalc('key = runpf(pm)');
    bus_H = key.bus(H_num, 9) .* (2 * pi / 360);
    bus_V = key.bus(V_num, 8);

    % 计算功率误差
    loss_PQ = loss(H, bus_H) + loss(V, bus_V);
    disp('初始误差:');
    disp(loss_PQ);

    % B矩阵分解
    B0 = imag(Y);
    B1 = zeros(size(P_num, 1), size(H_num, 1));
    B2 = zeros(size(Q_num, 1), size(V_num, 1));
    for i = 1:size(P_num, 1)
        for j = 1:size(H_num, 1)
            a = P_num(i, 1);
            b = H_num(j, 1);
            B1(i, j) = B0(a, b);
        end
    end
    for i = 1:size(Q_num, 1)
        for j = 1:size(V_num, 1)
            a = Q_num(i, 1);
            b = V_num(j, 1);
            B2(i, j) = B0(a, b);
        end
    end

    % 迭代求解
    Va = bus(:, 8);
    Ha = bus(:, 9);
    i = 1;
    while i <= 50 && loss_PQ >= 1e-20
        derta_P = dertaP(gen, bus, Y, P_num, H_num, V_num, H, V, base);
        dertaH = (B1 \ (derta_P ./ Va(P_num))) ./ Va(P_num);
        H = H - dertaH;
        Ha(H_num) = H;

        derta_Q = dertaQ(gen, bus, Y, Q_num, H_num, V_num, H, V, base);
        dertaV = B2 \ (derta_Q ./ Va(Q_num));
        V = V - dertaV;
        Va(V_num) = V;

        fprintf('第%d次迭代误差：\n', i);
        loss_PQ = loss(H, bus_H) + loss(V, bus_V);
        disp(loss_PQ);
        i = i + 1;
    end

    % 转换为角度制
    H = H .* (360 / (2 * pi));
    bus_H = bus_H .* (360 / (2 * pi));

    % 输出结果
    fprintf('\n所有节点电压幅值和相角结果：\n');
    fprintf('节点编号\t电压幅值 (p.u.)\t电压相角 (度)\n');
    for j = 1:n
        fprintf('%d\t\t%.4f\t\t%.4f\n', j, V(j), H(j));
    end
end

% 计算有功功率不平衡量
function dertaP = dertaP(gen, bus, Y, P_num, H_num, V_num, Hi, Vi, base)
    PQd = bus(:, 3);
    PQa = -PQd;
    n_gen = size(gen, 1);
    for i = 1:n_gen
        PQa(gen(i, 1)) = PQa(gen(i, 1)) + gen(i, 2);
    end
    PQa = PQa / base;

    V = bus(:, 8);
    H = bus(:, 9);
    V(V_num) = Vi;
    H(H_num) = Hi;
    n = size(bus, 1);
    P = zeros(n, 1);
    G = real(Y);
    B = imag(Y);

    for i = 1:n
        sump = 0;
        for j = 1:n
            sump = sump + V(i) * V(j) * (G(i, j) * cos(H(i) - H(j)) + B(i, j) * sin(H(i) - H(j)));
        end
        P(i) = sump;
    end

    dertaP = PQa(P_num) - P(P_num);
end

% 计算无功功率不平衡量
function dertaQ = dertaQ(gen, bus, Y, Q_num, H_num, V_num, Hi, Vi, base)
    PQd = bus(:, 4);
    PQa = -PQd;
    n_gen = size(gen, 1);
    for i = 1:n_gen
        PQa(gen(i, 1)) = PQa(gen(i, 1)) + gen(i, 3);
    end
    PQa = PQa / base;

    V = bus(:, 8);
    H = bus(:, 9);
    V(V_num) = Vi;
    H(H_num) = Hi;
    n = size(bus, 1);
    Q = zeros(n, 1);
    G = real(Y);
    B = imag(Y);

    for i = 1:n
        sumq = 0;
        for j = 1:n
            sumq = sumq + V(i) * V(j) * (G(i, j) * sin(H(i) - H(j)) - B(i, j) * cos(H(i) - H(j)));
        end
        Q(i) = sumq;
    end

    dertaQ = PQa(Q_num) - Q(Q_num);
end

% 损失函数（平方误差总和）
function l = loss(a, b)
    l = sum((a - b).^2);
end
