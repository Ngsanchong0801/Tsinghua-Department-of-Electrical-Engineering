clc; clear;

%% 基本参数
r = 0.08;  % 年利率

CRF10 = r * (1+r)^10 / ((1+r)^10 - 1);
CRF20 = r * (1+r)^20 / ((1+r)^20 - 1);

%% 1. 光伏系统：5 MW
PV_power_kW = 5 * 1000;
PV_unit_cost = 4500; % 元/kW
PV_CAPEX_wanyuan = PV_power_kW * PV_unit_cost / 10000;
PV_annual_cap = PV_CAPEX_wanyuan * CRF20;
PV_opex = PV_CAPEX_wanyuan * 0.015;

%% 2. 锂电池系统：4 MW / 16 MWh
Bat_power_kW = 4 * 1000;
Bat_energy_kWh = 16 * 1000;

Bat_power_cost = 800;    % 元/kW
Bat_energy_cost = 1200;  % 元/kWh

Bat_CAPEX_wanyuan = ...
    (Bat_power_kW * Bat_power_cost + Bat_energy_kWh * Bat_energy_cost) / 10000;

Bat_annual_cap = Bat_CAPEX_wanyuan * CRF10;
Bat_opex = Bat_CAPEX_wanyuan * 0.02;

%% 3. 氢系统：3 MW 电解槽 + 500 kg 储氢 + 2 MW 燃料电池
Ele_power_kW = 3 * 1000;
Tank_kg = 500;
FC_power_kW = 2 * 1000;

Ele_CAPEX = Ele_power_kW * 2500 / 10000;
Tank_CAPEX = Tank_kg * 3000 / 10000;
FC_CAPEX = FC_power_kW * 6000 / 10000;

H2_CAPEX_wanyuan = Ele_CAPEX + Tank_CAPEX + FC_CAPEX;

H2_annual_cap = Ele_CAPEX * CRF10 + Tank_CAPEX * CRF20 + FC_CAPEX * CRF10;
H2_opex = H2_CAPEX_wanyuan * 0.04;

%% 汇总
Total_CAPEX = PV_CAPEX_wanyuan + Bat_CAPEX_wanyuan + H2_CAPEX_wanyuan;
Total_annual_cap = PV_annual_cap + Bat_annual_cap + H2_annual_cap;
Total_opex = PV_opex + Bat_opex + H2_opex;

Total_fixed_cost = Total_annual_cap + Total_opex; % 万元/年

Annual_energy_kWh = 6000 * 1000; % 6000 MWh
Unit_fixed_cost = Total_fixed_cost * 10000 / Annual_energy_kWh; % 元/kWh

%% 输出结果
fprintf('CRF10 = %.5f\n', CRF10);
fprintf('CRF20 = %.5f\n\n', CRF20);

fprintf('5 MW 光伏系统：\n');
fprintf('总投资 = %.2f 万元\n', PV_CAPEX_wanyuan);
fprintf('年化投资成本 = %.2f 万元/年\n', PV_annual_cap);
fprintf('年运维成本 = %.2f 万元/年\n\n', PV_opex);

fprintf('4 MW / 16 MWh 锂电池系统：\n');
fprintf('总投资 = %.2f 万元\n', Bat_CAPEX_wanyuan);
fprintf('年化投资成本 = %.2f 万元/年\n', Bat_annual_cap);
fprintf('年运维成本 = %.2f 万元/年\n\n', Bat_opex);

fprintf('3 MW 电解槽 + 500 kg 储氢 + 2 MW 燃料电池系统：\n');
fprintf('总投资 = %.2f 万元\n', H2_CAPEX_wanyuan);
fprintf('年化投资成本 = %.2f 万元/年\n', H2_annual_cap);
fprintf('年运维成本 = %.2f 万元/年\n\n', H2_opex);

fprintf('三个系统合计：\n');
fprintf('总投资 = %.2f 万元\n', Total_CAPEX);
fprintf('年化投资成本 = %.2f 万元/年\n', Total_annual_cap);
fprintf('年运维成本 = %.2f 万元/年\n', Total_opex);
fprintf('年固定成本 = %.2f 万元/年\n', Total_fixed_cost);
fprintf('单位固定供能成本 = %.3f 元/kWh\n', Unit_fixed_cost);