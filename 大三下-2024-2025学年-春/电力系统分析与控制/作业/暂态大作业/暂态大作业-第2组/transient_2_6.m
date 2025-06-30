clear;
load("load3996.mat");
mpc = loadcase('case39_FCUC');
% 节点类型
bus = mpc.bus(:,1);
gen = mpc.gen(:,1);
gen_index = [1;2;3;4;5;6;7;8;9;10];
bus_index_noGen = find(mpc.bus(:,2) == 1);%节点类型为1的节点无发电机
bus_index_hasGen = [30;31;32;33;34;35;36;37;38;39];%有一个发电机的节点

% 线性化段的数量/样本点个数
line_num = 4;
assess_num = 10;
%线性化的评估点KG，FR，Tj,一共10个点
KG_ass = [15,16,22,21,20,28,23,17,18,21;];
FR_ass = [0.25,0.35,0.3,0.25,0.3,0.35,0.32,0.31,0.25,0.3;]; 
Tj_ass = [15,14,13,13,15,15,10,9,9,15;];

%% 提取动态部分数据
frequency_0 = 50;%稳定频率50Hz
gen_number = mpc.bus(:,1);%发电机编号
Tj_gen = [15;14;13;13;15;15;10;9;9;15;];%设置
S_gen = mpc.gen(:,9);%发电机机组容量
S_sys = sum(S_gen);%系统容量基值
D_gen = [2.7;2.9;2.1;2.5;2.7;2.6;2.4;2.8;2.2;2.6;];%发电机阻尼常数
TG_sys = 12;%一次调频参数都设置为12
KG_gen = [15;16;22;21;20;28;23;17;18;21;];%发电机一次调频参数
FR_gen = [0.3;0.3;0.3;0.3;0.3;0.3;0.3;0.3;0.3;0.3;];%再热器系数
TR_gen = 12;%再热器时间常数
delta_PL = 500/S_sys;

[a, b, c, d] = transient_2_4();

% 1. 定义网格和函数
%x-KG y-Tj

[x, y] = meshgrid(9:1:22, 5:1:20); % 生成网格点

%固定FR = 0.3
surf_1 = a(1)*x + b(1)*0.3 + c(1)*y + d(1);
surf_2 = a(2)*x + b(2)*0.3 + c(2)*y + d(2);
surf_3 = a(3)*x + b(3)*0.3 + c(3)*y + d(3);
surf_4 = a(4)*x + b(4)*0.3 + c(4)*y + d(4);

omiga_n = sqrt((x + D_gen(1,1)) ./ y / TR_gen);
ksai = (y + TR_gen * (D_gen(1,1) + 0.3)) ./ (2 * sqrt((x + D_gen(1,1)) .* y * TR_gen));
omiga_d = omiga_n .* sqrt(1 - ksai .^ 2);
t_m = 1 ./ omiga_d .* atan(omiga_d ./ (ksai .* omiga_n - 1/TR_gen));
f_nadir = -delta_PL ./ (x + D_gen(1,1)) .* (1 + sqrt(x * TR_gen ./ y) .* exp(-ksai .* omiga_n .* t_m));



% 2. 在同一图中叠加比较（透明化处理）
figure;
surf(x, y, surf_1,  'FaceColor','b','FaceAlpha', 0.5);        % 半透明
hold on;
surf(x, y, surf_2,  'FaceColor','b','FaceAlpha', 0.5);        % 半透明
hold on;
% surf(x, y, surf_3, 'FaceColor','b', 'FaceAlpha', 0.5);        % 半透明
% hold on;
% surf(x, y, surf_4,  'FaceColor','b','FaceAlpha', 0.5);        % 半透明
% hold on;
surf(x, y, f_nadir,  'FaceColor','r','FaceAlpha', 0.5);
title('Comparison of z_1 and z_2');
xlabel('KG'); ylabel('Tj'); zlabel('频率值');
legend('线性平面', '线性平面','真实曲面');
grid on;
hold off;
