clc;
clear;
close all;

%% ===============================
%  储能电池 BMS 参数辨识作业
%  模型：
%  U(k)=a1+a2*U(k-1)+a3*ln(SOC(k))+a4*ln(1-SOC(k))+a5*I(k)+a6*I(k-1)
%  参数向量：
%  A=[a1 a2 a3 a4 a5 a6]^T
%% ===============================

files = {'0mV.mat', '1mV.mat', '3mV.mat'};
caseNames = {'0mV', '1mV', '3mV'};

numCases = length(files);

A_all = nan(numCases, 6);
MSE_all = nan(numCases, 1);
RMSE_all = nan(numCases, 1);
MAE_all = nan(numCases, 1);

figure('Name', '实验电压与模型回归电压对比');

for idx = 1:numCases

    %% 1. 判断文件是否存在
    if ~isfile(files{idx})
        fprintf('文件 %s 不存在，跳过该组数据。\n', files{idx});
        continue;
    end

    %% 2. 加载数据
    data = load(files{idx});

    % 根据你上传的 0mV.mat，数据保存在 batterydata 结构体中
    U = data.batterydata.U;
    I = data.batterydata.I;
    SOC = data.batterydata.soc;

    % 转换为列向量，方便矩阵运算
    U = U(:);
    I = I(:);
    SOC = SOC(:);

    N = length(U);

    %% 3. 数据预处理
    % 防止 SOC=0 或 SOC=1 时 log 函数出现 Inf
    eps_value = 1e-6;
    SOC(SOC <= 0) = eps_value;
    SOC(SOC >= 1) = 1 - eps_value;

    %% 4. 构造最小二乘矩阵
    % Y = [U(2), U(3), ..., U(N)]^T
    Y = U(2:N);

    % X = [1, U(k-1), ln(SOC(k)), ln(1-SOC(k)), I(k), I(k-1)]
    X = [
        ones(N-1, 1), ...
        U(1:N-1), ...
        log(SOC(2:N)), ...
        log(1 - SOC(2:N)), ...
        I(2:N), ...
        I(1:N-1)
    ];

    %% 5. 最小二乘参数辨识
    % A = (X'X)^(-1)X'Y
    % Matlab 中推荐使用反斜杠，数值稳定性更好
    A = X \ Y;

    %% 6. 模型回归电压
    U_fit = X * A;

    %% 7. 误差计算
    err = Y - U_fit;

    MSE = mean(err.^2);
    RMSE = sqrt(MSE);
    MAE = mean(abs(err));

    %% 8. 保存结果
    A_all(idx, :) = A.';
    MSE_all(idx) = MSE;
    RMSE_all(idx) = RMSE;
    MAE_all(idx) = MAE;

    %% 9. 绘图
    subplot(numCases, 1, idx);

    plot(2:N, Y, 'LineWidth', 1.1);
    hold on;
    plot(2:N, U_fit, '--', 'LineWidth', 1.1);
    grid on;

    xlabel('采样点 k');
    ylabel('电压 U / V');
    title([caseNames{idx}, ' 测量误差下实验值与模型回归值对比']);
    legend('实验测量值', '模型回归值');

end

%% 10. 输出参数辨识结果
ParameterTable = array2table(A_all, ...
    'VariableNames', {'a1', 'a2', 'a3', 'a4', 'a5', 'a6'}, ...
    'RowNames', caseNames);

ErrorTable = table(MSE_all, RMSE_all, MAE_all, ...
    'VariableNames', {'MSE', 'RMSE', 'MAE'}, ...
    'RowNames', caseNames);

disp('================ 参数辨识结果 ================');
disp(ParameterTable);

disp('================ 误差分析结果 ================');
disp(ErrorTable);

%% 11. 保存结果到 Excel
ResultTable = [ParameterTable ErrorTable];
writetable(ResultTable, 'BMS_Parameter_Identification_Result.xlsx', ...
    'WriteRowNames', true);

fprintf('计算完成，结果已保存为 BMS_Parameter_Identification_Result.xlsx\n');