function [State1,step1] = RotateU1(State0,step0)
%上側逆時針旋轉90度
%State1-新狀態
%State0-舊狀態
%State1 = State0;

%上側側面色塊順序
%State1(1,1) = State0(4,1);
%State1(1,2) = State0(4,2);

%State1(4,1) = State0(2,1);
%State1(4,2) = State0(2,2);

%State1(2,1) = State0(3,1);
%State1(2,2) = State0(3,2);

%State1(3,1) = State0(1,1);
%State1(3,2) = State0(1,2);

%上側正面色塊順序
%State1(5,1) = State0(5,2);
%State1(5,2) = State0(5,4);
%State1(5,3) = State0(5,1);
%State1(5,4) = State0(5,3);

State1 = RotateU(RotateU(RotateU(State0,step0),step0),step0);

step1 = [step0;'U-'];
end