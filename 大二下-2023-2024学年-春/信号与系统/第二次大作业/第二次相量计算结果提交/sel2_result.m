%% ��ȡ����
data = readtable('Signal_extra2_15.csv', 'VariableNamingRule', 'preserve');
t = table2array(data(:,1));
x_raw = table2array(data(:,2));

%% ��ֵ���
d = designfilt('lowpassiir', 'FilterOrder', 3, 'HalfPowerFrequency', 60/5e3);
lpFilt = designfilt('lowpassiir', 'FilterOrder', 8, ...
    'PassbandFrequency', 100, 'PassbandRipple', 0.2, ...
    'SampleRate', 10e3);
x_flt = filtfilt(lpFilt, x_raw);
[K1, V1] = findpeaks(x_flt); % �󼫴�ֵλ�úͷ�ֵ
up = spline(V1, K1, 1:length(t)); % �ڲ壬��ȡ�ϰ�������

figure;
plot(t, x_flt, 'k'); hold on; grid;
plot(t, up, 'r');
xlabel('����'); ylabel('��ֵ');
title('����ȡ����Сֵ������ȡ��������ͼ');
x_env = up';

%% �Լ�ֵ�������
tt = V1(3:47) * 1e-4;
kk = K1(3:47);
[fitresult, gof] = createFitKV(tt, kk);
x_env = fitresult(t);
plot(t, x_flt); hold on;
plot(t, x_env);

%% ���
x_dem = x_raw ./ x_env;
x_raw = x_dem';

%% г���ͼ�г������
f1 = 51.6983; % ������ f1 = 50��Fourier ������Ի���Ƶ������
H = [1, 2, 3, 5, 4.5, 11, 13, 19, 29]; % ���������Եõ��Ŀ���г�����г������
f = H .* f1; % �趨��Ҫ������Ƶ��
fs = 10e3; 
N = 3600;

w = blackmanharris(N); w = w';
Xwf = fft(x_raw(1:N) .* w);
ywf = abs(Xwf(1:N/2)); % Ƶ�׷�ֵ
agwf = angle(Xwf(1:N/2)); % Ƶ����λ
for k = 1:N/2
    if (ywf(k) < 1e-4 * N / 2)
        agwf(k) = 0;
    end
    if (ywf(k) < 0)
        agwf(k) = agwf(k) + 2 * pi; % ������0-2pi
    end
end

fmin = fs / N;
kini = round(H * f1 / fmin); % ����г����Ӧ���±�(��0��ʼ)
for k = 1:length(H)
    km(k) = searchpeaks(ywf, kini(k) + 1); % km Ϊ�׷�(��1��ʼ)
    k1 = km(k) - 1;
    k2 = km(k) + 1;
    beta(k) = (ywf(k2) - ywf(k1)) / ywf(km(k));
    alpha(k) = 0.9389189 * beta(k) - 0.082038 * beta(k)^3 + 0.0154115 * beta(k)^5 - 0.0031699 * beta(k)^7;
    Ax(k) = (2 * ywf(km(k)) + ywf(k1) + ywf(k2)) / N * (1.6586636 + 0.4486538 * alpha(k)^2 + 0.0647873 * alpha(k)^4 + 0.0069383 * alpha(k)^6); % ���Ʒ�ֵ
    phax(k) = agwf(km(k)) + pi/2 - pi * alpha(k); % ������λ
end
fx = (km + alpha - 1) * fmin; % ����Ƶ��

%% г���������
x_f = zeros(9600, length(H));
amp_f = zeros(9600, length(H));
deg_f = zeros(9600, length(H));
for k = 1:length(H)
    amp_f(:, k) = Ax(k) * ones(9600, 1) / sqrt(2); % ��ֵ
    deg_f(:, k) = 2 * pi * (fx(k) - f1) .* t + phax(k) - pi/2; % ���
    x_f(:, k) = Ax(k) * cos(2 * pi * f1 .* t + deg_f(:, k)); % ʱ������
end

xtot_f = sum(x_f, 2); % �������ϸ���г����ֵ

%% ������ֵ�����ʱ��仯����
A1 = x_env .* amp_f(:, 1);
phi1 = 2 * pi * (fx(1) - 50) .* t + phax(1) - pi/2;
phi1 = to2pi(phi1);
x1 = sqrt(2) * A1' .* cos(2 * pi * 50 .* t + phi1);

figure;
subplot(2,1,1);
plot(t, A1); 
title('��ֵ');
xlabel('t(s)');

subplot(2,1,2);
plot(t, phi1, 'm'); 
title('���');
xlabel('t(s)');

%% ���������������CSV
writematrix([t, x_env], 'extra2.csv');

%% ���������ֵ�������CSV
writematrix([t, A1, phi1], '15_3.csv');
