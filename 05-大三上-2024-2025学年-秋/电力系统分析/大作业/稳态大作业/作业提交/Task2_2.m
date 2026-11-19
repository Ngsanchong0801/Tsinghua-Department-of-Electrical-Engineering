function [Ho, Vo] = newton(gen, bus, Y, P_num, Q_num, H_num, V_num, Hi, Vi, baseMVA)
    if nargin == 0
        % 默认case14数据
        pm = case14;
        pm = ext2int(pm); 

        % 提取参数
        baseMVA = pm.baseMVA;       
        Y = makeYbus(pm);          
        bus = pm.bus;               
        bus(:, 9) = bus(:, 9) .* (2 * pi / 360); % 转换相角为弧度制
        gen = pm.gen;               

        % 节点分类
        list_1 = find(bus(:, 2) == 1); % PQ节点
        list_2 = find(bus(:, 2) == 2); % PV节点
        list_3 = find(bus(:, 2) == 3); % 平衡节点

        % 节点索引
        P_num = sort([list_1; list_2]); % 有功平衡节点
        Q_num = list_1;                 % 无功平衡节点
        H_num = P_num;                  % 相角待求节点
        V_num = list_1;                 % 电压幅值待求节点

        % 初始化电压和相角
        Hi = bus(H_num, 9);            
        Vi = bus(V_num, 8);             
    end

    % 初始化功率
    PQd = bus(:, [3, 4]);           
    PQa = -PQd;                     
    n_gen = size(gen, 1);

    % 更新发电机的功率注入
    for i = 1:n_gen
        PQa(gen(i, 1), 1) = PQa(gen(i, 1), 1) + gen(i, 2); % 有功
        PQa(gen(i, 1), 2) = PQa(gen(i, 1), 2) + gen(i, 3); % 无功
    end
    PQa = PQa / baseMVA; 

    % 初始化母线电压和相角
    V = bus(:, 8);
    H = bus(:, 9);
    V(V_num) = Vi;
    H(H_num) = Hi;

    % 初始化功率矩阵
    n = size(bus, 1);
    P = zeros(n, 1);
    Q = zeros(n, 1);
    G = real(Y);
    B = imag(Y);

    % 计时开始
    tic; % 开始计时

    % 计算母线的有功和无功功率
    for i = 1:n
        sump = 0;
        sumq = 0;
        for j = 1:n
            sump = sump + V(i) * V(j) * (G(i, j) * cos(H(i) - H(j)) + B(i, j) * sin(H(i) - H(j)));
            sumq = sumq + V(i) * V(j) * (G(i, j) * sin(H(i) - H(j)) - B(i, j) * cos(H(i) - H(j)));
        end
        P(i) = sump;
        Q(i) = sumq;
    end

    % 计算功率不平衡量
    derta_P = PQa(P_num, 1) - P(P_num);
    derta_Q = PQa(Q_num, 2) - Q(Q_num);

    % 初始化雅可比矩阵
    H0 = zeros(length(P_num), length(H_num));
    N0 = zeros(length(P_num), length(V_num));
    J0 = zeros(length(Q_num), length(H_num));
    L0 = zeros(length(Q_num), length(V_num));

    % 计算雅可比矩阵分块
    for i = 1:length(P_num)
        for j = 1:length(H_num)
            a = P_num(i);
            b = H_num(j);
            if a ~= b
                H0(i, j) = -V(a) * V(b) * (G(a, b) * sin(H(a) - H(b)) - B(a, b) * cos(H(a) - H(b)));
            else
                H0(i, j) = Q(a) + V(a)^2 * B(a, a);
            end
        end
    end

    for i = 1:length(P_num)
        for j = 1:length(V_num)
            a = P_num(i);
            b = V_num(j);
            if a ~= b
                N0(i, j) = -V(a) * V(b) * (G(a, b) * cos(H(a) - H(b)) + B(a, b) * sin(H(a) - H(b)));
            else
                N0(i, j) = -P(a) - V(a)^2 * G(a, a);
            end
        end
    end

    for i = 1:length(Q_num)
        for j = 1:length(H_num)
            a = Q_num(i);
            b = H_num(j);
            if a ~= b
                J0(i, j) = V(a) * V(b) * (G(a, b) * cos(H(a) - H(b)) + B(a, b) * sin(H(a) - H(b)));
            else
                J0(i, j) = -P(a) + V(a)^2 * G(a, a);
            end
        end
    end

    for i = 1:length(Q_num)
        for j = 1:length(V_num)
            a = Q_num(i);
            b = V_num(j);
            if a ~= b
                L0(i, j) = -V(a) * V(b) * (G(a, b) * sin(H(a) - H(b)) - B(a, b) * cos(H(a) - H(b)));
            else
                L0(i, j) = -Q(a) + V(a)^2 * B(a, a);
            end
        end
    end

    % 组装雅可比矩阵并求解
    C = [H0, N0; J0, L0];
    key = C \ [derta_P; derta_Q];

    % 更新
    Ho = key(1:length(Hi));
    Vo = key(length(Hi) + 1:end);
    H(H_num) = Hi - Ho;
    V(V_num) = Vi - V(V_num) .* Vo;

    % 输出结果
    final_H = H .* (360 / (2 * pi)); 
    final_V = V; 
    elapsed_time = toc; 

    fprintf('最终每个节点的电压幅值和相角：\n');
    fprintf('节点编号\t电压幅值 (p.u.)\t电压相角 (度)\n');
    for i = 1:length(V)
        fprintf('%d\t\t%.4f\t\t\t%.4f\n', i, final_V(i), final_H(i));
    end
    fprintf('\n迭代耗时：%.4f 秒', elapsed_time);
end
