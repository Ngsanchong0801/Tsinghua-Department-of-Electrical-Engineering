%% 步骤1：合并两个CSV文件
% 读取文件（自动处理表头）

file1 = readtable('4号发电机RTU_14.csv','Encoding','UTF-8');
%file2 = readtable('4号发电机RTU_14.csv');
mergedData = file1;  % 垂直合并表格[1,9](@ref)

%% 步骤2：精确时间处理（合并time和ms列）
% 将时间字符串与毫秒合并为完整时间戳
timeStr = string(mergedData.time) + "." + string(mergedData.ms);  % 格式: "13:38:55.500"
mergedData.FullTime = datetime(timeStr, 'InputFormat', 'HH:mm:ss.SSS');  % 创建含毫秒的datetime[5,8](@ref)

%% 步骤3：时间筛选（13:40~13:48）
% 构建时间范围（含毫秒精度）
startTime = datetime('14:32:00.000', 'InputFormat', 'HH:mm:ss.SSS');
endTime = datetime('14:37:00.000', 'InputFormat', 'HH:mm:ss.SSS');
timeFilter = (mergedData.FullTime >= startTime) & (mergedData.FullTime <= endTime);
filteredData = mergedData(timeFilter, :);  % 精确筛选[7](@ref)

%% 步骤4：绘制多变量曲线
figure('Position', [100, 100, 1200, 800]); 

% 定义变量名和绘图属性
variables = {
    'x4________________IC',   'r',  'IC (A)','4号发电机变压器高压侧IC';
    'x4________________UCA',  'b',  'UCA (V)','4号发电机变压器高压侧UCA';
    'x4________________PC',   'm',  'PC (kW)','4号发电机变压器高压侧PC';
    'x4________________QC',   'c',  'QC (kVar)','4号发电机变压器高压侧QC'
};

% 循环绘制5个子图
for i = 1:4
    subplot(5, 1, i);
    plot(filteredData.FullTime, filteredData.(variables{i,1}), ...
        'Color', variables{i,2}, 'LineWidth', 1.5);
    
    % 设置坐标轴
    ylabel(variables{i,3}, 'FontWeight', 'bold');
    title([variables{i,4} '变化曲线'], 'FontSize', 11);
    grid on;
    
    % 时间轴格式化（显示毫秒）
    if i == 4
        xlabel('时间 (HH:MM:SS.SSS)', 'FontWeight', 'bold');
        datetick('x', 'HH:MM:SS.FFF', 'keepticks')  % 显示毫秒[8](@ref)
    else
        xticklabels('');
    end
    set(gca, 'FontSize', 9);
end

sgtitle('4号发电机运行参数 (投切电阻负荷)', 'FontSize', 14, 'FontWeight', 'bold');