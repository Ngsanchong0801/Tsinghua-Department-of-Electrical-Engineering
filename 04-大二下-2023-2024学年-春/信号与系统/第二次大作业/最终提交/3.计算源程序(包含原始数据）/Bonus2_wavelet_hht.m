
%% extra2
close all;
read=readmatrix('Signal_extra2_15.csv');
A=read(:,2);
t=read(:,1);

%% 小波去噪
waveletname = 'coif5';
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
% sd5=zeros(1,length(d1)).';
% sd6=zeros(1,length(d1)).';
% sd4=wthresh(d4,'s',0.014);
sd5=wthresh(d5,'s',0.014);
sd6=wthresh(d6,'s',0.014);
sd7=wthresh(d7,'s',0.014);
c2=[a7;sd7;sd6;sd5;sd4;sd3;sd2;sd1];
A_pro=waverec(c2,l,waveletname); %小波重构 

figure(1);
plot(t,A,t,A_pro);

%% 利用Hilbert变换求幅值
fs=10000;
a = hilbert(A_pro);
fuzhi = abs(a);

figure(2);%原信号和幅值（包络线）
hold on
plot(t,A_pro);
plot(t,fuzhi);
hold off

