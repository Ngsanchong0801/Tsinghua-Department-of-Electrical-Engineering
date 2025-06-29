close all;
% 读取信号数据
data = readtable('Signal_extra1_15.csv');
A = data(:,2);
V_val = table2array(A);
y2 = xiaoboquzao(V_val);
% 初始化变量
amp = zeros(10000, 1);
phase = zeros(10000, 1);
fe = zeros(10000, 1);
N = 600;
%利用内置函数snr计算信噪比
snr_value=snr(V_val,V_val-y2');
disp('信号信噪比：');
disp(snr_value);
%
% 信号处理循环
for i = 1:10000
    if i < 9400
        x = y2(i:i+N-1);
        [fe_temp, a, fai] = FFT_Interpolate(x, N, i);
        fe(i) = fe_temp;
        amp(i) = a / sqrt(2);
        % phase(i) = fai;
        phase(i) = wrapToPi( fai + 2 * pi * (fe_temp - 50) * (i-1) * 0.0001);
    end
    if i >= 9400
        amp(i) = amp(i-N);
        fe(i) = fe(i-N);
        phase(i) = wrapToPi(phase(i-N) + 2 * pi * (fe(i-N) - 50) * N * 0.0001);
        % phase(i) = phase(i-N) + 2 * pi * (fe(i-N) - 50) * N * 0.0001;
    end
end
%}
% 绘制基波幅值图
x_label = 0:0.0001:0.9999;
figure;
plot(x_label, amp);
xlabel('时间/s');
ylabel('基波幅值/V');

% 绘制基波相角图
% phase = unwrap(phase);
figure;
plot(x_label, phase);
xlabel('时间/s');
ylabel('基波相角/rad');

% 绘制基波频率图
figure;
plot(x_label, fe);
xlabel('时间/s');
ylabel('基波频率/Hz');
% 计算FFT插值和谐波
x = y2(1:4000);
[index, fe_hermonic, amp_hermonic] = hormonic(x, 4000);
figure(4);
stem(fe_hermonic, amp_hermonic/sqrt(2));
xlabel('频率 (Hz)');
ylabel('幅值 (V)');
title('谐波频谱图');
% 写入数组到csv表格数组
% 计算需要扩展的长度
max_length = length(x_label);

% 扩展数组使其具有相同长度
array1 = [x_label'; repmat("", max_length - length(x_label), 1)];
array2 = [amp; repmat("", max_length - length(amp), 1)];
array3 = [phase; repmat("", max_length - length(phase), 1)];
array4 = [fe_hermonic'; repmat("", max_length - length(fe_hermonic), 1)];
array5 = [amp_hermonic';repmat("", max_length - length(amp_hermonic), 1)];
% 创建表格
T = table(array1, array2, array3, array4,array5,'VariableNames', {'时间/s', '基波幅值（有效值）/V', '基波相角/rad','谐波频率/Hz','谐波幅值（最大值）/V'});

% 将表格写入CSV文件
writetable(T, '组15_2.csv');
% FFT插值函数
function [fe, A, fai] = FFT_Interpolate(FFT_in, nfft, num)
    % FFT_in -- 复数正弦波
    % nfft -- FFT点数
    Ts = 0.0001;
    fs = 10000;
    w = hanning(nfft);
    x_win = FFT_in .* w';

    X = fft(x_win);
    abs_F = abs(X);
    [max_value, indexm] = max(abs_F);
    index1 = indexm - 1;
    index2 = indexm + 1;
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

% 小波分解去噪
function result = xiaoboquzao(input_signal)
    % 进行7层小波分解，使用coif5小波基
    [coeffs, levels] = wavedec(input_signal', 7, 'coif5'); 
    
    % 提取低频成分
    low_freq_component = appcoef(coeffs, levels, 'coif5', 7); 
    
    % 提取高频细节成分
    detail_coeffs1 = detcoef(coeffs, levels, 1);
    detail_coeffs2 = detcoef(coeffs, levels, 2); 
    detail_coeffs3 = detcoef(coeffs, levels, 3);
    detail_coeffs4 = detcoef(coeffs, levels, 4);
    detail_coeffs5 = detcoef(coeffs, levels, 5);
    detail_coeffs6 = detcoef(coeffs, levels, 6);
    detail_coeffs7 = detcoef(coeffs, levels, 7);
    
    % 对1-2层高频细节置零，3-7层应用软阈值去噪处理
    denoised_detail1 = zeros(1, length(detail_coeffs1));
    denoised_detail2 = zeros(1, length(detail_coeffs2));
    % denoised_detail3 = zeros(1, length(detail_coeffs3));
    % denoised_detail2 = wthresh(detail_coeffs2, 's', 0.014);
    denoised_detail3 = wthresh(detail_coeffs3, 's', 0.014);
    denoised_detail4 = wthresh(detail_coeffs4, 's', 0.014);
    denoised_detail5 = wthresh(detail_coeffs5, 's', 0.014);
    denoised_detail6 = wthresh(detail_coeffs6, 's', 0.014);
    denoised_detail7 = wthresh(detail_coeffs7, 's', 0.014);
    
    % 重构所有小波系数
    reconstructed_coeffs = [low_freq_component, denoised_detail7, denoised_detail6, denoised_detail5, denoised_detail4, denoised_detail3, denoised_detail2, denoised_detail1];
    result = waverec(reconstructed_coeffs, levels, 'coif5'); % 小波重构
end
% 谐波计算函数
function [index, fe, A] = hormonic(FFT_in, nfft)
    % FFT_in -- 复数正弦波
    % nfft -- FFT点数
    Ts = 0.0001;
    fs = 10000;
    w = hanning(nfft);
    x_win = FFT_in .* w';

    X = fft(x_win);
    abs_F_temp = abs(X);
    % plot(abs_F_temp)
    abs_F = abs_F_temp(1:nfft/2);

    flag = 1;
    k = 1;
    while flag > 0
        [max_value, indexm] = max(abs_F);
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
        A(k) = (abs_F(index1) + 2 * abs_F(indexm) + abs_F(index2)) * v_delta / nfft;
        fe(k) = (indexm - 1 + delta) * fs / nfft;
        abs_F(indexm) = 0;
        abs_F(index1) = 0;
        abs_F(index2) = 0;
        if A(k) < 0.5
            flag = 0;
        end
        index(k) = indexm;
        k = k + 1;
    end
end

