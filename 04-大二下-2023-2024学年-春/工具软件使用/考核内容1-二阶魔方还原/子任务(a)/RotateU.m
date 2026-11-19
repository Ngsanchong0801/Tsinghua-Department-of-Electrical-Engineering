function [State1,step1] = RotateU(State0,step0)
%上側順時針旋轉90度

%將上側面逆時針旋轉3次90度，即順時針旋轉90度
%State1 = RotateU1(State0,step0);
%State1 = RotateU1(State1,step0);
%State1 = RotateU1(State1,step0);


State1= RotateL(RotateX(State0,step0),step0);
State1= RotateX(RotateX(RotateX(State1,step0),step0),step0);

step1 = [step0;'U+'];
end