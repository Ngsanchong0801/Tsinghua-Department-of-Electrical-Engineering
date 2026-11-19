function [State1,step1] = RotateR1(State0,step0)
%右側逆時針旋轉90度
%State1-新狀態
%State0-舊狀態
State1 = State0;

%右側側面色塊順序
State1(1,2) = State0(5,2);
State1(1,4) = State0(5,4);

State1(5,2) = State0(2,3);
State1(5,4) = State0(2,1);

State1(2,3) = State0(6,2);
State1(2,1) = State0(6,4);

State1(6,2) = State0(1,2);
State1(6,4) = State0(1,4);

%右側正面色塊順序
State1(4,1) = State0(4,2);
State1(4,2) = State0(4,4);
State1(4,3) = State0(4,1);
State1(4,4) = State0(4,3);

step1 = [step0;'R-'];
end