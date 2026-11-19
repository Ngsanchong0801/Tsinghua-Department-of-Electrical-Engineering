close all;
data = readtable('Signal_extra2_15.csv');
A = data(:,2);
V_val = table2array(A);

% 包络线计算
y = zeros(10000, 1);
for n = 1:10000
    y(n) = V_val(n) / (7.3903 * cos((31.4030 * (n-1) / 10000) - 1.0430) + 82.3287); % 使用刘琎包络线
end

% 初始化变量
amp = zeros(10000, 1);
Amp = zeros(10000, 1);
phase = zeros(10000, 1);
fe = zeros(10000, 1);
N = 1000;

% 信号处理循环
for i = 1:10000
    if i <= 9000
        x = y(i:i+N-1);
        [fe_temp, a, fai] = FFT_Interpolate(x, N, i);
        if isempty(fe_temp) || isempty(a) || isempty(fai)
            error('FFT_Interpolate returned an empty value at iteration %d', i);
        end
        fe(i) = fe_temp;
        amp(i) = a / sqrt(2);
        phase(i) = wrapToPi( fai + 2 * pi * (fe_temp - 50) * (i-1) * 0.0001);
    else
        amp(i) = amp(i-N);
        fe(i) = fe(i-N);
        phase(i) = wrapToPi( phase(i-N) + 2 * pi * (fe(i-N) - 50) * N * 0.0001);
    end
end

% 调制
for i = 1:10000
    Amp(i) = amp(i) * (7.3903 * cos((31.4030 * (i-1) / 10000) - 1.0430) + 82.3287); % 使用刘琎包络线
end

% figure;
% plot(y);
% 绘制图形
x_label = 0:0.0001:0.9999;

figure;
plot(x_label, amp);
xlabel('时间/s');
ylabel('基波幅值/V');
title('调制前');

figure;
plot(x_label, Amp);
xlabel('时间/s');
ylabel('基波幅值/V');
title('调制后');

figure;
% phase=unwrap(phase);
plot(x_label, phase);
xlabel('时间/s');
ylabel('基波相角/rad');

figure;
plot(x_label, fe);
xlabel('时间/s');
ylabel('基波频率/Hz');
% 写入数组到csv表格数组
% 计算需要扩展的长度
max_length = length(x_label);

% 扩展数组使其具有相同长度
array1 = [x_label'; repmat("", max_length - length(x_label), 1)];
array2 = [Amp; repmat("", max_length - length(amp), 1)];
array3 = [phase; repmat("", max_length - length(phase), 1)];
array4 = [fe; repmat("", max_length - length(fe), 1)];
% 创建表格
T = table(array1, array2, array3, array4,'VariableNames', {'时间/s', '基波幅值（有效值）/V', '基波相角/rad','基波频率/Hz'});

% 将表格写入CSV文件
writetable(T, '组15_3.csv');
% FFT插值函数
function [fe, A, fai] = FFT_Interpolate(FFT_in, nfft, num)
    % FFT_in -- 复数正弦波
    % nfft -- FFT点数
    Ts = 0.0001;
    fs = 10000;
    w = hanning(nfft);
    x_win = FFT_in .* w;

    X = fft(x_win);
    abs_F = abs(X);

    [max_y, indexm] = max(abs_F);
    index1 = indexm - 1;
    index2 = indexm + 1;
    if index1 < 1
        index1 = nfft;
    end
    if index2 > nfft
        index2 = 1;
    end

    alpfa = (abs_F(index2) - abs_F(index1)) / abs_F(indexm);
    delta = 0.66666287 * alpfa - 0.0739832 * (alpfa^3) + 0.01587358 * (alpfa^5) - 0.00311639 * (alpfa^7);
    v_delta = v(delta);
    A = (abs_F(index1) + 2 * abs_F(indexm) + abs_F(index2)) * v_delta / nfft;
    fai_temp = angle(X(indexm)) - pi * delta;
    fe = (indexm - 1 + delta) * fs / nfft;
    fai = wrapToPi(fai_temp - 2 * pi * fe * (num-1) * 0.0001);
end

% 插值修正函数
function result = v(delta)
    result = 1.33333327 + 0.52658791 * (delta^2) + 0.11699742 * (delta^4) + 0.02103885 * (delta^6);
end
