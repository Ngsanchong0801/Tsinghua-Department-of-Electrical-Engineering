data = readtable('Signal_basetask_15.csv');
A=data(:,2);
V_val=table2array(A);
[result1,result2,result3,result4]=karman1(V_val,0.0001); 
% disp(result1);
% disp(result2);
% disp(result3);
% disp(result4);
% amp=zeros(1,10000);
amp=zeros(1,10000);
fai=zeros(1,10000);
for i=1:10000
% for i=1:9600
    amp(i)=(sqrt(result3(i)*result3(i)+result4(i)*result4(i)))/1.414;
    Amp=sqrt(result3(i)*result3(i)+result4(i)*result4(i));
    A_fai=result4(i)*cos(result2(i)*(i-1)*0.0001)-result3(i)*sin(result2(i)*(i-1)*0.0001);
    fai(i)=asin(A_fai/Amp)+result2(i)*(i-1)*0.0001-2*3.1415926*50*(i-1)*0.0001;
    % fai(i)=result2(i)*(i-1)*0.0001-2*3.1415926*50*(i-1)*0.0001;
end
x=0:9999;
% final_result=[0.0001*x',amp',fai'];
% col={'时间/s' '相量幅值/V', '相量相角/rad'};
% %生成表格，按列生成
% result_table=table(final_result(:,1),final_result(:,2),final_result(:,3),'VariableNames',col);
% writetable(result_table, 'result.csv');
% x=1:9600;
% plot(x,amp)
plot(x,fai)
% plot(x,result3);
% plot(x, result1+result3, 'r--', 'LineWidth', 2)
% hold on
% plot(x, V_val, 'b:', 'LineWidth', 2)
% plot(x,V_val)
function [x1,x2,x3,x4] = karman1(V_val,T_s)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
    point_num=10000;
    % point_num=9600;
    x1=zeros(1,point_num);   %直流分量
    x2=zeros(1,point_num);   %角频率
    x2(1)=100*(3.1415926);
    x3=zeros(1,point_num);   %实分量
    x3(1)=10;
    x4=zeros(1,point_num);   %虚分量
    x4(1)=10;
    e=zeros(1,point_num);    %误差
    V=zeros(1,point_num);
    H=[1,0,1,0];
    R=1;
    Q = 10^(-4)*eye(4);
    P=100*eye(4);
    for k=2:(point_num)
        x1_yuce=x1(k-1);
        x2_yuce=x2(k-1);
        x3_yuce=x3(k-1)*cos(x2_yuce*T_s)-x4(k-1)*sin(x2_yuce*T_s);
        x4_yuce=x3(k-1)*sin(x2_yuce*T_s)+x4(k-1)*cos(x2_yuce*T_s);
        e(k)=V_val(k)-H*([x1_yuce,x2_yuce,x3_yuce,x4_yuce]'-1);
        F=[1,0,0,0;
           0,1,0,0;
           0,-x3(k-1)*T_s*sin(x2_yuce*T_s)-x4(k-1)*T_s*cos(x2_yuce*T_s),cos(x2_yuce*T_s),-sin(x2_yuce*T_s);
           0,x3(k-1)*T_s*cos(x2_yuce*T_s)-x4(k-1)*T_s*sin(x2_yuce*T_s),sin(x2_yuce*T_s),cos(x2_yuce*T_s)];
        if k==1
            V(k)=e(1)*e(1);
        else
            V(k)=(0.95*V(k-1)*e(k)*e(k))/1.95;
        end 
        N=V(k)-H*Q*H'-3;
        M=H*F*P*F'*H';
        lamda_0=(trace(N))/(trace(M));
        if lamda_0>1
            lamda=lamda_0;
        else
            lamda=1;
        end
        P_1=lamda*F*P*F'+Q;
        K=P_1*H'*((H*P_1*H'+R)^(-1));
        x_k=[x1_yuce,x2_yuce,x3_yuce,x4_yuce]'+K*e(k);
        x1(k)=x_k(1);
        x2(k)=x_k(2);
        x3(k)=x_k(3);
        x4(k)=x_k(4);
        P=(eye(4)-K*H)*P_1;
    end
end