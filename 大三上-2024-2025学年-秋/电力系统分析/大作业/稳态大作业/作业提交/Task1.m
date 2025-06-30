function Y = Task1(pm)
    if nargin < 1
        pm = case14;
    end

    branch = pm.branch;
    bus = pm.bus;
    bindex = find(branch(:, 11) == 1); 
    bc = branch(bindex, :);

    % 初始化
    n = size(bus, 1); 
    m = size(bc, 1);  
    Y = zeros(n, n);

    for i = 1:m
        % 变压器变比
        ratio = bc(i, 9);
        if ratio == 0
            ratio = 1; 
        end

        % 支路导纳
        r = bc(i, 3);
        x = bc(i, 4);
        b = bc(i, 5);
        ys = (r - 1j * x) / (r^2 + x^2); 
        ybs = ys + 1j * b / 2;         

        % 更新导纳矩阵
        no1 = bc(i, 1);
        no2 = bc(i, 2);
        Y(no1, no2) = Y(no1, no2) - ys / ratio;   
        Y(no2, no1) = Y(no2, no1) - ys / ratio;   
        Y(no1, no1) = Y(no1, no1) + ybs / ratio^2; 
        Y(no2, no2) = Y(no2, no2) + ybs;          
    end

    % 节点自导纳
    for i = 1:n
        Y(i, i) = Y(i, i) + (bus(i, 5) + 1j * bus(i, 6)) / 100;
    end

    % 稀疏矩阵
    Y = sparse(Y);

    % 验证
    Y_standard = makeYbus(pm);    
    Y_loss = full(Y - Y_standard);

    max_loss = max(max(abs(Y_loss)));
    if max_loss >= 1e-12
        fprintf('Y矩阵求解误差过大,最大误差: %.2e\n', max_loss);
    else
        fprintf('Y矩阵求解正常,最大误差: %.2e\n', max_loss);
    end
end
