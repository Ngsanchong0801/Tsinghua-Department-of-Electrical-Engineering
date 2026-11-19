clc;
    % 参数
    T0 = 298; beta_total = 70; cp = 1005; k = 1.4; R = 287;
    
    % 1. 等温功耗 (极限)
    w_iso = R * T0 * log(beta_total);
    
    % 2. 计算不同级数的功耗 (假设 epsilon=1, 即完美冷却)
    stages = [1, 2, 3, 5, 10, 100];
    w_results = zeros(size(stages));
    
    for j = 1:length(stages)
        n = stages(j);
        beta_s = beta_total^(1/n);
        % 每级温升功之和
        w_results(j) = n * cp * T0 * (beta_s^((k-1)/k) - 1);
    end
    
    % 打印对比
    fprintf('等温压缩理论功: %.2f kJ/kg\n', w_iso/1000);
    for j = 1:length(stages)
        fprintf('%d 级压缩功: %.2f kJ/kg (比等温多 %.1f%%)\n', ...
            stages(j), w_results(j)/1000, (w_results(j)/w_iso - 1)*100);
    end
