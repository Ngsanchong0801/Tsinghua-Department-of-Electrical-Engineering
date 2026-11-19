%%(1)--------------------------------------------------------------------------------
% n_open = [1505, 1504, 1500, 1494, 1487, 1478, 1471];
% I_d_open = [0.715, 0.773, 0.918, 1.171, 1.460, 1.834, 2.162];
% 
% n_closed = [1502, 1501, 1501, 1501, 1501, 1501, 1501];
% I_d_closed = [0.705, 0.722, 0.934, 1.118, 1.418, 1.763, 2.215];
% 
% % 绘图
% figure;
% hold on;
% plot(I_d_open, n_open, 'o-', 'LineWidth', 1.5, 'DisplayName', '开环');
% plot(I_d_closed, n_closed, 'o-', 'LineWidth', 1.5, 'DisplayName', '闭环');
% xlabel('I_d (A)');
% ylabel('n (rpm)');
% title('机械特性测定');
% legend;
% grid on;
% ylim([1400, 1600]);
%%--------------------------------------------------------------------------------

%%(2)--------------------------------------------------------------------------------
% n_ref = [1500, 1250, 1000, 750, 500, 250, 0];
% n = [1501, 1251, 1001, 750.8, 500.6, 250.3, 0];
% 
% % 绘图
% figure;
% plot(n_ref, n, 'o-', 'LineWidth', 1.5);
% xlabel('n_{ref} (rpm)');
% ylabel('n (rpm)');
% title('闭环控制特性测定');
% grid on;
%%--------------------------------------------------------------------------------

%%(3)--------------------------------------------------------------------------------
% result1 = convertTDMS(false,'1.tdms'); 
% result2 = convertTDMS(false,'2.tdms'); 
% result3 = convertTDMS(false,'3.tdms'); 
% result4 = convertTDMS(false,'4.tdms'); 
% result5 = convertTDMS(false,'5.tdms'); 
% result6 = convertTDMS(false,'6.tdms'); 
% result7 = convertTDMS(false,'7.tdms'); 
% result8 = convertTDMS(false,'8.tdms'); 
% 
% 
% % 绘制数据
% figure(1);
% plot(result1.Data.MeasuredData(7).Data);
% ylabel('转速n/rpm');
% title('启动过程中转速的变化曲线');
% 
% figure(2);
% 
% plot(result1.Data.MeasuredData(6).Data);
% ylabel('电枢电流I_d/A');
% title('启动过程中电流的变化曲线');
% 
% figure(3);
% plot(result4.Data.MeasuredData(7).Data);
% ylabel('转速n/rpm');
% title('停止过程中转速的变化曲线');
% 
% figure(4);
% plot(result4.Data.MeasuredData(6).Data);
% ylabel('电枢电流I_d/A');
% title('停止过程中电流的变化曲线');

%%--------------------------------------------------------------------------------

%%(4)--------------------------------------------------------------------------------
% result1 = convertTDMS(false,'1.tdms'); 
% result2 = convertTDMS(false,'2.tdms'); 
% result3 = convertTDMS(false,'3.tdms'); 
% result4 = convertTDMS(false,'4.tdms'); 
% result5 = convertTDMS(false,'5.tdms'); 
% result6 = convertTDMS(false,'6.tdms'); 
% result7 = convertTDMS(false,'7.tdms'); 
% result8 = convertTDMS(false,'8.tdms'); 
% 
% combined_data = [result1.Data.MeasuredData(7).Data;result2.Data.MeasuredData(7).Data;result3.Data.MeasuredData(7).Data;result4.Data.MeasuredData(7).Data];
% 
% plot(combined_data);
% figure(1);
% ylabel('转速n/rpm');
% title('启停、突加突减负载的转速变化波形');

%%--------------------------------------------------------------------------------

%%(5)--------------------------------------------------------------------------------
result1 = convertTDMS(false,'1.tdms'); 
result2 = convertTDMS(false,'2.tdms'); 
result3 = convertTDMS(false,'3.tdms'); 
result4 = convertTDMS(false,'4.tdms'); 
result5 = convertTDMS(false,'5.tdms'); 
result6 = convertTDMS(false,'6.tdms'); 
result7 = convertTDMS(false,'7.tdms'); 
result8 = convertTDMS(false,'8.tdms'); 

combined_data = [result5.Data.MeasuredData(7).Data;result6.Data.MeasuredData(7).Data;result7.Data.MeasuredData(7).Data;result8.Data.MeasuredData(7).Data];

plot(combined_data);
figure(1);
ylabel('转速n/rpm');
title('启停、突加突减负载的转速变化波形');

%%--------------------------------------------------------------------------------