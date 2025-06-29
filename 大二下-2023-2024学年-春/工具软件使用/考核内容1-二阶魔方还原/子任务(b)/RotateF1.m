%用不上
%function [State1,step1] = RotateF1(State0,step0)
%上側逆時針旋轉90度
%State1-新狀態
%State0-舊狀態
%State1 = State0;

%前側側面色塊順序
%State1(5,3) = State0(4,1);
%State1(5,4) = State0(4,3);

%State1(4,1) = State0(6,2);
%State1(4,3) = State0(6,1);

%State1(6,2) = State0(3,4);
%State1(6,1) = State0(3,2);

%State1(3,4) = State0(5,3);
%State1(3,2) = State0(5,4);

%前側正面色塊順序
%State1(1,1) = State0(1,2);
%State1(1,2) = State0(1,4);
%State1(1,3) = State0(1,1);
%State1(1,4) = State0(1,3);

%step1 = [step0;'F-'];
%end
