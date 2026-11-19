clc; clear; close all;

%% =========================================================
%  子任务3：优化后配置的典型日运行校核
%  绘制：
%  1) 功率平衡图
%  2) 电池SOC曲线
%  3) 储氢量变化图
%  4) 电网购电功率曲线
%  5) 冷负荷供应曲线
%  6) 光伏利用情况
%
%  优化后配置：
%  20%: 8 MWp PV + 6 MW / 16 MWh Battery
%  40%: 15 MWp PV + 8 MW / 24 MWh Battery + 300 kg H2 + 250 kg/d H2 + 1 MW FC
%  60%: 15 MWp PV + 8 MW / 32 MWh Battery + 2 MW Electrolyzer + 3000 kg H2 + 2850 kg/d H2 + 4 MW FC
%  80%: 15 MWp PV + 10 MW / 40 MWh Battery + 4 MW Electrolyzer + 6000 kg H2 + 5500 kg/d H2 + 6 MW FC
%
%  说明：
%  - 外购绿氢直接计入初始储氢量
%  - 60%与80%方案加入电解槽，用中午富余光伏制氢
%  - 本方案不配置氢燃机，因此冷负荷全部由电制冷承担，余热制冷为0
%  - 已修正 SOC 更新逻辑和 stairs 绘图长度问题
%% =========================================================

%% 1. 时间设置
dt = 1;                  % 时间步长 1 h
t = 0:23;                % 小时点，24个点
t2 = 0:24;               % SOC / 储氢 / 阶梯图使用，25个点

%% 2. 负荷数据
% IT负荷
P_IT = zeros(1,24);
P_IT(1:6)   = 7.2;       % 00:00-06:00
P_IT(7:12)  = 7.6;       % 06:00-12:00
P_IT(13:18) = 8.0;       % 12:00-18:00
P_IT(19:22) = 7.8;       % 18:00-22:00
P_IT(23:24) = 7.4;       % 22:00-24:00

% 总电负荷，包含电制冷耗电
P_load = zeros(1,24);
P_load(1:6)   = 9.0;
P_load(7:12)  = 9.5;
P_load(13:18) = 10.0;
P_load(19:22) = 9.75;
P_load(23:24) = 9.25;

%% 3. 冷负荷
% 制冷电负荷按 IT 负荷的25%计，电制冷COP=4
% 因此冷负荷冷量约等于 IT 负荷
Q_cool_demand   = P_IT;             % MW_cooling
Q_cool_electric = Q_cool_demand;    % 本方案全部由电制冷提供
Q_cool_waste    = zeros(1,24);      % 无氢燃机，因此余热制冷为0

%% 4. 光伏出力系数
pv_coef = zeros(1,24);
pv_coef(7:8)   = 0.15;   % 06:00-08:00
pv_coef(9:10)  = 0.45;   % 08:00-10:00
pv_coef(11:14) = 0.80;   % 10:00-14:00
pv_coef(15:16) = 0.55;   % 14:00-16:00
pv_coef(17:18) = 0.20;   % 16:00-18:00

%% 5. 分时电价
price = zeros(1,24);
price(1:8)   = 0.55;   % 00:00-08:00
price(9:12)  = 0.85;   % 08:00-12:00
price(13:18) = 1.00;   % 12:00-18:00
price(19:22) = 1.20;   % 18:00-22:00
price(23:24) = 0.65;   % 22:00-24:00

P_grid_max = 10;       % 最大允许购电功率 MW

%% 6. 优化后设备配置
case_name = {'20%', '40%', '60%', '80%'};

PV_cap      = [8, 15, 15, 15];       % MWp
Batt_P      = [6, 8, 8, 10];         % MW
Batt_E      = [16, 24, 32, 40];      % MWh

% 优化后：60%加入2 MW电解槽，80%保留4 MW电解槽
Elec_cap    = [0, 0, 2, 4];          % MW

H2_tank_cap = [0, 300, 3000, 6000];  % kg

% 优化后：60%外购绿氢调整为2850 kg/d，80%调整为5500 kg/d
H2_buy      = [0, 250, 2850, 5500];  % kg/d，直接计入初始储氢

FC_cap      = [0, 1, 4, 6];          % MW
HE_cap      = [0, 0, 0, 0];          % MW，本方案不配置氢燃机

%% 7. 其他参数
SOC_min  = 0.10;
SOC_max  = 0.90;
SOC_init = 0.90;       % 初始SOC取90%

H2_LHV = 33.3;         % kWh/kg-H2
FC_eff = 0.50;         % 燃料电池发电效率

%% =========================================================
%  逐场景计算并画图
%% =========================================================
for c = 1:length(case_name)

    %% 当前场景参数
    pvCap    = PV_cap(c);
    battP    = Batt_P(c);
    battE    = Batt_E(c);
    elecCap  = Elec_cap(c);
    h2Cap    = H2_tank_cap(c);
    h2Init   = H2_buy(c);
    fcCap    = FC_cap(c);

    %% 光伏出力
    P_pv = pvCap .* pv_coef;

    %% 初始化变量
    P_pv2load = zeros(1,24);     % 光伏直供负荷
    P_pv2batt = zeros(1,24);     % 光伏给电池充电
    P_pv2elec = zeros(1,24);     % 光伏给电解槽制氢
    P_fc      = zeros(1,24);     % 燃料电池出力
    P_bdis    = zeros(1,24);     % 电池放电
    P_grid    = zeros(1,24);     % 电网购电
    P_curt    = zeros(1,24);     % 弃光

    H2_prod   = zeros(1,24);     % 电解槽产氢量 kg/h
    H2_cons   = zeros(1,24);     % 燃料电池耗氢量 kg/h

    E_batt = zeros(1,25);        % 电池能量 MWh
    SOC    = zeros(1,25);        % SOC
    H2     = zeros(1,25);        % 储氢量 kg

    E_batt(1) = battE * SOC_init;
    SOC(1)    = SOC_init;
    H2(1)     = min(h2Cap, h2Init);   % 外购绿氢算作初始储氢

    E_min = battE * SOC_min;
    E_max = battE * SOC_max;

    %% -----------------------------------------------------
    %  燃料电池预调度策略
    %  原则：
    %  1) 光伏优先直供
    %  2) 燃料电池优先分配到“电价高 + 光伏不足”的时段
    %  3) 不超过燃料电池功率、负荷缺口和初始可用氢气能量
    %
    %  注：
    %  这里先按初始外购绿氢进行预调度。
    %  当日由电解槽新产出的氢气主要视为提高储氢备用量，
    %  不强制在同一天全部回发。
    %% -----------------------------------------------------
    if fcCap > 0 && H2(1) > 0

        deficit_after_pv = max(P_load - P_pv, 0);  % 仅考虑PV后的缺口
        fc_energy_avail = H2(1) * H2_LHV * FC_eff / 1000; % MWh

        % 高电价优先；同电价下缺口越大越优先
        score = price * 100 + deficit_after_pv;
        [~, idx_sort] = sort(score, 'descend');

        for k = 1:length(idx_sort)
            h = idx_sort(k);

            if fc_energy_avail <= 1e-8
                break;
            end

            P_fc(h) = min([fcCap, deficit_after_pv(h), fc_energy_avail / dt]);
            fc_energy_avail = fc_energy_avail - P_fc(h) * dt;
        end
    end

    %% -----------------------------------------------------
    %  逐时功率平衡
    %% -----------------------------------------------------
    for h = 1:24

        %% ---------- 1) 光伏优先直供负荷 ----------
        P_pv2load(h) = min(P_pv(h), P_load(h));
        pv_surplus = max(P_pv(h) - P_pv2load(h), 0);

        %% ---------- 2) 光伏富余时优先给电池充电 ----------
        P_ch = 0;
        eta_ch = 1.0;

        if battE > 0 && pv_surplus > 0 && E_batt(h) < E_max

            P_ch_max = min(pv_surplus, battP);
            C_rate_ch = P_ch_max / battE;
            eta_ch = get_batt_eff(C_rate_ch);

            % 受电池容量上限限制的最大可充功率
            P_ch_cap_limit = max(0, (E_max - E_batt(h)) / (eta_ch * dt));

            P_ch = min(P_ch_max, P_ch_cap_limit);
            P_ch = max(P_ch, 0);

            P_pv2batt(h) = P_ch;
        end

        % 电池充电后剩余的富余光伏
        pv_surplus_after_batt = max(P_pv(h) - P_pv2load(h) - P_pv2batt(h), 0);

        %% ---------- 3) 剩余富余光伏进入电解槽制氢 ----------
        P_elec = 0;
        eta_elec = 0;

        if elecCap > 0 && pv_surplus_after_batt > 0 && H2(h) < h2Cap

            P_elec_candidate = min(pv_surplus_after_batt, elecCap);

            % 电解槽最小负荷率20%，低于20%额定功率则不运行
            if P_elec_candidate >= 0.20 * elecCap

                load_ratio_elec = P_elec_candidate / elecCap;
                eta_elec = get_electrolyzer_eff(load_ratio_elec);

                % 由储氢罐剩余容量反推本小时最大可用制氢功率
                h2_space = h2Cap - H2(h);  % kg
                P_elec_cap_limit = h2_space * H2_LHV / eta_elec / 1000 / dt; % MW

                P_elec = min(P_elec_candidate, P_elec_cap_limit);
                P_elec = max(P_elec, 0);

                P_pv2elec(h) = P_elec;

                % 产氢量：MW -> kWh，再乘电解效率，除以低位热值
                H2_prod(h) = P_elec * 1000 * dt * eta_elec / H2_LHV; % kg
            end
        end

        %% ---------- 4) 计算光伏和燃料电池后的负荷缺口 ----------
        deficit = P_load(h) - P_pv2load(h) - P_fc(h);
        deficit = max(deficit, 0);

        %% ---------- 5) 电池放电 ----------
        % 本方案中电池主要用于晚高峰削峰；
        % 非晚高峰不主动放电，以保留应急备用。
        P_dis = 0;
        eta_dis = 1.0;

        is_peak = (h >= 19 && h <= 22);  % 18:00-22:00 对应 h=19:22

        if deficit > 0 && battE > 0 && is_peak

            P_dis_power_limit = min(deficit, battP);
            C_rate_dis = P_dis_power_limit / battE;
            eta_dis = get_batt_eff(C_rate_dis);

            % 受SOC下限限制的最大可放功率
            % 若放电功率为P_dis，则电池内部减少 P_dis/eta_dis
            P_dis_energy_limit = max(0, (E_batt(h) + P_ch * eta_ch * dt - E_min) * eta_dis / dt);

            P_dis = min(P_dis_power_limit, P_dis_energy_limit);
            P_dis = max(P_dis, 0);

            P_bdis(h) = P_dis;
        end

        %% ---------- 6) 统一更新电池能量和SOC ----------
        E_temp = E_batt(h) + P_ch * eta_ch * dt - P_dis / eta_dis * dt;

        % SOC上下限约束
        E_batt(h+1) = min(max(E_temp, E_min), E_max);
        SOC(h+1) = E_batt(h+1) / battE;

        %% ---------- 7) 电网兜底 ----------
        P_grid(h) = P_load(h) - P_pv2load(h) - P_fc(h) - P_bdis(h);
        P_grid(h) = max(P_grid(h), 0);

        %% ---------- 8) 弃光 ----------
        P_curt(h) = max(P_pv(h) - P_pv2load(h) - P_pv2batt(h) - P_pv2elec(h), 0);

        %% ---------- 9) 储氢量变化 ----------
        if fcCap > 0
            H2_cons(h) = P_fc(h) * 1000 * dt / (H2_LHV * FC_eff);  % kg
        else
            H2_cons(h) = 0;
        end

        H2(h+1) = H2(h) + H2_prod(h) - H2_cons(h);
        H2(h+1) = min(max(H2(h+1), 0), h2Cap);

        %% ---------- 10) 电网购电功率约束检查 ----------
        if P_grid(h) > P_grid_max + 1e-6
            warning('%s 场景第 %d 小时电网购电功率 %.2f MW 超过 10 MW 上限。', ...
                case_name{c}, h-1, P_grid(h));
        end
    end

    %% -----------------------------------------------------
    %  日统计
    %% -----------------------------------------------------
    E_load = sum(P_load) * dt;
    E_grid = sum(P_grid) * dt;
    E_fc   = sum(P_fc) * dt;
    E_pv   = sum(P_pv) * dt;

    E_pv_to_load = sum(P_pv2load) * dt;
    E_pv_to_batt = sum(P_pv2batt) * dt;
    E_pv_to_elec = sum(P_pv2elec) * dt;
    E_batt_dis   = sum(P_bdis) * dt;
    E_curt        = sum(P_curt) * dt;

    H2_prod_day = sum(H2_prod);
    H2_cons_day = sum(H2_cons);

    % 两个指标：
    % 1) 实际对负荷供能绿电比例：光伏直供 + 电池放电 + 燃料电池
    %    注意：电池放电默认视为来自前期光伏充电或绿色储能。
    green_ratio_load = (E_pv_to_load + E_batt_dis + E_fc) / E_load;

    % 2) 绿色资源利用比例：光伏直供 + 光伏充电 + 光伏制氢 + 燃料电池
    green_resource_used = (E_pv_to_load + E_pv_to_batt + E_pv_to_elec + E_fc) / E_load;

    fprintf('\n=============================\n');
    fprintf('优化后情景：%s 绿电比例目标\n', case_name{c});
    fprintf('总负荷电量：%.2f MWh/d\n', E_load);
    fprintf('光伏发电量：%.2f MWh/d\n', E_pv);
    fprintf('光伏直供电量：%.2f MWh/d\n', E_pv_to_load);
    fprintf('光伏充电电量：%.2f MWh/d\n', E_pv_to_batt);
    fprintf('光伏制氢电量：%.2f MWh/d\n', E_pv_to_elec);
    fprintf('燃料电池发电量：%.2f MWh/d\n', E_fc);
    fprintf('电池放电量：%.2f MWh/d\n', E_batt_dis);
    fprintf('电网购电量：%.2f MWh/d\n', E_grid);
    fprintf('弃光电量：%.2f MWh/d\n', E_curt);
    fprintf('电解槽产氢量：%.2f kg/d\n', H2_prod_day);
    fprintf('燃料电池耗氢量：%.2f kg/d\n', H2_cons_day);
    fprintf('估算对负荷供能绿电比例：%.2f %%\n', green_ratio_load * 100);
    fprintf('估算绿色资源利用比例：%.2f %%\n', green_resource_used * 100);
    fprintf('初始储氢量：%.2f kg\n', H2(1));
    fprintf('末端储氢量：%.2f kg\n', H2(end));
    fprintf('末端SOC：%.2f %%\n', SOC(end)*100);

    %% -----------------------------------------------------
    %  为 stairs 图准备 25 点数据，避免长度不一致
    %% -----------------------------------------------------
    P_grid_plot = [P_grid, P_grid(end)];
    P_fc_plot   = [P_fc, P_fc(end)];
    P_bdis_plot = [P_bdis, P_bdis(end)];
    P_pv_plot   = [P_pv, P_pv(end)];
    P_curt_plot = [P_curt, P_curt(end)];

    %% =====================================================
    %  绘图
    %% =====================================================
    figure('Name', ['优化后典型日校核-', case_name{c}], ...
           'Position', [100 80 1350 850]);

    tiledlayout(3,2, 'Padding', 'compact', 'TileSpacing', 'compact');

    %% 图1：功率平衡图
    nexttile;
    supply_stack = [P_pv2load(:), P_fc(:), P_bdis(:), P_grid(:)];
    bar(t, supply_stack, 'stacked');
    hold on;
    plot(t, P_load, 'k-o', 'LineWidth', 1.5);
    xlabel('时间 / h');
    ylabel('功率 / MW');
    title(['功率平衡图 - ', case_name{c}]);
    legend('光伏直供', '燃料电池', '电池放电', '电网购电', '总负荷', ...
        'Location', 'best');
    grid on;
    xlim([0 23]);

    %% 图2：电池SOC曲线
    nexttile;
    stairs(t2, SOC*100, 'LineWidth', 1.8);
    hold on;
    yline(SOC_min*100, '--r', 'SOC下限');
    yline(SOC_max*100, '--b', 'SOC上限');
    xlabel('时间 / h');
    ylabel('SOC / %');
    title(['电池SOC曲线 - ', case_name{c}]);
    grid on;
    xlim([0 24]);
    ylim([0 100]);

    %% 图3：储氢量变化图
    nexttile;
    stairs(t2, H2, 'LineWidth', 1.8);
    xlabel('时间 / h');
    ylabel('储氢量 / kg');
    title(['储氢量变化图 - ', case_name{c}]);
    grid on;
    xlim([0 24]);

    %% 图4：电网购电功率曲线
    nexttile;
    stairs(t2, P_grid_plot, 'LineWidth', 1.8);
    hold on;
    yline(P_grid_max, '--r', '购电上限10 MW');
    xlabel('时间 / h');
    ylabel('购电功率 / MW');
    title(['电网购电功率曲线 - ', case_name{c}]);
    grid on;
    xlim([0 24]);

    %% 图5：冷负荷供应曲线
    nexttile;
    cool_stack = [Q_cool_electric(:), Q_cool_waste(:)];
    bar(t, cool_stack, 'stacked');
    hold on;
    plot(t, Q_cool_demand, 'k-o', 'LineWidth', 1.5);
    xlabel('时间 / h');
    ylabel('冷负荷 / MW_{cooling}');
    title(['冷负荷供应曲线 - ', case_name{c}]);
    legend('电制冷供冷', '余热制冷供冷', '冷负荷需求', ...
        'Location', 'best');
    grid on;
    xlim([0 23]);

    %% 图6：光伏利用情况
    nexttile;
    plot(t, P_pv, '-o', 'LineWidth', 1.5);
    hold on;
    plot(t, P_pv2load, '-s', 'LineWidth', 1.5);
    plot(t, P_pv2batt, '-^', 'LineWidth', 1.5);
    plot(t, P_pv2elec, '-d', 'LineWidth', 1.5);
    plot(t, P_curt, '-x', 'LineWidth', 1.5);
    xlabel('时间 / h');
    ylabel('功率 / MW');
    title(['光伏利用情况 - ', case_name{c}]);
    legend('光伏总出力', '光伏直供', '光伏充电', '光伏制氢', '弃光', ...
        'Location', 'best');
    grid on;
    xlim([0 23]);

end

%% =========================================================
%  局部函数1：根据充放电倍率取电池效率
%  附录2：
%    0~0.25C   94%
%    0.25~0.5C 90%
%    0.5~1.0C  84%
%% =========================================================
function eta = get_batt_eff(C_rate)

    if C_rate <= 0
        eta = 1.0;
    elseif C_rate <= 0.25
        eta = 0.94;
    elseif C_rate <= 0.5
        eta = 0.90;
    else
        eta = 0.84;
    end

end

%% =========================================================
%  局部函数2：根据相对负载率取电解槽效率
%  附录2：
%    0.2~0.3   78%
%    0.3~0.5   74%
%    0.5~0.7   71%
%    0.7~1.0   68%
%% =========================================================
function eta = get_electrolyzer_eff(load_ratio)

    if load_ratio < 0.2
        eta = 0.0;
    elseif load_ratio < 0.3
        eta = 0.78;
    elseif load_ratio < 0.5
        eta = 0.74;
    elseif load_ratio < 0.7
        eta = 0.71;
    else
        eta = 0.68;
    end

end