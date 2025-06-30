%% task2--------------------------------------------------------------
clear;
clc;
% 定义时间范围
t = linspace(0, 2, 10000); % 时间从 0 到 0.1 秒

% 定义电流公式
i_A = 8.37 .* (2.14 .* exp(-t / 0.039) + 5.983 .* exp(-t / 1.79) + 1.44) .* ...
      cos(314 .* t + 3.33) + 75 .* exp(-t / 0.517);
i_B = 8.37 .* (2.14 .* exp(-t / 0.039) + 5.983 .* exp(-t / 1.79) + 1.44) .* ...
      cos(314 .* t + 3.33 - 2 * pi / 3) - 28.4 .* exp(-t / 0.517);
i_C = 8.37 .* (2.14 .* exp(-t / 0.039) + 5.983 .* exp(-t / 1.79) + 1.44) .* ...
      cos(314 .* t + 3.33 + 2 * pi / 3) - 46.5 .* exp(-t / 0.517);

% 绘制波形
figure;
plot(t, i_A, 'DisplayName', 'i_A (kA)'); hold on;
plot(t, i_B, 'DisplayName', 'i_B (kA)');
plot(t, i_C, 'DisplayName', 'i_C (kA)');
xlabel('Time (s)');
ylabel('Current (kA)');
title('Current Waveforms');
legend('show');
grid on;
%--------------------------------------------------------------
