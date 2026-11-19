close all;  
%% 原始信号读取
read=readmatrix('Signal_extra3.csv');
A=read(:,2);
t=read(:,1);

fs = 6400;                % 采样频率6400Hz
Ts = 1 / fs;              % 采样时间间隔0.1ms
L = 6400;                 % 采样点数10000

%% 小波去噪
% waveletname = 'coif5';
waveletname = 'db4';
% waveletname = 'sym4';
[c,l]=wavedec(A,7,waveletname);           %对原始信号进行7层离散小波分解

a7=appcoef(c,l,waveletname,7); %获取低频信号
%获取高频细节
d1=detcoef(c,l,1);
d2=detcoef(c,l,2); 
d3=detcoef(c,l,3);
d4=detcoef(c,l,4);
d5=detcoef(c,l,5);
d6=detcoef(c,l,6);
d7=detcoef(c,l,7);
% 1-3层置0,4-7层用软阈值函数处理
sd1=zeros(1,length(d1)).';
sd2=zeros(1,length(d2)).'; 
sd3=zeros(1,length(d3)).';
sd4=zeros(1,length(d1)).';
sd5=zeros(1,length(d1)).';
% sd6=zeros(1,length(d1)).';
% sd4=wthresh(d4,'s',0.014);
% sd5=wthresh(d5,'s',0.014);
sd6=wthresh(d6,'s',0.014);
sd7=wthresh(d7,'s',0.014);
c2=[a7;sd7;sd6;sd5;sd4;sd3;sd2;sd1];
A_pro=waverec(c2,l,waveletname); %小波重构 

figure(1);
plot(t,A,t,A_pro);
A = A_pro;

%% hilbert变换求幅值和相角、频率
A = smoothdata(A,'gaussian',5);
a = hilbert(A);
fuzhi = abs(a);

figure(2); hold on %原信号和幅值
plot(t,A);
plot(t,fuzhi);
hold off

% 幅值处理,去除边界效应
fuzhi_smooth = smoothdata(fuzhi(101:6300),'gaussian',300); % 使用高斯加权法，窗口长度为1200

figure(3);hold on
plot(t(101:6300), fuzhi(101:6300));
plot(t(101:6300), fuzhi_smooth);
hold off

%相角、频率
fai = angle(a);
fai_smooth = unwrap(fai); %去除相角突变（平移相位角）
fai_smooth = smoothdata( fai_smooth,'gaussian',200 );%对平移后的相位角做平滑处理
fnor = diff(fai_smooth)*3200/pi;

fnor_smooth = smoothdata(fnor(101:6300),'gaussian',500);

figure(4);

plot(t(101:6300),fnor(101:6300),t(101:6300),fnor_smooth,'r');

figure(5)
% plot(t,fai,t,fai_smooth);
plot(t,fai_smooth-100*pi*t);


%{
wavename='cmor1600-8';
% wavename='morl';
% wavename='db4';
% totalscal=500;
F1=46;
F2=56;
Fc=centfrq(wavename); % 小波的中心频率
% c=2*Fc*totalscal;
scals = floor(Fc*fs/F2) : floor(Fc*fs/F1);
f=scal2frq(scals,wavename,1/fs); % 将尺度转换为频率
coefs=cwt(A,scals,wavename); % 求连续小波系数
figure(2)
imagesc(t,f,abs(coefs));
set(gca,'YDir','normal')
colorbar;
xlabel('时间 t/s');
ylabel('频率 f/Hz');
title('小波时频图');
%}
