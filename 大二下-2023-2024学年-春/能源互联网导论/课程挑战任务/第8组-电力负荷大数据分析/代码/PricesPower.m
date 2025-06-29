% 读取Excel文件
[num, txt] = xlsread('Tariffs.xlsx');

% 将'Normal'映射为0
txt(strcmp(txt, 'Normal')) = {11.76};


% 将'High'映射为1
txt(strcmp(txt, 'High')) = {67.2};

% 将'Low'映射为-1
txt(strcmp(txt, 'Low')) = {3.99};

% 将无法转换为数值的文本设置为NaN
nonNumericIndices = cellfun(@(x) ~isnumeric(x), txt);
txt(nonNumericIndices) = {NaN};

% 将文本转换为数值
data = cell2mat(txt);

% 获取第二列数据
mappedValues = data(:, 2);

% 绘制折线图
plot(mappedValues);
xlabel('Index');
ylabel('Mapped Value');
title('Plot of Mapped Values');
hold on
[num, txt, raw] = xlsread('MAC005291.xlsx');

% 获取第三列数据
fourthColumn = 70*num(:, 2);

% 绘制数据
plot(fourthColumn);