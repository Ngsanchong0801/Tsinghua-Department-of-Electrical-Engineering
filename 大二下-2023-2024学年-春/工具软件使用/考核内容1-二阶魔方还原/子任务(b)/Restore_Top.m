function [State1,step1] = Restore_Top(State0,color5,step0)
%還原最上層
%color5:最上層顏色
if State0(1,4) == color5
    [State1,step1] = RotateURU1R1(State0,step0);
    [State1,step1] = RotateURU1R1(State1,step1);

elseif State0(4,3) == color5
    [State1,step1] = RotateURU1R1(State0,step0);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);

elseif State0(4,4) == color5
    [State1,step1] = RotateU1(State0,step0);
    [State1,step1] = RotateZ(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);

elseif State0(2,3) == color5
    [State1,step1] = RotateU1(State0,step0);
    [State1,step1] = RotateZ(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);

elseif State0(2,4) == color5
    [State1,step1] = RotateU1(State0,step0);
    [State1,step1] = RotateZ(State1,step1);
    [State1,step1] = RotateU1(State1,step1);
    [State1,step1] = RotateZ(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);

elseif State0(3,3) == color5
    [State1,step1] = RotateU1(State0,step0);
    [State1,step1] = RotateZ(State1,step1);
    [State1,step1] = RotateU1(State1,step1);
    [State1,step1] = RotateZ(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);

elseif State0(3,4) == color5
    [State1,step1] = RotateU1(State0,step0);
    [State1,step1] = RotateZ(State1,step1);
    [State1,step1] = RotateU1(State1,step1);
    [State1,step1] = RotateZ(State1,step1);
    [State1,step1] = RotateU1(State1,step1);
    [State1,step1] = RotateZ(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);

elseif State0(1,3) == color5
    [State1,step1] = RotateU1(State0,step0);
    [State1,step1] = RotateZ(State1,step1);
    [State1,step1] = RotateU1(State1,step1);
    [State1,step1] = RotateZ(State1,step1);
    [State1,step1] = RotateU1(State1,step1);
    [State1,step1] = RotateZ(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
end

%檢查上側面是否還原
if State1(6,1)~=color5||State1(6,2)~=color5||State1(6,3)~=color5||State1(6,4)~=color5
    [State1,step1] = Restore_Top(State1,color5,step1);
end
end