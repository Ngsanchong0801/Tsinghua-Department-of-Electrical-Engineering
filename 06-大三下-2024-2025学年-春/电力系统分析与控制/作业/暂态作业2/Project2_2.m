%% week13-暂态作业2
clear
clc
mpc=case39_UC;

t_break=10;  % 负载变化的时刻
derta_pload=1;  % 负载变化的大小（*100MVA）
tjbase=10;    % 惯性常数

% 绘制响应
for i=1:5
    derta_pload=0.70+0.1*i;
    [t1,f1]=fre_response(t_break,derta_pload,tjbase,mpc);
    figure(1);
    plot(t1,f1);
    title('负荷变化-频率曲线');
    xlabel('时间 (s)');
    ylabel('频率变化');
    grid on;
    hold on;
end
legend('70MW','80MW','90MW','100MW','110MW');

for i=1:3
    derta_pload=1;
    tjbase=3+6*(i-1);
    [t1,f1]=fre_response(t_break,derta_pload,tjbase,mpc);
    figure(2);
    plot(t1,f1);
    title('惯性常数变化-频率曲线');
    xlabel('时间 (s)');
    ylabel('频率变化');
    grid on;
    hold on;
end
legend('Tj=3s','Tj=9s','Tj=15s');




function [tout,fout]=fre_response(t_break,derta_pload,tjbase,mpc)
% gen_num=length(mpc.gen(:,1));
S_gen=mpc.gen(:,9);
Sbase=mpc.baseMVA;
fbase=50;

D_gen=[2.7;2.9;2.1;2.5;2.7;2.6;2.4;2.8;2.2;2.6];
K_gen=[15;16;22;21;20;28;23;17;18;21];
% Tg_gen=12*ones(10,1);
Tj_gen=tjbase*ones(10,1);

Ds=D_gen'*S_gen/Sbase;
Ks=K_gen'*S_gen/Sbase;
Tg=12;
Tj=Tj_gen'*S_gen/Sbase;

F=tf(1,[Tj,Ds]);
G=tf([Ks],[Tg,1]);
sys=F/(1+F*G);

% 计算单位阶跃响应
[response, t] = step(sys);
response=fbase*(1-derta_pload*response);  % 100MW负荷带来的频率变化
t0=(1:t_break)';
f0=50*ones(t_break,1);
tout=[t0;t+t_break];
fout=[f0;response];
end
