function [State1,step1] = RotateX(State0,step0)
%整個魔方在XYZ軸中沿X軸逆時針旋轉
%State2=[State0(1,:);State0(2,:);State0(5,:);State0(6,:);State0(4,:);State0(3,:)];

%State1 = State2;

%State1(1,:) = [State2(1,2),State2(1,4),State2(1,1),State2(1,3)];
%State1(2,:) = [State2(2,3),State2(2,2),State2(2,4),State2(2,1)];


State1 = RotateY(State0,step0);
State1 = RotateZ(State1,step0);
State1 = RotateY(RotateY(RotateY(State1,step0),step0),step0) ;

step1 = [step0;'X-'];
end