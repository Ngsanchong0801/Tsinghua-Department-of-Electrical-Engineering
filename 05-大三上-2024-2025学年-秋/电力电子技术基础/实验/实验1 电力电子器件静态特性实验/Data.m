% 清空环境
clear;
figure(1);
hold on; 
num = 1:6;
num = [num,8,9];
legends = cell(1,8); % 用于保存图例的标签
legendIndex = 1; % 用于跟踪图例的索引

for i = 1:8
    % 加载对应文件
    re = num(i);
    filename = sprintf('E:\\清華\\Learning\\大三上-2024-2025学年-秋\\电力电子技术基础\\实验\\实验1 电力电子器件静态特性实验\\实验1 电力电子器件静态特性实验-实验数据\\HIGHVOLTAGE%d.MAT', re+10006);
    data = load(filename);
    
    % 提取所需数据
    a = data.CH06;  
    b = data.CH05;  
    len = length(a);
    c = round(length(b)/len);
    n = 1:len;
    
    % 获取 CH04 第一个数据作为图例条目
    Ugs = round(data.CH04(1)*2)/2;
    label = num2str(Ugs);
    
    % 如果是 Ugs=5，跳过绘制，但在图例中保留
    if Ugs == 5
        legends{legendIndex} = ['Ugs=' label 'V']; % 直接添加到图例
        legendIndex = legendIndex + 1;
        continue;
    end
    
    a1 = interp1(n, a, linspace(1,len,c*len-c+1))'; % 线性插值
    
    % 绘制图像
    plot(a1, b(1:length(a1)), 'DisplayName', label, 'LineWidth', 1); % 设置 DisplayName 为图例条目
    
    % 保存图例条目
    legends{legendIndex} = ['Ugs=' label 'V'];
    legendIndex = legendIndex + 1; % 更新图例索引
end

% 设置坐标轴标签
xlabel('Uds/V');
ylabel('Id/A');

% 删除未使用的图例项
legends = legends(~cellfun('isempty',legends)); % 去除空的图例条目

% 添加图例
legend(legends);

hold off; % 关闭保持模式

% 绘制一幅當 Uds=2 時的 Uds/Id 點的圖
figure(2);
hold on;
legendIndex = 1; % 重置图例索引
Ugs_2 = [];
Ron_2 = [];

for i = 1:8
    % 加载对应文件
    re = num(i);
    filename = sprintf('E:\\清華\\Learning\\大三上-2024-2025学年-秋\\电力电子技术基础\\实验\\实验1 电力电子器件静态特性实验\\实验1 电力电子器件静态特性实验-实验数据\\HIGHVOLTAGE%d.MAT', re+10006);
    data = load(filename);
    
    % 提取所需数据
    a = data.CH06;  % Uds
    b = data.CH05;  % Id
    len = length(a);
    c = round(length(b)/len);
    n = 1:len;
    
    % 获取 CH04 第一个数据作为图例条目
    Ugs = round(data.CH04(1)*2)/2;
    label = num2str(Ugs);
    
    % 如果是 Ugs=3and3.5，跳过绘制，但在图例中保留
    if Ugs == 4 || Ugs == 3
        % legends{legendIndex} = ['Ugs=' label 'V']; % 直接添加到图例
        % legendIndex = legendIndex + 1;
        continue;
    end
    
    a1 = interp1(n, a, linspace(1,len,c*len-c+1))'; % 线性插值
    
    % 找到 Uds 接近 2 的点并计算 Uds/Id
    [~, index] = min(abs(a1 - 2)); % 找到最接近 Uds=2 的位置
    Ron = a1(index) / b(index); % 计算 Uds/Id
    
    % 存储数据
    Ugs_2 = [Ugs_2, Ugs];
    Ron_2 = [Ron_2, Ron];
end

% 绘制 Uds/Id 在 Uds=2 时的点并连线
plot(Ugs_2, Ron_2, '-o', 'LineWidth', 2);
xlabel('U_g_s/V');
ylabel('R_d_s/Ω');

% 设置图例
legend('Uds=2V', 'Location', 'Best');

hold off; % 关闭保持模式
