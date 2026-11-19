close all;  
%% 原始信号读取
read=readmatrix('Signal_basetask_15.csv');
A=read(:,2);
t=read(:,1);

fs = 10000;                % 采样频率10000Hz
Ts = 1 / fs;              % 采样时间间隔0.1ms
L = 10000;                 % 采样点数10000

figure(1);
plot(t,A);

%% 离散小波变换(DWT) Mallat算法
%用wavedec()进行7层分解，再重构生成近似系数和细节系数
%
% 小波分解 coif5, db3, mexh不行, sym4
wavename2 = 'coif5';
[d,a]=wavedec(A,7,wavename2);          

d1=wrcoef('d',d,a,wavename2,1);         %重构第1层细节系数  
d2=wrcoef('d',d,a,wavename2,2);         %重构第2层细节系数  
d3=wrcoef('d',d,a,wavename2,3);         %重构第3层细节系数  
d4=wrcoef('d',d,a,wavename2,4);         %重构第4层细节系数  
d5=wrcoef('d',d,a,wavename2,5);         %重构第5层细节系数  
d6=wrcoef('d',d,a,wavename2,6);         %重构第6层细节系数  
d7=wrcoef('d',d,a,wavename2,7);         %重构第7层细节系数  
a7=wrcoef('a',d,a,wavename2,7);         %重构第7层近似系数

figure(2); 
subplot(421);plot(d1);ylabel('细节信号d1');   %画出各层小波系数
subplot(422);plot(d2);ylabel('细节信号d2');
subplot(423);plot(d3);ylabel('细节信号d3');
subplot(424);plot(d4);ylabel('细节信号d4');
subplot(425);plot(d5);ylabel('细节信号d5');
subplot(426);plot(d6);ylabel('细节信号d6');
subplot(427);plot(d7);ylabel('细节信号d7');
title('小波分解');
subplot(428);plot(a7);ylabel('近似信号a7'); 
xlabel('时间'); 
figure(3);
plot(d1);ylabel('细节信号d1');xlabel('时间'); 
%}

%% 傅里叶变换观察突变信号频谱
%{
Y = fft(A,16384); % 对信号进行傅里叶变换
f = fs * (0 : (L / 2)) / L;
P2 = abs(Y / L);
P1 = P2(1 : L / 2 + 1);
figure(2)
plot(f,P1) 
title('突变信号的单边幅度频谱')
xlabel('f(Hz)')
ylabel('|P1(f)|')
% axis([0,100,0,0.5])
%}

%% 连续小波变换(CWT)
%{
[cfs,freq] = cwt(A,41:56,'mexh',Ts); % 对信号做连续小波变换，并作出系数图像'sym2'、mexh
figure(3); 
for ii = 1:16
    subplot(8,2,ii);     % subplot(x,y,n)x表示显示的行数，y表示列数，n表示第几幅图片
    plot(cfs(ii,:));
end
%}

%时频分析
%{
% 连续小波变换
wavename='cmor10-8';
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
figure
imagesc(t,f,abs(coefs));
set(gca,'YDir','normal')
colorbar;
xlabel('时间 t/s');
ylabel('频率 f/Hz');
title('小波时频图');
%}

%% 小波去噪
%{
[c,l]=wavedec(A,7,'coif5');           %对原始信号进行7层离散小波分解

a7=appcoef(c,l,'coif5',7); %获取低频信号
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
% sd5=zeros(1,length(d1)).';
% sd6=zeros(1,length(d1)).';
% sd4=wthresh(d4,'s',0.014);
sd5=wthresh(d5,'s',0.014);
sd6=wthresh(d6,'s',0.014);
sd7=wthresh(d7,'s',0.014);
c2=[a7;sd7;sd6;sd5;sd4;sd3;sd2;sd1];
A_pro=waverec(c2,l,'coif5'); %小波重构 

figure(5)
plot(t,A_pro);
%}

