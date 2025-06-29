function [State1,step1] = RotateURU1R1(State0,step0)
%還原二階魔方的萬能公式:左上右下 https://zhuanlan.zhihu.com/p/61016023
[State1,step1] = RotateU(State0,step0);
[State1,step1] = RotateR(State1,step1);
[State1,step1] = RotateU1(State1,step1);
[State1,step1] = RotateR1(State1,step1);
end