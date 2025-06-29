% 读取CSV文件的数据
data1 = readmatrix('London weather2013.csv');

% 提取第一份数据的第三列
thirdColumn1 = data1(:, 3);

% 绘制第一份数据的第三列
figure;
subplot(2,1,1); % 使用subplot将图分成两部分
plot(thirdColumn1);
title('倫敦2013年气温');
xlabel('天数');
ylabel('摄氏度');
grid on;

% 读取第二个xlsx文件的数据
data2 = readmatrix('MAC005291.xlsx');

% 提取第二份数据的第四列
fourthColumn2 = data2(:, 4);

% 绘制第二份数据的第四列
subplot(2,1,2); % 在同一个图窗中显示第二个图
plot(fourthColumn2);
title('MAC005291用戶2023年用电量');
xlabel('天数');
ylabel('KWH/hh (per half hour) ');
grid on;
