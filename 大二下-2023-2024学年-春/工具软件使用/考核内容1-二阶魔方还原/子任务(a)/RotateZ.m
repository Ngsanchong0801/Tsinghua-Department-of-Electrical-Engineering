function [State1,step1] = RotateZ(State0,step0)
%整個魔方在XYZ軸中沿Z軸向左旋轉
State2=[State0(4,:);State0(3,:);State0(1,:);State0(2,:);State0(5,:);State0(6,:)];

State1 = State2;

State1(5,:) = [State2(5,3),State2(5,1),State2(5,4),State2(5,2)];
State1(6,:) = [State2(6,2),State2(6,4),State2(6,1),State2(6,3)];

step1 = [step0;'Z+'];
end