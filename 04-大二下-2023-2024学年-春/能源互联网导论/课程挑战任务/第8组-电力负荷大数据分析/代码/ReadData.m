% 读取原始Excel文件
[num, txt, raw] = xlsread('LCL-June2015v2_166.csv');

% 获取第一列数据
firstColumn = txt(:, 1);

% 获取第三列数据
thirdColumn = txt(:, 3);

% 创建一个空的逻辑向量用于存储满足条件的行索引
matchingRows = false(size(txt, 1), 1);

% 遍历每一行数据，检查条件是否满足
for row = 1:size(txt, 1)
    if strcmp(firstColumn{row}, 'MAC005291') && contains(thirdColumn{row}, '/2013 ')
        matchingRows(row) = true;
    end
end

% 提取匹配的行数据
extractedData = raw(matchingRows, :);

% 创建新的Excel文件并写入提取的数据
newFile = '2023MAC005291.xlsx';
xlswrite(newFile, extractedData);