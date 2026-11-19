clear; clc; close all;
syms x

% 定义每一段函数
f1 = 2.3 + 9*x;         
f2 = 3.19 + 0.1*x;    
f3 = -5.265 + 9*x;

% 分别积分
I1 = int(f1, x, 0.8/9, 0.1);  
I2 = int(f2, x, 0.1, 0.95);  
I3 = int(f3, x, 0.95, 8.665/9);  % 注意这里第三段用的是 f3

% 分别积分
I4 = int(f1, x, 0, 0.1);  
I5 = int(f2, x, 0.1, 0.95);  
I6 = int(f3, x, 0.95, 1);  % 注意这里第三段用的是 f3

% 总积分
real_integral = I1 + I2 + I3;
total_integral =I4+I5+I6; 
% 显示为浮点数
mass_density = double(real_integral/total_integral * 250);
volume_density = double(real_integral/total_integral* 700);

disp('质量密度（小数）：');
disp(mass_density);

disp('体积密度（小数）：');
disp(volume_density);

A = [220.94-250/9   20-250/9;
    220.94-385.8  2400-385.8];
b = [125000/3;
    578703.7];
x = A\b;
disp(x);