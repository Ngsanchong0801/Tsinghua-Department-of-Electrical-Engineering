function [State1] = DrawPocketCube(State0)
    % 對6個面的4個格上色
    % 数组元素可能的取值为 1、2、3、4、5、6，分别代表白、黄、红、绿、橙、蓝 6 种颜色
    colors = {'w', 'y', 'r', 'g', [1, 0.5, 0], 'b'};
    positions = [
        4, 6; 6, 6; 4, 4; 6, 4;

        12, 6; 14, 6; 12, 4; 14, 4;

        0, 6; 2, 6; 0, 4; 2, 4;

        8, 6; 10, 6; 8, 4; 10, 4;

        4, 10; 6, 10; 4, 8; 6, 8;

        4, 2;6, 2; 4, 0; 6, 0;
    ];

    figure; % 创建图形窗口
    hold on; % 同一个窗口

    for i = 1:numel(State0)
        row = ceil(i / 4); % 矩陣中的行,向上取整
        col = mod(i - 1, 4) + 1; % 矩陣中的列

        colorIndex = State0(row, col); %記錄顏色
        posIndex = (row - 1) * 4 + col; %記錄位置

        rectangle('Position', [positions(posIndex, 1), positions(posIndex, 2), 2, 2],'FaceColor', colors{colorIndex}, 'EdgeColor', 'k', 'LineWidth', 2);
    end

    hold off; % 停止在同一个窗口

    State1 = State0;
end
