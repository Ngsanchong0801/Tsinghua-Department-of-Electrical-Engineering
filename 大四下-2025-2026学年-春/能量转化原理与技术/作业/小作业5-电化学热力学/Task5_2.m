clear;
clc;
% 基础参数
T = 340; p = 5:0.1:100; p0 = 1; 
R = 8.314e-3; F = 96.485; 
n_H2_reacted = 475; % mol/h
n_O2_in = 296.875;  % mol/h

% 1. 燃料电池发电功率 P_fc (kW)
dG_std = -237.13 + 0.164*(T-298.15); 
dG = dG_std - (3/2)*R*T*log(p/p0);
P_fc = abs(dG) * n_H2_reacted / 3600; % kW

% 2. 压缩机耗功 P_comp (kW)
gamma = 1.4;
P_comp = n_O2_in * (gamma/(gamma-1)) * R * 298.15 * ((p/p0).^((gamma-1)/gamma) - 1) / 3600;

% 3. 系统净发电量
P_sys = P_fc - P_comp;

% ... (前面的计算代码保持不变) ...

% 绘制图像
figure;
plot(p, P_fc, 'r', 'LineWidth', 2); hold on;
plot(p, P_sys, 'b', 'LineWidth', 2);

% 标注最大值点
[max_val, idx] = max(P_sys);
plot(p(idx), max_val, 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 8); % 标注黄色圆点
text(p(idx)+2, max_val, sprintf('  最大值: %.2f kW (%.1f bar)', max_val, p(idx)), 'FontSize', 10);

xlabel('压力 p (bar)'); ylabel('发电量 (kW)');
legend('燃料电池发电量', '系统净发电量', 'Location', 'best');
grid on;