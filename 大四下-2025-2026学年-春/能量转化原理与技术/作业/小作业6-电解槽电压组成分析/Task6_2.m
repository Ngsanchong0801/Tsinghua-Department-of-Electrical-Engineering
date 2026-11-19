clear; clc; close all;

%% 1. 基础参数与数据
R_gas = 8.314; F = 96485; T = 358; z = 2;
Area = 0.234; % m^2
R_ohm = 0.343 / (Area * 10000); % Ohm

% 实验数据 (200A - 1000A)
I_exp = 200:100:1000;
V_exp = [1.518 1.562 1.601 1.637 1.669 1.699 1.726 1.753 1.779];
E_rev = 1.178 + R_gas * T / (z * F) * log(10 * 10^0.5);

j_exp = I_exp / (Area * 10000); % A/cm^2
V_ohm_exp = I_exp * R_ohm;

% 显示结果
disp('V_ohm：');
disp(V_ohm_exp);
