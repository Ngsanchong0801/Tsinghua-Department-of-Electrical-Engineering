% 读取Excel文件中的第一列数据
data = readcell('Results.xlsx', 'Range', 'A:A');

% 将空白值替换为0
data(cellfun(@isempty, data)) = {0};

% 将所有非数值数据转换为0
data(~cellfun(@isnumeric, data)) = {0};

% 转换数据为数值类型
data = cell2mat(data);

% 绘制数据
figure;
plot(data, '-o');
%title('灵活性潜力');
xlabel('');
ylabel('灵活性潜力');
grid on;
