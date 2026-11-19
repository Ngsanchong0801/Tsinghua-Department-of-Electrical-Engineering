clc; clear; close all;

%% 作业8：光伏电站硅片选择
% 光伏电池模型：
% I = (G/G0)*Iph0 - Is*(exp(U/UT)-1)
% P = U * I

%% 已知参数
G  = 800;        % 实际光照强度 W/m^2
G0 = 1000;       % 参考光照强度 W/m^2
UT = 26e-3;      % 温度电压 V

% P型硅片参数
Iph0_P = 9.29;          % A
Is_P   = 2.20e-11;      % A

% N型硅片参数
Iph0_N = 9.20;          % A
Is_N   = 3.71e-12;      % A

%% 计算实际光照下的光生电流
Iph_P = (G/G0) * Iph0_P;
Iph_N = (G/G0) * Iph0_N;

%% 计算开路电压 Voc
% 当 I = 0 时：
% Voc = UT * ln(Iph/Is + 1)
Voc_P = UT * log(Iph_P / Is_P + 1);
Voc_N = UT * log(Iph_N / Is_N + 1);

%% 设置电压扫描范围
Umax = max(Voc_P, Voc_N);
U = linspace(0, Umax, 2000);

%% 计算电流
I_P = Iph_P - Is_P .* (exp(U ./ UT) - 1);
I_N = Iph_N - Is_N .* (exp(U ./ UT) - 1);

% 将开路电压之后的负电流部分去掉，避免影响曲线显示
I_P(I_P < 0) = NaN;
I_N(I_N < 0) = NaN;

%% 计算功率
P_P = U .* I_P;
P_N = U .* I_N;

%% 找最大功率点
[Pmax_P, idx_P] = max(P_P);
[Ump_P] = U(idx_P);
Imp_P = I_P(idx_P);

[Pmax_N, idx_N] = max(P_N);
[Ump_N] = U(idx_N);
Imp_N = I_N(idx_N);

%% 绘图
figure;

plot(U, P_P, 'LineWidth', 1.8); hold on;
plot(U, P_N, 'LineWidth', 1.8);

% 标出最大功率点
plot(Ump_P, Pmax_P, 'o', 'MarkerSize', 8, 'LineWidth', 1.8);
plot(Ump_N, Pmax_N, 's', 'MarkerSize', 8, 'LineWidth', 1.8);

grid on;
xlabel('电压 U / V');
ylabel('功率 P / W');
title('G = 800 W/m^2 下 P型与 N型硅片的功率-电压曲线');

legend('P型硅片', 'N型硅片', ...
       'P型最大功率点', 'N型最大功率点', ...
       'Location', 'best');

%% 输出结果
fprintf('========== P型硅片 ==========\n');
fprintf('光生电流 Iph = %.4f A\n', Iph_P);
fprintf('开路电压 Voc = %.4f V\n', Voc_P);
fprintf('最大功率点电压 Ump = %.4f V\n', Ump_P);
fprintf('最大功率点电流 Imp = %.4f A\n', Imp_P);
fprintf('最大功率 Pmax = %.4f W\n\n', Pmax_P);

fprintf('========== N型硅片 ==========\n');
fprintf('光生电流 Iph = %.4f A\n', Iph_N);
fprintf('开路电压 Voc = %.4f V\n', Voc_N);
fprintf('最大功率点电压 Ump = %.4f V\n', Ump_N);
fprintf('最大功率点电流 Imp = %.4f A\n', Imp_N);
fprintf('最大功率 Pmax = %.4f W\n\n', Pmax_N);

%% 仅从最大功率角度进行选择
if Pmax_N > Pmax_P
    fprintf('结论：仅从最大功率角度出发，应选择 N型硅片。\n');
else
    fprintf('结论：仅从最大功率角度出发，应选择 P型硅片。\n');
end