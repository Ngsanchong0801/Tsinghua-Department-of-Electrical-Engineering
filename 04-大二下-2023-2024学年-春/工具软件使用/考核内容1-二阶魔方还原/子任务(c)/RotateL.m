function [State1,step1] = RotateL(State0,step0)
%左側順時針旋轉90度

%將左側面逆時針旋轉3次90度，即順時針旋轉90度
State1 = RotateL1(State0,step0);
State1 = RotateL1(State1,step0);
State1 = RotateL1(State1,step0);

step1 = [step0;'L+'];
end