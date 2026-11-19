function [State1,step1] = RotateY(State0,step0)
%整個魔方在XYZ軸中沿Y軸向下旋轉
State2=[State0(5,:);State0(6,:);State0(3,:);State0(4,:);State0(2,:);State0(1,:)];

State1 = State2;

State1(2,:) = [State2(2,4),State2(2,3),State2(2,2),State2(2,1)];
State1(3,:) = [State2(3,3),State2(3,1),State2(3,4),State2(3,2)];
State1(4,:) = [State2(4,2),State2(4,4),State2(4,1),State2(4,3)];
State1(5,:) = [State2(5,4),State2(5,3),State2(5,2),State2(5,1)];

step1 = [step0;'Y-'];
end