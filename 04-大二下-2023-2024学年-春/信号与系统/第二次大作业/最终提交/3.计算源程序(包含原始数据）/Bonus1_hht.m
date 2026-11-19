%% extra1
close all;
read=readmatrix('Signal_extra1_15.csv');
A=read(:,2);
t=read(:,1);
% figure(1);%原信号
% plot(t,A);

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

%% 利用Hilbert变换求幅值、频率
fs=10000;
a = hilbert(A);
fuzhi = 0.5*sqrt(2)*abs(a);

figure(2); hold on %原信号和幅值
plot(t,A);
plot(t,fuzhi);
hold off

% 幅值处理,去除边界效应
fuzhi_smooth = smoothdata(fuzhi(201:9800),'gaussian',600); % 使用高斯加权法，窗口长度为1200

figure(3);hold on
plot(t(201:9800), fuzhi(201:9800));
plot(t(201:9800), fuzhi_smooth);
hold off

%相角、频率
fai = angle(a);
fai_unwrap = unwrap(fai); %去除相角突变（平移相位角）
fai_smooth = smoothdata( fai_unwrap, 'gaussian',150 );%对平移后的相位角做平滑处理
fnor = diff(fai_smooth)*5000/pi;
%{
for i = 101:9900
    if(fnor(i)<0 || fnor(i)>1000)
        fnor(i)=0.5*(fnor(i-1)+fnor(i+1));
    end
end
%}

fnor_smooth = smoothdata(fnor(501:9500),'gaussian',500);

figure(4);
% plot(t,fnor_smooth,t,fnor,'r');
plot(t(501:9500),fnor(501:9500),t(501:9500),fnor_smooth,'r');

delta_fai=fai_unwrap-100*pi*t;
delta_fai_smooth = smoothdata(delta_fai,'gaussian',400);
figure(5)
plot(t,fai);
figure(6)
plot(t,delta_fai_smooth);%t,delta_fai,

%{
% 对第一部分数据使用线性拟合
fai1 = polyfit(t(1:6550), delta_fai(1:6550), 1);
% 对第二部分数据使用线性拟合
fai2 = polyfit(t(6551:10000), delta_fai(6551:10000), 1);
delta_fai_smooth = [polyval(fai1,t(1:6550));polyval(fai2,t(6551:10000))];
% delta_fai_smooth = smoothdata(delta_fai,'gaussian',100 );
%}


%{
% 近似模态分解分解
imf = emd(A,'Display',1);
figure(5);
for ii = 1:6
    subplot(6,1,ii);     % subplot(x,y,n)x表示显示的行数，y表示列数，n表示第几幅图片
    plot(imf(:,ii));
end
%
a = hilbert(imf(:,1));

%{ 
% emd的幅值突变
fuzhi = abs(a);
fuzhi_smooth = smoothdata(fuzhi(101:9900),'gaussian',600); % 使用高斯加权法，窗口长度为1200

figure(5);hold on
plot(t(101:9900), fuzhi(101:9900));
plot(t(101:9900), fuzhi_smooth);
hold off
%}

%
%相角、频率
fai = angle(a);
fnor = diff(fai)*5000/pi;
for i = 101:9900
    if(fnor(i)<0 || fnor(i)>1000)
        fnor(i)=0.5*(fnor(i-1)+fnor(i+1));
    end
end
%

fnor_smooth = smoothdata(fnor(101:9900),'gaussian',250);

figure(6);
% plot(t,fnor_smooth,t,fnor,'r');
plot(t(101:9900),fnor(101:9900),t(101:9900),fnor_smooth,'r');
%}
