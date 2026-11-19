%%改进后的PQ分解法
%极坐标系
clc;clear;

tic;%开始计时
iter = 0;%迭代次数
iter_max = 20;%迭代最大次数

mpc = case33bw;
mpc.bus(33,3) = 4.141;

[bus, gen, baseMVA] = deal(mpc.bus,mpc.gen,mpc.baseMVA);

Y = makeYbus(mpc);%导纳矩阵
mpc.branch(:,3) = 0;
Y0 = makeYbus(mpc);%消去支路r的导纳矩阵

order1 = transpose(find(bus(:,2)==1));%PQ节点的实际位置
order2 = transpose(find(bus(:,2)==2));
order3 = transpose(find(bus(:,2)==3));
order = [order1,order2,order3];
n = size(Y,1);
r = size(order2,2);
real_order(order) = (1:n);

Y1 = Y(order,order);%变换后的Y矩阵
Y2 = Y0(order,order);
G = real(Y1);%导纳实部
B = imag(Y1);%导纳虚部
B0 = imag(Y2);
Um_origin = bus(:,8);
Um = Um_origin(order);%各节点电压幅值
Ua_origin = bus(:,9)*(pi/180);
Ua = Ua_origin(order);%各节点电压相角

Sd = bus(:,3)+1i*bus(:,4);%负荷复功率
Sd(gen(:,1)) = Sd(gen(:,1))-(gen(:,2)+1i*gen(:,3));
S_origin = -Sd/baseMVA;
Psp = real(S_origin(order));%参考P
Qsp = imag(S_origin(order));

delta_P = zeros(n-1,1);
delta_Q = zeros(n-r-1,1);
B1 = B(1:n-1,1:n-1);
B2 = B0(1:n-r-1,1:n-r-1);

%delta_P&delta_Q
for i = 1:n-1
    P_temp = Um.*(G(i,:)'.*cos(Ua(i)-Ua) + B(i,:)'.*sin(Ua(i)-Ua));
    delta_P(i) = Psp(i) - Um(i)*sum(P_temp);
    if i < n-r
        Q_temp = Um.*(G(i,:)'.*sin(Ua(i)-Ua) - B(i,:)'.*cos(Ua(i)-Ua));
        delta_Q(i) = Qsp(i) - Um(i)*sum(Q_temp);
    end
end
delta = [delta_P;delta_Q];%功率方程

inv_B1 = B1\eye(n-1);
inv_B2 = B2\eye(n-r-1);
% fprintf('未迭代误差:%.4e\n',max(abs(delta)));
error = zeros(iter_max,1);
error0 = max(abs(delta));
while iter<iter_max
    iter = iter+1; 
%电压相角修正
    error_Ua = inv_B1*(delta_P./Um(1:n-1));
    Ua = Ua - [error_Ua;0].*Um;
%delta_Q
    for i = 1:n-r-1
        Q_temp = Um.*(G(i,:)'.*sin(Ua(i)-Ua) - B(i,:)'.*cos(Ua(i)-Ua));
        delta_Q(i) = Qsp(i) - Um(i)*sum(Q_temp);
    end
%电压幅值修正
    error_Um = inv_B2*(delta_Q./Um(1:n-r-1));
    Um = Um - [error_Um;zeros(r+1,1)];
%delta_P&delta_Q
    for i = 1:n-1
        P_temp = Um.*(G(i,:)'.*cos(Ua(i)-Ua) + B(i,:)'.*sin(Ua(i)-Ua));
        delta_P(i) = Psp(i) - Um(i)*sum(P_temp);
        if i < n-r
            Q_temp = Um.*(G(i,:)'.*sin(Ua(i)-Ua) - B(i,:)'.*cos(Ua(i)-Ua));
            delta_Q(i) = Qsp(i) - Um(i)*sum(Q_temp);
        end
    end
%功率方程
    delta = [delta_P;delta_Q];
    error(iter) = max(abs(delta));
end
error1 = error(iter);
et = toc;

figure(1);
plot(0:iter, [error0; error]);
title('Error vs Iteration Count');
xlabel('Iteration Count');
ylabel('Error');
disp(['Final Error: ', num2str(error1)]);

% 输出每个节点的电压幅值和相角
fprintf('最终每个节点的电压幅值和相角：\n');
fprintf('节点编号\t电压幅值 (p.u.)\t电压相角 (度)\n');
for i = 1:n
    fprintf('%d\t\t%.4f\t\t\t%.4f\n', i, Um(i), Ua(i) * 180 / pi);
end
fprintf('\n迭代耗时：%.4f 秒\n', et);

figure;

% 绘制电压幅值
subplot(2, 1, 1);
plot(1:n, Um);
title('Voltage Magnitude (p.u.)');
xlabel('Bus Index');
ylabel('Voltage Magnitude (p.u.)');
grid on;

% 绘制电压相角
subplot(2, 1, 2); 
plot(1:n, Ua * 180 / pi); 
title('Voltage Angle (degree)');
xlabel('Bus Index');
ylabel('Voltage Angle (degree)');
grid on;


