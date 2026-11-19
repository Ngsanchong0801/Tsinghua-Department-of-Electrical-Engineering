%%%
read=readmatrix('Signal_basetask_15.csv');
%t=(0:1:9999)/10000;
%main(:,2)=main(:,2)+cos(300*2*pi*t)';
fs=10000; %采样率
main=read(:,2);
time=read(:,1);
len_data=length(main);
frequency=zeros(len_data,1);%返还len×1矩阵，绘图方便
amplitude=zeros(len_data,1);
phase=zeros(len_data,1);
window1=1000;
window2=400;
window3=600;
t1=4988;

window=0;
for i=1:len_data-window2
    if i<=t1-window1  
        window=window1; 
    elseif i>t1-window1&&i<=t1+window1
        window=window2;
    elseif i>t1+window1&&i<=len_data-window1
        window=window1;
    elseif i>len_data-window1&&i<=len_data-window3
        window=window3;
    elseif i>len_data-window3&&i<=len_data-window2
        window=window2;
    end
    [frequency(i),amplitude(i),phase(i)]=new_ffd(main(i:i+window),fs);%修正dft算法
    phase(i)=mod(phase(i)-100*pi*time(i),2*pi);%main(i,1)=(i-1)*1/10000
end

figure(1);
plot(amplitude)
figure(2);
plot(phase)
%amplitude(len_data-window+1:end)=amplitude(len_data-window);


%% 谐波
main=main.';  %转化为横向的数据
[peak_num, divide]=find_peak(main);  %找到峰值的位置，取隔整个峰值的数据；同时分开阶跃前后的数据
data1=main(peak_num(1):peak_num(divide-1));  %前半段待处理数据
data2=main(peak_num(divide):peak_num(length(peak_num)));  %后半段待处理数据
data1_len=length(data1);  %数据长度
data2_len=length(data2);
win1=blackmanharris(data1_len, 'periodic');  %按待处理数据长度找到相应的blackmanharris窗
win2=blackmanharris(data2_len, 'periodic');
w_data1=data1.*win1';  %数据加窗
w_data2=data2.*win2';
fft_w_data1=fft(w_data1);  %对加窗数据进行DFT
fft_w_data2=fft(w_data2);
[harm_wave1, fun_wave1]=harmonic(fft_w_data1);
[harm_wave2, fun_wave2]=harmonic(fft_w_data2);
all_harmonic(:,1)=(harm_wave2(2,:)'+harm_wave1(2,:)')/2;
all_harmonic(:,2)=sqrt(2)*(harm_wave2(3,:)'+harm_wave1(3,:)')/4;


%% 函数
function [harm_wave, fun_wave] = harmonic(fft_w_data)
    fs1=10000;  %采样频率
    dataN=length(fft_w_data);  %数据长度
    f_num=find_harmonic(fft_w_data);  %求频谱峰值角标（包含基波）
    f_amplitude=abs(fft_w_data(f_num));  %获取频谱峰值数组
  
    level=2;  %设置标准，幅值小于2的波峰都会被删去
    delX=find(f_amplitude(2,:)<level);%第2行对应峰值行
    f_amplitude(:,delX)=[];  %删除对应列
    f_num(:,delX)=[];

    [f_del,a_del]=blackmanHarris_fix(f_amplitude);  %分别计算频率和幅值的修正量
    fix_f=(f_num(2,:)+f_del-1)./dataN.*fs1;%频率修正；减1是因为DFT角标从0开始，而这里角标从1开始
    fix_a=(f_amplitude(1,:)+2.*f_amplitude(2,:)+f_amplitude(3,:)).*a_del./dataN;
    
    raw_angle=angle(fft_w_data); %计算修正后的基波和谐波相位
    real_angle=raw_angle(f_num(2,:))+0.5*pi-f_del.*pi;

    [~,fun_num]=max(sum(f_amplitude,1));  %找到基波对应列数
    total_num=1:length(f_num);
    harm_num=total_num(~ismember(total_num,fun_num));%删除基波对应索引
    harm_wave=[f_num(2, harm_num); fix_f(harm_num); fix_a(harm_num); real_angle(harm_num)]; % 原始角标 修正频率 修正幅值 修正相位
    fun_wave= [f_num(2, fun_num) ; fix_f(fun_num) ; fix_a(fun_num) ; real_angle(fun_num) ];
end

function [f_del, a_del] = blackmanHarris_fix(y)
    del = (y(3,:)-y(1,:))./y(2,:);
    f_del = 0.93899257.*del - 0.08204295.*del.^3 + 0.01543673.*del.^5 - 0.00323718.*del.^7;
    a_del = 1.65873277 + 0.44863535.*f_del.^2 + 0.0647887.*f_del.^4 + 0.00690108.*f_del.^6;
end

function harm_num = find_harmonic(fft_data)
    fft_data=abs(fft_data);
    data_len=length(fft_data)/2;
    harm_num=zeros(3, 5);  %存储频谱峰值的脚标及峰值左右两个位置的脚标
    index=1;
    for i=1+1:data_len-1
        if fft_data(i)>fft_data(i-1) && fft_data(i)>fft_data(i+1)  %逐一寻找频谱峰值位置
            harm_num(1,index)=i-1;
            harm_num(2,index)=i;
            harm_num(3,index)=i+1;
            index=index+1;
        end
    end
end

function [peak, divide] = find_peak(data_in)
    len = length(data_in);  % 获取时域长度
    peak = zeros(1, 40);  % 存储峰值角标
    help = 1;  % 辅助存储的角标
    margin = 10;  % 观察域，峰值要比左右各margin个点大
    for i = 1+margin: len-margin
        if data_in(i) == max(data_in(i-margin:i+margin))
            peak(help) = i;
            help = help + 1;   % 角标自增1
        end
    end

    divide = 0;  % 分隔阶跃前和阶跃后的角标
    for i = 2:length(peak)  % 若前一个峰值的1.1倍小于后一个峰值，则两个峰值显著不同，在此处进行划分
        if data_in(peak(i)) > data_in(peak(i-1))*1.1
            divide = i;
            break;
        end
    end
end

function [f0,A,phase] = new_ffd(x,fs)
    w=hamming(length(x));%创建hamming窗
    m=500; 
    a=0:1/m:0.5; %插值修正频率
    W=czt(w,m+1,exp(-2j*pi/(m*length(x))),1);
    index=1:length(a);
    A=abs(W(end-index+1))./abs(W(index));

    X=fft(x.*w);%计算加窗后的DFT
    Xa=abs(X);
    a0=find(Xa==max(Xa),1);
    if Xa(a0+1)>Xa(a0-1)
        a1=a0+1;
    else
        a1=a0-1;
    end    
    alpha=Xa(a1)/Xa(a0);
    dlt=spline(A, a, alpha);%线性插值，确定频率的偏差值
    N=length(x);

    if a1>a0    %频率修正
        f1=(a0+dlt-1)/N;
    else 
        f1=(a0-dlt-1)/N;
    end
    f0=f1*fs;

    k=0:N-1;
    W1=sum(w'.*exp(2j*pi*dlt*k/N));
    A=abs(sqrt(2)*X(a0)/W1);
    phase=angle(X(a0))-angle(W1);
end
