clc; clear;
mpc = case33bw;

% 快速分解法
r_1 = evalc('[error1, iter1, et1] = quick(mpc, 1e-8);');

% FDXB算法
opt1 = mpoption('pf.alg', 'FDXB');
r_2 = evalc('PQ1 = runpf(mpc, opt1);');

% FDBX算法
opt2 = mpoption('pf.alg', 'FDBX');
r_3 = evalc('PQ2 = runpf(mpc, opt2);');

% 计算误差
error2 = iter_acc(mpc, PQ1.bus(:, 8), PQ1.bus(:, 9));
error3 = iter_acc(mpc, PQ2.bus(:, 8), PQ2.bus(:, 9));

% 结果矩阵
A = [error1, error2, error3]';  
B = [iter1, PQ1.iterations, PQ2.iterations]';  
C = [et1, PQ1.et, PQ2.et]';  

clear r_*;  

% 创建表格
solver = {'快速分解法', 'FDXB', 'FDBX'}; 
variety = {'迭代精度', '迭代次数', '迭代时间/s'}; 
tbl = table(A, B, C, 'VariableNames', variety, 'RowNames', solver);
disp(tbl);

%快速分解法
function [error, iter, et] = quick(mpc, tol1)
    tic; 
    iter = 0; 
    iter_max = 50; 
    
    if nargin < 2
        tol = 1e-5;
    else
        tol = tol1;
    end

    [bus, gen, baseMVA] = deal(mpc.bus, mpc.gen, mpc.baseMVA);
    Y = makeYbus(mpc);  % 创建导纳矩阵
    mpc.branch(:, 3) = 0;
    Y0 = makeYbus(mpc); 

    % 节点分类
    order1 = transpose(find(bus(:, 2) == 1)); 
    order2 = transpose(find(bus(:, 2) == 2)); 
    order3 = transpose(find(bus(:, 2) == 3)); 
    order = [order1, order2, order3];

    n = size(Y, 1);  % 总节点数
    r = size(order2, 2);  % PV节点数

    % 构造新的Y矩阵
    Y1 = Y(order, order);
    Y2 = Y0(order, order);
    G = real(Y1); 
    B = imag(Y1); 
    B0 = imag(Y2);
    Um_origin = bus(:, 8);
    Um = Um_origin(order);  % 各节点电压幅值
    Ua_origin = bus(:, 9) * (pi / 180);
    Ua = Ua_origin(order);  % 各节点电压相角

    % 负荷复功率
    Sd = bus(:, 3) + 1i * bus(:, 4);
    Sd(gen(:, 1)) = Sd(gen(:, 1)) - (gen(:, 2) + 1i * gen(:, 3));
    S_origin = -Sd / baseMVA;
    Psp = real(S_origin(order));  % 参考P
    Qsp = imag(S_origin(order));  % 参考Q

    delta_P = zeros(n - 1, 1);
    delta_Q = zeros(n - r - 1, 1);
    B1 = B(1:n - 1, 1:n - 1);
    B2 = B0(1:n - r - 1, 1:n - r - 1);

    % delta_P & delta_Q
    for i = 1:n - 1
        P_temp = Um .* (G(i, :)' .* cos(Ua(i) - Ua) + B(i, :)' .* sin(Ua(i) - Ua));
        delta_P(i) = Psp(i) - Um(i) * sum(P_temp);
        if i < n - r
            Q_temp = Um .* (G(i, :)' .* sin(Ua(i) - Ua) - B(i, :)' .* cos(Ua(i) - Ua));
            delta_Q(i) = Qsp(i) - Um(i) * sum(Q_temp);
        end
    end

    delta = [delta_P; delta_Q]; 

    inv_B1 = B1 \ eye(n - 1);
    inv_B2 = B2 \ eye(n - r - 1);

    fprintf('未迭代误差: %.4e\n', max(abs(delta)));
    while max(abs(delta)) > tol && iter < iter_max
        iter = iter + 1;

        % 电压相角修正
        error_Ua = inv_B1 * (delta_P ./ Um(1:n - 1));
        Ua = Ua - [error_Ua; 0] .* Um;

        % delta_Q
        for i = 1:n - r - 1
            Q_temp = Um .* (G(i, :)' .* sin(Ua(i) - Ua) - B(i, :)' .* cos(Ua(i) - Ua));
            delta_Q(i) = Qsp(i) - Um(i) * sum(Q_temp);
        end

        % 电压幅值修正
        error_Um = inv_B2 * (delta_Q ./ Um(1:n - r - 1));
        Um = Um - [error_Um; zeros(r + 1, 1)];

        % delta_P & delta_Q 更新
        for i = 1:n - 1
            P_temp = Um .* (G(i, :)' .* cos(Ua(i) - Ua) + B(i, :)' .* sin(Ua(i) - Ua));
            delta_P(i) = Psp(i) - Um(i) * sum(P_temp);
            if i < n - r
                Q_temp = Um .* (G(i, :)' .* sin(Ua(i) - Ua) - B(i, :)' .* cos(Ua(i) - Ua));
                delta_Q(i) = Qsp(i) - Um(i) * sum(Q_temp);
            end
        end

        delta = [delta_P; delta_Q];  % 功率方程
    end
    error = max(abs(delta));
    et = toc;

    if iter == iter_max
        disp('迭代失败！');
        disp(['最终误差： ', num2str(error)]);
    else
        disp(['迭代次数： ', num2str(iter)]);
        disp(['最终误差： ', num2str(error)]);
        disp(['代码的运行时间为：', num2str(et), ' 秒']);
    end
end

%计算迭代精度
function A = iter_acc(mpc, Um, Ua)
    Y = makeYbus(mpc);  % 导纳矩阵
    [bus, gen, baseMVA] = deal(mpc.bus, mpc.gen, mpc.baseMVA);

    Ua = Ua * (pi / 180);  % 转换为弧度
    G = real(Y);
    B = imag(Y);
    Sd = bus(:, 3) + 1i * bus(:, 4);  % 负荷复功率
    Sd(gen(:, 1)) = Sd(gen(:, 1)) - (gen(:, 2) + 1i * gen(:, 3));
    S = -Sd / baseMVA;
    Psp = real(S);  % 参考P
    Qsp = imag(S);
    n = length(Y);
    delta_P = zeros(n, 1);
    delta_Q = zeros(n, 1);
    order3 = find(bus(:, 2) == 3);

    % delta_P & delta_Q 计算
    for i = 1:n
        P_temp = Um .* (G(i, :)' .* cos(Ua(i) - Ua) + B(i, :)' .* sin(Ua(i) - Ua));
        Q_temp = Um .* (G(i, :)' .* sin(Ua(i) - Ua) - B(i, :)' .* cos(Ua(i) - Ua));
        delta_P(i) = Psp(i) - Um(i) * sum(P_temp);
        delta_Q(i) = Qsp(i) - Um(i) * sum(Q_temp);
    end
    delta_P(order3) = [];
    delta_Q(order3) = [];
    delta = [delta_P; delta_Q];  % 功率方程
    A = max(abs(delta));  % 返回最大误差
end
