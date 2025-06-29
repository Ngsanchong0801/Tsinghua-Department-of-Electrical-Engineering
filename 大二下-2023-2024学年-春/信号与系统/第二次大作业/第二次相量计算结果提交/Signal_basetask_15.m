% 读取数据
data = readtable('Signal_basetask_15.csv');
A = data(:,2);
V_val = table2array(A);

% 使用卡尔曼滤波器计算基波相量
[result1, result2, result3, result4] = karman1(V_val, 0.0001);

% 初始化变量
amp = zeros(1, 10000);
fai = zeros(1, 10000);

for i = 1:10000
    amp(i) = (sqrt(result3(i) * result3(i) + result4(i) * result4(i))) / 1.414;
    Amp = sqrt(result3(i) * result3(i) + result4(i) * result4(i));
    A_fai = result4(i) * cos(result2(i) * (i-1) * 0.0001) - result3(i) * sin(result2(i) * (i-1) * 0.0001);
    fai(i) = asin(A_fai / Amp) + result2(i) * (i-1) * 0.0001 - 2 * pi * 50 * (i-1) * 0.0001;
end

% 绘制幅值和相角随时间变化曲线
x = 0:9999;

figure;
subplot(2,1,1);
plot(x, amp);
title('基波幅值随时间变化');
xlabel('时间 (s)');
ylabel('幅值 (V)');

subplot(2,1,2);
plot(x, fai);
title('基波相角随时间变化');
xlabel('时间 (s)');
ylabel('相角 (rad)');

% 卡尔曼滤波函数
function [x1, x2, x3, x4] = karman1(V_val, T_s)
    point_num = 10000;
    x1 = zeros(1, point_num);   % 直流分量
    x2 = zeros(1, point_num);   % 角频率
    x2(1) = 100 * pi;
    x3 = zeros(1, point_num);   % 实分量
    x3(1) = 10;
    x4 = zeros(1, point_num);   % 虚分量
    x4(1) = 10;
    e = zeros(1, point_num);    % 误差
    V = zeros(1, point_num);
    H = [1, 0, 1, 0];
    R = 1;
    Q = 10^(-4) * eye(4);
    P = 100 * eye(4);
    for k = 2:point_num
        x1_yuce = x1(k-1);
        x2_yuce = x2(k-1);
        x3_yuce = x3(k-1) * cos(x2_yuce * T_s) - x4(k-1) * sin(x2_yuce * T_s);
        x4_yuce = x3(k-1) * sin(x2_yuce * T_s) + x4(k-1) * cos(x2_yuce * T_s);
        e(k) = V_val(k) - H * ([x1_yuce, x2_yuce, x3_yuce, x4_yuce]' - 1);
        F = [1, 0, 0, 0;
             0, 1, 0, 0;
             0, -x3(k-1) * T_s * sin(x2_yuce * T_s) - x4(k-1) * T_s * cos(x2_yuce * T_s), cos(x2_yuce * T_s), -sin(x2_yuce * T_s);
             0, x3(k-1) * T_s * cos(x2_yuce * T_s) - x4(k-1) * T_s * sin(x2_yuce * T_s), sin(x2_yuce * T_s), cos(x2_yuce * T_s)];
        if k == 1
            V(k) = e(1) * e(1);
        else
            V(k) = (0.95 * V(k-1) * e(k) * e(k)) / 1.95;
        end
        N = V(k) - H * Q * H' - 3;
        M = H * F * P * F' * H';
        lamda_0 = (trace(N)) / (trace(M));
        lamda = max(lamda_0, 1);
        P_1 = lamda * F * P * F' + Q;
        K = P_1 * H' / (H * P_1 * H' + R);
        x_k = [x1_yuce, x2_yuce, x3_yuce, x4_yuce]' + K * e(k);
        x1(k) = x_k(1);
        x2(k) = x_k(2);
        x3(k) = x_k(3);
        x4(k) = x_k(4);
        P = (eye(4) - K * H) * P_1;
    end
end
