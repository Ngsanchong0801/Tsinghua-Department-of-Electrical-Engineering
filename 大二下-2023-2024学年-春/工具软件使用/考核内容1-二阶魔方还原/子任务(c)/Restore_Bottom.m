function [State1,step1] = Restore_Bottom(State0,color6,step0)
%還原最下層
%color6:最下層顏色
a = color6;
b = State0(1,3);

State1 = State0;
step1 = step0;

if State0(1,1)==a&&State0(3,2)==b
    [State1,step1] = RotateU1(State0,step0);
elseif State0(3,1)==a&&State0(2,2)==b
    [State1,step1] = RotateU1(State0,step0);
    [State1,step1] = RotateU1(State1,step1);
elseif State0(2,1)==a&&State0(4,2)==b
    [State1,step1] = RotateU(State0,step0);
end

if State0(5,1)==a&&State0(3,1)==b
    [State1,step1] = RotateU(State0,step0);
    [State1,step1] = RotateU(State1,step1);
elseif State0(5,2)==a&&State0(2,1)==b
    [State1,step1] = RotateU(State0,step0);
elseif State0(5,3)==a&&State0(1,1)==b
    [State1,step1] = RotateU1(State0,step0);
end

if State0(3,2)==a&&State0(5,3)==b
    [State1,step1] = RotateU1(State0,step0);
elseif State0(2,2)==a&&State0(5,1)==b
    [State1,step1] = RotateU(State0,step0);
    [State1,step1] = RotateU(State1,step1);
elseif State0(4,2)==a&&State0(5,2)==b
    [State1,step1] = RotateU(State0,step0);
end

if State0(6,4)==a&&State0(4,4)==b
    [State1,step1] = RotateR(State0,step0);
    [State1,step1] = RotateR(State1,step1);
end

e = State1(1,4);
f = State1(6,2);

if e~=b||f~=a 
    [State1,step1] = RotateR(State1,step1);
    [State1,step1] = RotateU(State1,step1);
    [State1,step1] = RotateR1(State1,step1);
    [State1,step1] = RotateU1(State1,step1);
    [State1,step1] = Restore_Bottom(State1,color6,step1);
end
end
