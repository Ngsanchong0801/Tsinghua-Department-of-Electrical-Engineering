%直接輸入6*4矩陣作為魔方的狀態
%1~6行分别代表魔方的前、后、左、右、上、下六个面;
%每行的1~4列為正視當前行對應面時，左上、右上、左下、右下的色塊顏色;
%數組元素可能的取值為 1、2、3、4、5、6，分別代表白、黃、紅、綠、橙、藍 6 種顏色
% T = [6 4 4 3;
%      4 6 6 3;
%      5 3 6 5;
%      3 5 2 2;
%      1 1 1 1;
%      2 4 2 5];
% 
% T2=array2table(T);
%[State0,T1] = PocketCube_Restore(T2);

T = readtable("Cube_input.xlsx");

[State0,T1] = PocketCube_Restore(T);
step = 'step.xlsx';
writematrix(T1,step);

disp(T1);