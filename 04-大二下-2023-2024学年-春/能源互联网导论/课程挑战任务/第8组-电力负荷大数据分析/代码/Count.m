% 读取XLSX文件
data = readcell('Tariffs.xlsx');

% 初始化变量
startRow = 174;     % 开始计数的行数
totalRows = size(data, 1);  % 获取总行数

% 扫描整个文件
while startRow <= totalRows
    count = 0;          % 计数器
    currentValue = '';  % 当前元素值
    
    % 从指定的开始行开始扫描第二列
    for row = startRow:totalRows
        value = data{row, 2};  % 获取当前行第二列的值
        
        if ~strcmpi(value, 'Normal')
            % 元素不等于"Normal"
            if count == 0
                % 如果计数器为0，表示开始计数
                currentValue = value;
                count = 1;
            elseif strcmpi(value, currentValue)
                % 如果元素与之前的值相同，继续计数
                count = count + 1;
            else
                % 元素与之前的值不同，停止计数
                break;
            end
        end
    end
    
    if count == 0
        % 如果没有找到符合条件的连续区间，结束扫描
        break;
    end
    
    % 计算记录的行数
    recordRows = [startRow-48, startRow-96, startRow-144, startRow+48, startRow+96, startRow+144];  % 记录的行数
    endRecordRows = recordRows + count - 1;

    % 输出结果
    fprintf('开始计数的行数：%d\n', startRow);
    fprintf('计数长度：%d\n', count);
    fprintf('期间元素的值：%s\n', currentValue);
    fprintf('电价开始记录的行数：%s\n', mat2str(recordRows));
    fprintf('电价结束记录的行数：%s\n', mat2str(endRecordRows));

    % 计算另一个Excel文件中特定范围的第4列数值总和，并输出所有元素的结果
    data2 = readcell('MAC005291.xlsx');
    totals = zeros(1, 6);

    for i = 1:6
        startRow2 = recordRows(i);
        endRow2 = endRecordRows(i);
        totals(i) = sum([data2{startRow2:endRow2, 4}]);
        fprintf('第%d个元素的电价总和：%f\n', i, totals(i));
    end

    % 计算电价总和的平均值
    average = mean(totals);

    % 输出平均值
    fprintf('电价总和的平均值：%f\n', average);

    % 创建变动当天用电量数组
    electricityUsage = [startRow, startRow + count];

    % 输出变动当天用电量数组
    fprintf('变动当天用电量：%s\n', mat2str(electricityUsage));

    % 读取第二个Excel文件
    data3 = readcell('MAC005291.xlsx');

    % 计算起始行数和结束行数
    startRow3 = electricityUsage(1);
    endRow3 = electricityUsage(2);

    % 提取第4列数据
    column4Data = [data3{startRow3:endRow3, 4}];

    % 计算第4列数据的总和
    totalColumn4 = sum(column4Data);

    % 输出结果
    fprintf('變化當天的电价總和：%f\n', totalColumn4);

    % 计算"变化当天的电价总和"减去"电价总和的平均值"的绝对值
    absDiff = abs(totalColumn4 - average);

    % 计算绝对值除以计数长度的一半
    result = absDiff / (count / 2);
    fprintf('计算结果：%f\n', result);

    % 根据期间元素的值进行条件判断
    if strcmpi(currentValue, 'Low')
        result = result / 7.77;
    elseif strcmpi(currentValue, 'High')
        result = result / 55.44;
    end

    % 输出结果
    fprintf('计算结果：%f\n', result);

    % 在一个新的Excel文件中写入结果
    % 新Excel文件名为 'Results.xlsx'
    resultsMatrix = repmat(result, endRow3 - startRow3 + 1, 1);  % 创建包含结果的矩阵
    writematrix(resultsMatrix, 'Results.xlsx', 'Range', sprintf('A%d:A%d', startRow3, endRow3));

    fprintf('结果已写入到新的Excel文件 "Results.xlsx" 中，从第 %d 行到第 %d 行\n', startRow3, endRow3);
    
    % 更新startRow为下一次扫描的起始行
    startRow = row + 1;
end
