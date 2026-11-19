function [State1,step1] = RotateR(State0,step0)
%右側順時針旋轉90度

%將右側面逆時針旋轉3次90度，即順時針旋轉90度
State1 = RotateR1(State0,step0);
State1 = RotateR1(State1,step0);
State1 = RotateR1(State1,step0);

step1 = [step0;'R+'];
end