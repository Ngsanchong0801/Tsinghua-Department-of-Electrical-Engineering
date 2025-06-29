% % 读取原始Excel文件
% [num, txt, raw] = xlsread('LCL-June2015v2_166.csv');
% 
% % 提取指定行范围的数据
% extractedData = raw(48552:66081, :);
% 
% % 创建新的Excel文件并写入提取的数据
% newFile = 'MAC005291.xlsx';
% xlswrite(newFile, extractedData);

% 读取原始Excel文件
[num, txt, raw] = xlsread('MAC005291.xlsx');

% 获取第三列数据
fourthColumn = num(:, 2);

% 绘制数据
plot(fourthColumn);

% 添加标签和标题
xlabel('行数');
ylabel('第三列数据');
title('第三列数据的图表');