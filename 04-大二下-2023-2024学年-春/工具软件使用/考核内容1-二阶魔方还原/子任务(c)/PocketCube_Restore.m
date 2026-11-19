function [State0,T1] = PocketCube_Restore(T)
step1 = [];
step2 = [];
step3 = [];
State0 = [T.Var1,T.Var2,T.Var3,T.Var4];
color6 = State0(6,1);

%数组元素可能的取值为 1、2、3、4、5、6，分别代表白、黄、红、绿、橙、蓝 6 种颜色
switch color6
    case 1
        color5 = 2;
    case 2
        color5 = 1;
    case 3
        color5 = 5;
    case 4
        color5 = 6;
    case 5
        color5 = 3;
    case 6
        color5 = 4;
end

%還原第一層
[State0,step1]= Restore_Bottom(State0,color6,step1);
[State0,step1]= RotateZ(State0,step1);
[State0,step1]= Restore_Bottom(State0,color6,step1);
[State0,step1]= RotateZ(State0,step1);
[State0,step1]= Restore_Bottom(State0,color6,step1);
[State0,step1] =RotateY(State0,step1);
[State0,step1]= RotateY(State0,step1);
%畫圖(還原第一層)
figure(1);
DrawPocketCube(State0);


%還原最上層
[State0,step2]= Restore_Top(State0,color5,step2);
%畫圖(還原黃色面)
figure(2);
DrawPocketCube(State0);

%還原側面
[State0,step3] = Restore_Side(State0,step3);


T1 = [step1;step2;step3];
end