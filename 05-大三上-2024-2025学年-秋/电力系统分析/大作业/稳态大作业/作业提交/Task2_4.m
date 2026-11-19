clear;
clc;

% 原始系统
pm = case14; 
base = pm.baseMVA;
fprintf('原始系统潮流计算结果：\n');
key_original = runpf(pm);

% 修改系统
pm_modified = pm;
pm_modified.bus(1, 2) = 2;
pm_modified.bus(3, 2) = 3; 

fprintf('\n修改后系统潮流计算结果：\n');
key_modified = runpf(pm_modified);

% 提取电压幅值和相角
V_original = key_original.bus(:, 8); 
H_original = key_original.bus(:, 9);

V_modified = key_modified.bus(:, 8); 
H_modified = key_modified.bus(:, 9); 

% 计算误差
V_diff = abs(V_original - V_modified); % 电压幅值误差
H_diff = abs(H_original - H_modified); % 相角误差

% 输出对比
fprintf('\n节点电压幅值和相角对比 (原始 vs 修改后)：\n');
fprintf('节点编号\t原始电压 (p.u.)\t修改后电压 (p.u.)\t原始相角 (度)\t修改后相角 (度)\t电压误差\t相角误差\n');
for i = 1:size(pm.bus, 1)
    fprintf('%d\t\t%.4f\t\t\t%.4f\t\t\t%.4f\t\t%.4f\t\t%.4e\t\t%.4e\n', ...
        i, V_original(i), V_modified(i), H_original(i), H_modified(i), V_diff(i), H_diff(i));
end

% 绘制对比图
figure;

% 电压幅值对比
subplot(3, 1, 1);
plot(1:size(pm.bus, 1), V_original, 'o-', 1:size(pm.bus, 1), V_modified, 'x-');
legend('Original', 'Modified');
xlabel('Bus Index');
ylabel('Voltage Magnitude (p.u.)');
title('Voltage Magnitude Comparison');
grid on;

% 相角对比
subplot(3, 1, 2);
plot(1:size(pm.bus, 1), H_original, 'o-', 1:size(pm.bus, 1), H_modified, 'x-');
legend('Original', 'Modified');
xlabel('Bus Index');
ylabel('Voltage Angle (degree)');
title('Voltage Angle Comparison');
grid on;

% 节点间误差
subplot(3, 1, 3);
yyaxis left;
plot(1:size(pm.bus, 1), V_diff, 'o-');
ylabel('Voltage Difference (p.u.)');
yyaxis right;
plot(1:size(pm.bus, 1), H_diff, 'x-');
ylabel('Angle Difference (degree)');
xlabel('Bus Index');
title('Node Differences (Voltage and Angle)');
legend('Voltage Difference', 'Angle Difference');
grid on;
