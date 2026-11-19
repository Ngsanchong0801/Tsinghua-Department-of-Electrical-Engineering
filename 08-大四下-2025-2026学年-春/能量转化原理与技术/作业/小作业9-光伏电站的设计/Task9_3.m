clc; clear; close all;

%% 第（3）问：不同储能容量下的日均成本计算

%% 光伏电池参数，选用第（1）问的 N 型硅片
G0 = 1000;             % 参考光照强度 W/m^2
UT = 26e-3;            % 温度电压 V
Iph0 = 9.20;           % N型硅片参考光生电流 A
Is = 3.71e-12;         % N型硅片反向饱和电流 A

%% 前两问得到的硅片数量
N_cell = 1084443;

%% 当地典型日光照强度数据
time = 1:24;
G = [0 0 0 0 0 0 ...
     29 206 405 590 733 819 ...
     839 793 681 520 326 131 ...
     10 0 0 0 0 0];      % W/m^2

%% 负荷参数
P_load = 500;            % kW，0.5 MW
dt = 1;                  % 时间间隔 h

%% 储能参数
eta_c = 0.95;            % 充电效率
eta_d = 0.95;            % 放电效率
price_grid = 0.7;        % 外购电价 元/kWh
storage_price = 1200;    % 储能单位造价 元/kWh
life_year = 10;          % 储能寿命 年

capacity_MWh = 1:10;     % 储能容量 MWh
capacity_kWh = capacity_MWh * 1000;

%% 计算每个小时的光伏最大可用功率
P_PV = zeros(1, 24);     % kW

for t = 1:24
    
    if G(t) == 0
        P_PV(t) = 0;
    else
        % 当前光照下的光生电流
        Iph = (G(t) / G0) * Iph0;
        
        % 开路电压
        Voc = UT * log(Iph / Is + 1);
        
        % 扫描电压
        U = linspace(0, Voc, 3000);
        
        % 电流
        I = Iph - Is .* (exp(U ./ UT) - 1);
        
        % 功率
        P = U .* I;
        
        % 单片硅片最大功率，单位 W
        Pmax_cell = max(P);
        
        % 整个光伏电站最大可用功率，单位 kW
        P_PV(t) = Pmax_cell * N_cell / 1000;
    end
end

%% 初始化结果变量
daily_cost = zeros(size(capacity_kWh));
grid_energy = zeros(size(capacity_kWh));
curtail_energy = zeros(size(capacity_kWh));
capex_daily = zeros(size(capacity_kWh));

%% 对不同储能容量进行仿真
for i = 1:length(capacity_kWh)
    
    E_bat_max = capacity_kWh(i);       % 储能容量 kWh
    E_soc = 0.5 * E_bat_max;           % 初始电量为最大容量的一半
    
    P_bat_max = 0.5 * E_bat_max;       % 0.5C 最大充放电功率 kW
    
    E_grid = 0;                        % 当日外购电量 kWh
    E_curtail = 0;                     % 当日弃光电量 kWh
    
    for t = 1:24
        
        % 情况1：光伏功率小于负荷，需要电池或外购电补足
        if P_PV(t) < P_load
            
            P_def = P_load - P_PV(t);  % 缺额功率 kW
            
            % 电池能够向负荷侧提供的最大放电功率
            P_dis = min([P_def, P_bat_max, E_soc * eta_d / dt]);
            
            % 电池储能量减少
            E_soc = E_soc - P_dis * dt / eta_d;
            
            % 剩余缺额由外购电补足
            P_grid = P_def - P_dis;
            E_grid = E_grid + P_grid * dt;
            
        % 情况2：光伏功率大于等于负荷，多余功率给电池充电
        else
            
            P_sur = P_PV(t) - P_load;  % 剩余光伏功率 kW
            
            % 电池最大可吸收的充电功率
            P_ch = min([P_sur, P_bat_max, (E_bat_max - E_soc) / eta_c / dt]);
            
            % 电池储能量增加
            E_soc = E_soc + P_ch * eta_c * dt;
            
            % 剩余无法利用的光伏电量为弃光
            P_curtail = P_sur - P_ch;
            E_curtail = E_curtail + P_curtail * dt;
        end
        
        % 避免数值误差导致 SOC 越界
        E_soc = max(0, min(E_soc, E_bat_max));
    end
    
    % 计算购电成本
    C_grid = E_grid * price_grid;
    
    % 储能日均折算成本
    C_capex = storage_price * E_bat_max / (life_year * 365);
    
    % 日均总成本
    daily_cost(i) = C_grid + C_capex;
    
    % 保存结果
    grid_energy(i) = E_grid;
    curtail_energy(i) = E_curtail;
    capex_daily(i) = C_capex;
end

%% 找出最优储能容量
[min_cost, idx_min] = min(daily_cost);
best_capacity = capacity_MWh(idx_min);

%% 输出光伏出力
fprintf('========== 每小时光伏最大可用功率 ==========\n');
for t = 1:24
    fprintf('%2d h: G = %6.1f W/m^2, P_PV = %8.2f kW\n', ...
        time(t), G(t), P_PV(t));
end

%% 输出不同储能容量下的成本结果
fprintf('\n========== 不同储能容量下的日均成本 ==========\n');
fprintf('容量/MWh\t购电量/kWh\t弃光量/kWh\t储能日均成本/元\t日均总成本/元\n');

for i = 1:length(capacity_MWh)
    fprintf('%4.0f\t\t%10.2f\t%10.2f\t%14.2f\t%14.2f\n', ...
        capacity_MWh(i), grid_energy(i), curtail_energy(i), ...
        capex_daily(i), daily_cost(i));
end

fprintf('\n========== 最优结果 ==========\n');
fprintf('最优储能容量 = %.0f MWh\n', best_capacity);
fprintf('最小日均成本 = %.2f 元/日\n', min_cost);

%% 绘制 日均成本-储能容量 曲线
figure;
plot(capacity_MWh, daily_cost, '-o', 'LineWidth', 1.8, 'MarkerSize', 7);
grid on;
xlabel('储能容量 / MWh');
ylabel('日均成本 / 元');
title('日均成本-储能容量曲线');

hold on;
plot(best_capacity, min_cost, 's', 'MarkerSize', 10, 'LineWidth', 2);
legend('日均成本', '最优储能容量', 'Location', 'best');

%% 绘制光伏出力曲线
figure;
plot(time, P_PV, '-o', 'LineWidth', 1.8);
grid on;
xlabel('时间 / h');
ylabel('光伏最大可用功率 / kW');
title('典型日光伏最大可用功率曲线');