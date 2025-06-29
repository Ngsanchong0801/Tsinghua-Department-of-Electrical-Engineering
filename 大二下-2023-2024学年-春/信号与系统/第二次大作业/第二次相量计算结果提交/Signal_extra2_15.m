%% 读取数据
data = readtable('Signal_extra2_15.csv', 'VariableNamingRule', 'preserve');
t = table2array(data(:,1));
x_raw = table2array(data(:,2));
N = length(t); % 确保 t 的长度一致

%% 极值拟合
d = designfilt('lowpassiir', 'FilterOrder', 3, 'HalfPowerFrequency', 60/5e3);
lpFilt = designfilt('lowpassiir', 'FilterOrder', 8, ...
    'PassbandFrequency', 100, 'PassbandRipple', 0.2, ...
    'SampleRate', 10e3);
x_flt = filtfilt(lpFilt, x_raw);
[K1, V1] = findpeaks(x_flt); % 求极大值位置和幅值
up = spline(V1, K1, 1:N); % 内插，获取上包络曲线

figure;
plot(t, x_flt, 'k'); hold on; grid;
plot(t, up, 'r');
xlabel('样点'); ylabel('幅值');
title('用求取极大极小值方法获取包络曲线图');
x_env = up';

%% 对极值曲线拟合
tt = V1(3:47) * 1e-4;
kk = K1(3:47);
fitresult = fit(tt, kk, 'smoothingspline');
x_env = feval(fitresult, t);
plot(t, x_flt); hold on;
plot(t, x_env);

%% 解调
x_dem = x_raw ./ x_env;
x_raw = x_dem';

%% 谐波和间谐波分析
f1 = 51.6983; % 首先设 f1 = 50，Fourier 分析后对基波频率修正
H = [1, 2, 3, 5, 4.5, 11, 13, 19, 29]; % 经初步尝试得到的可能谐波与间谐波次数
f = H .* f1; % 设定需要分析的频率
fs = 10e3;

w = blackmanharris(N); w = w';
Xwf = fft(x_raw(1:N) .* w);
ywf = abs(Xwf(1:floor(N/2))); % 频谱幅值
agwf = angle(Xwf(1:floor(N/2))); % 频谱相位
for k = 1:floor(N/2)
    if (ywf(k) < 1e-4 * N / 2)
        agwf(k) = 0;
    end
    if (ywf(k) < 0)
        agwf(k) = agwf(k) + 2 * pi; % 调整到0-2pi
    end
end

fmin = fs / N;
kini = round(H * f1 / fmin); % 各次谐波对应的下标(从0开始)
for k = 1:length(H)
    % 使用 findpeaks 查找谱峰
    [pks, locs] = findpeaks(ywf, 'MinPeakHeight', 0.1 * max(ywf)); % 这里设置一个最小峰值高度
    [~, idx] = min(abs(locs - (kini(k) + 1))); % 找到离目标频率最近的峰
    km(k) = locs(idx); % km 为谱峰(从1开始)
    k1 = km(k) - 1;
    k2 = km(k) + 1;
    beta(k) = (ywf(k2) - ywf(k1)) / ywf(km(k));
    alpha(k) = 0.9389189 * beta(k) - 0.082038 * beta(k)^3 + 0.0154115 * beta(k)^5 - 0.0031699 * beta(k)^7;
    Ax(k) = (2 * ywf(km(k)) + ywf(k1) + ywf(k2)) / N * (1.6586636 + 0.4486538 * alpha(k)^2 + 0.0647873 * alpha(k)^4 + 0.0069383 * alpha(k)^6); % 估计幅值
    phax(k) = agwf(km(k)) + pi/2 - pi * alpha(k); % 估计相位
end
fx = (km + alpha - 1) * fmin; % 估计频率

%% 谐波分析结果
x_f = zeros(N, length(H)); % 使用 N 而不是 9600
amp_f = zeros(N, length(H));
deg_f = zeros(N, length(H));
for k = 1:length(H)
    amp_f(:, k) = Ax(k) * ones(N, 1) / sqrt(2); % 幅值
    deg_f(:, k) = 2 * pi * (fx(k) - f1) .* t + phax(k) - pi/2; % 相角
    x_f(:, k) = Ax(k) * cos(2 * pi * f1 .* t + deg_f(:, k)); % 时间序列
end

xtot_f = sum(x_f, 2); % 基波加上各次谐波的值

%% 基波幅值相角随时间变化曲线
A1 = x_env .* amp_f(:, 1);
phi1 = 2 * pi * (fx(1) - 50) .* t + phax(1) - pi/2;
phi1 = wrapTo2Pi(phi1);
x1 = sqrt(2) * A1' .* cos(2 * pi * 50 .* t + phi1);

figure;
subplot(2,1,1);
plot(t, A1); 
title('幅值');
xlabel('t(s)');

subplot(2,1,2);
plot(t, phi1, 'm'); 
title('相角');
xlabel('t(s)');

%% 保存包络线数据至CSV
writematrix([t, x_env], 'extra2.csv');

%% 保存基波幅值和相角至CSV
writematrix([t, A1, phi1], '15_3.csv');

%% wrapTo2Pi 函数
function phi = wrapTo2Pi(phi)
    phi = mod(phi, 2*pi);
end
