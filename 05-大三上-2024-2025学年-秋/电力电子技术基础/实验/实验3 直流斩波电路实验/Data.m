%%(2)--------------------------------------------------------------------------------
% duty_cycle_actual = [20.19, 30.19, 40.19, 50.18, 60.19, 70.19]; % 实际占空比 (%)
% duty_cycle_theoretical = [20, 30, 40, 50, 60, 70]; % 理论占空比 (%)
% output_voltage_measured = [4.337, 6.888, 9.441, 11.991, 14.550, 17.106]; % 输出电压（实际测量值）
% output_voltage_theoretical = [5, 7.5, 10, 12.5, 15, 17.5]; % 输出电压（理论值）
% input_voltage = 25; % 输入电压（V）
% 
% % 计算变压比
% voltage_ratio_measured = output_voltage_measured / input_voltage; % 实际变压比
% voltage_ratio_theoretical = output_voltage_theoretical / input_voltage; % 理论变压比
% 
% % 绘制图形
% figure;
% hold on;
% plot(duty_cycle_actual, voltage_ratio_measured, 'o-', 'DisplayName', '实际变压比');
% plot(duty_cycle_theoretical, voltage_ratio_theoretical, 'x-', 'DisplayName', '理论变压比');
% 
% % 添加图形标签
% xlabel('占空比 (%)');
% ylabel('变压比 (V_{out}/V_{in})');
% title('变压比与占空比的关系');
% legend('show');
% grid on;
% hold off;
% 
% % 数据
% switch_frequency = [5, 10, 20, 30, 40, 50]; % 开关频率 (kHz)
% duty_cycle_actual = [50.09, 50.19, 50.38, 50.54, 50.70, 51.00]; % 实际占空比 (%)
% output_voltage_measured = [11.953, 11.994, 12.083, 12.157, 12.244, 12.357]; % 输出电压（实际测量值）
% output_voltage_theoretical = [12.5, 12.5, 12.5, 12.5, 12.5, 12.5]; % 输出电压（理论值）
% input_voltage = 25; % 输入电压（V）
% 
% % 计算变压比
% voltage_ratio_measured = output_voltage_measured / input_voltage; % 实际变压比
% voltage_ratio_theoretical = output_voltage_theoretical / input_voltage; % 理论变压比
% 
% % 绘制图形
% figure;
% hold on;
% plot(switch_frequency, voltage_ratio_measured, 'o-', 'DisplayName', '实际变压比');
% plot(switch_frequency, voltage_ratio_theoretical, 'x-', 'DisplayName', '理论变压比');
% 
% % 添加图形标签
% xlabel('开关频率 (kHz)');
% ylabel('变压比 (V_{out}/V_{in})');
% title('变压比与开关频率的关系');
% legend('show');
% grid on;
% hold off;
%%--------------------------------------------------------------------------------

%%(5)--------------------------------------------------------------------------------
% 数据
duty_cycle_actual = [5.15, 10.15, 20.16, 30.18, 40.18]; % 实际占空比 (%)
duty_cycle_theoretical = [5, 10, 20, 30, 40]; % 理论占空比 (%)
output_voltage_measured = [25.500, 26.931, 30.325, 34.683, 40.470]; % 输出电压（实际测量值）
output_voltage_theoretical = [26.32, 27.78, 31.25, 35.71, 41.67]; % 输出电压（理论值）
input_voltage = 25; % 输入电压（V）

% 计算变压比
voltage_ratio_measured = output_voltage_measured / input_voltage; % 实际变压比
voltage_ratio_theoretical = output_voltage_theoretical / input_voltage; % 理论变压比

% 绘制图形
figure;
hold on;
plot(duty_cycle_actual, voltage_ratio_measured, 'o-', 'DisplayName', '实际变压比');
plot(duty_cycle_theoretical, voltage_ratio_theoretical, 'x-', 'DisplayName', '理论变压比');

% 添加图形标签
xlabel('占空比 (%)');
ylabel('变压比 (V_{out}/V_{in})');
title('变压比与占空比的关系');
legend('show');
grid on;
hold off;


% 数据
switch_frequency = [5, 10, 20, 30, 40, 50]; % 开关频率 (kHz)
duty_cycle_actual = [30.00, 30.16, 30.32, 30.50, 30.56, 30.0]; % 实际占空比 (%)
output_voltage_measured = [34.608, 34.684, 34.831, 34.983, 35.084, 35.259]; % 输出电压（实际测量值）
output_voltage_theoretical = [35.71, 35.71, 35.71, 35.71, 35.71, 35.71]; % 输出电压（理论值）
input_voltage = 25; % 输入电压（V）

% 计算变压比
voltage_ratio_measured = output_voltage_measured / input_voltage; % 实际变压比
voltage_ratio_theoretical = output_voltage_theoretical / input_voltage; % 理论变压比

% 绘制图形
figure;
hold on;
plot(switch_frequency, voltage_ratio_measured, 'o-', 'DisplayName', '实际变压比');
plot(switch_frequency, voltage_ratio_theoretical, 'x-', 'DisplayName', '理论变压比');

% 添加图形标签
xlabel('开关频率 (kHz)');
ylabel('变压比 (V_{out}/V_{in})');
title('变压比与开关频率的关系');
legend('show');
grid on;
hold off;
%%--------------------------------------------------------------------------------
