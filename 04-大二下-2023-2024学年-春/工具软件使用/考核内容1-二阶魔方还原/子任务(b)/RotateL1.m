function [State1,step1] = RotateL1(State0,step0)
%上側逆時針旋轉90度
%State1-新狀態
%State0-舊狀態
State1 = State0;

%左側側面色塊順序
State1(1,1) = State0(6,1);
State1(1,3) = State0(6,3);

State1(6,1) = State0(2,4);
State1(6,3) = State0(2,2);

State1(2,4) = State0(5,1);
State1(2,2) = State0(5,3);

State1(5,1) = State0(1,1);
State1(5,3) = State0(1,3);

%左側正面色塊順序
State1(3,1) = State0(3,2);
State1(3,2) = State0(3,4);
State1(3,3) = State0(3,1);
State1(3,4) = State0(3,3);

step1 = [step0;'L-'];
end