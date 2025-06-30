%% 1.(a)----------------------------------------
% t = 0:0.01:80;
% i = 19.65 * sin(100 * pi * t / 1000);
% plot(t, i, 'linewidth', 2);
% xlabel('t/ms');
% ylabel('i(t)/A');
% title('无直流分量时的电流曲线');
% grid on

%% 1.(b)----------------------------------------
% t1 = 0:0.01:80;
% t2 = 0:0.01:80;
% i1 = 19.65 * sin(100 * pi * t1 / 1000 + pi / 2) - 19.65 * exp(-0.04 * t1);
% i2 = 19.65 * sin(100 * pi * t2 / 1000 - pi / 2) + 19.65 * exp(-0.04 * t2);
% plot(t1, i1, t2, i2, 'linewidth', 2);
% xlabel('t/ms');
% ylabel('i(t)/A');
% title('直流分量最大时的电流曲线');
% legend('\alpha = 172.74°','\alpha = -8.26°')
% grid on

%% 1.(d)----------------------------------------
% t = 0:0.01:80;
% for R = [2,3,4]
% i = 19.65 * sin(100 * pi * t / 1000 - pi / 2) + 19.65 * exp(-R * t / 50);
% plot(t, i, 'linewidth', 2);
% xlabel('t/ms');
% ylabel('i(t)/A');
% title('不同电阻取值下的电流曲线');
% hold on;
% end
% legend('R/2','R','2R');
% grid on