%% ��ȡ����
clear;
dt_raw= csvread('3_15.csv');
t =  dt_raw(:,1);
x_raw =  dt_raw(:,2);

%% ��ͨ�˲���
% x_raw = cos(2*pi*4400*t) .*(1 + 0.1*cos(2*pi*20*t+pi/4));


% x_env = env_RC(x_raw , rct);
% subplot(2,1,1),plot(t,x_raw);
% title('Original signals');
% subplot(2,1,2),plot(t,x_env);
% title('Demodulated and true message signals for AM');

d = designfilt('lowpassiir','FilterOrder',3,'HalfPowerFrequency',60/5e3);
lpFilt = designfilt('lowpassiir','FilterOrder',8, ...
         'PassbandFrequency',100,'PassbandRipple',0.2, ...
         'SampleRate',10e3);
% fvtool(lpFilt)
H_am = demod_filter();
x_flt = filtfilt(lpFilt,x_raw);
x_env = envelope(x_flt,length(t));
figure(2)
plot(t,x_flt); hold on;
plot(t,x_env);

%% ��ͨ�˲���

fs = 10e3;
Wp = [45 55]/ (fs/2);
Ws = [35 65]/ (fs/2);
Rp = 4;
Rs = 20;
[n,Wn] = buttord(Wp,Ws,Rp,Rs);
[b,a] = butter(n,Wn,'bandpass');


x_flt = filtfilt(b,a,x_raw);
x_env = envelope(x_flt,length(t));
x_h = abs( hilbert(x_flt));
% figure(2)
plot(t,x_raw); hold on;
plot(t,x_env);

%% ���
x_renv = envelope(x_flt,length(t));

tt = t(2000:8000); xx_renv = x_renv(2000:8000); 
% plot(tt,x_raw(2000:8000)); hold on;
% plot(tt,xx_renv);

[fitresult, gof] = createFit(tt, xx_renv);

x_env =  fitresult(t);
%% 2 �����������
plot(t,x_flt); hold on;
plot(t,x_env);

%% 3 hilbert

d = designfilt('lowpassiir','FilterOrder',3,'HalfPowerFrequency',60/5e3);
lpFilt = designfilt('lowpassiir','FilterOrder',8, ...
         'PassbandFrequency',100,'PassbandRipple',0.2, ...
         'SampleRate',10e3);
x_flt = filtfilt(lpFilt,x_raw);
y_h = hilbert(x_flt);
plot(t,x_flt); hold on
plot(t,abs(y_h));

%% 4 ��ֵ���

d = designfilt('lowpassiir','FilterOrder',3,'HalfPowerFrequency',60/5e3);
lpFilt = designfilt('lowpassiir','FilterOrder',8, ...
         'PassbandFrequency',100,'PassbandRipple',0.2, ...
         'SampleRate',10e3);
x_flt = filtfilt(lpFilt,x_raw);
[K1,V1]=findpeaks(x_flt); % �󼫴�ֵλ�úͷ�ֵ
up=spline(V1,K1,1:length(t));          % �ڲ�,��ȡ�ϰ�������
% [K2,V2]=findpeaks(x);% ��Сֵλ�úͷ�ֵ
% down=spline(K2,V2,n);        % �ڲ�,��ȡ�°�������
plot(t,x_flt,'k'); hold on; grid;
plot(t,up,'r');
% plot(n,down,'r');
xlabel('����'); ylabel('��ֵ');
title('����ȡ����Сֵ������ȡ��������ͼ')
% set(gcf,'color','w');
x_env = up';

%% �Լ�ֵ�������

% tt = t(2000:8000); xx_renv = x_renv(2000:8000); 
% plot(tt,x_raw(2000:8000)); hold on;
% plot(tt,xx_renv);

tt = V1(3:47)*1e-4; kk = K1(3:47);
[fitresult, gof] = createFitKV(tt, kk);
x_env =  fitresult(t);
plot(t,x_flt); hold on;
plot(t,x_env);

%% ���
x_dem = x_raw./x_env;
plot(x_dem);

