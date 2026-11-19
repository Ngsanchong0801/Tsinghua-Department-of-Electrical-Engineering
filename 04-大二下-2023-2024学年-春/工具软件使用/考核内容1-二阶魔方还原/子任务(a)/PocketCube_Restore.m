function [State0,T1] = PocketCube_Restore(T)
step1 = [];
step2 = [];
step3 = [];
State0 = [T.T1,T.T2,T.T3,T.T4];
color6 = State0(6,1);

%還原最下層
[State0,step1]= Restore_Bottom(State0,color6,step1);
[State0,step1]= RotateZ(State0,step1);
[State0,step1]= Restore_Bottom(State0,color6,step1);
[State0,step1]= RotateZ(State0,step1);
[State0,step1]= Restore_Bottom(State0,color6,step1);
[State0,step1] =RotateY(State0,step1);
[State0,step1]= RotateY(State0,step1);

switch color6
    case 1
        color5 = 2;
    case 2
        color5 = 1;
    case 3
        color5 = 5;
    case 4
        color5 = 6;
    case 5
        color5 = 3;
    case 6
        color5 = 4;
end

%還原最上層
[State0,step2]= Restore_Top(State0,color5,step2);
color = 0;
if State0(1,3) == State0(1,4)
    color = State0(1,3);
    [State0,step3]= RotateU1(State0,step3);
    [State0,step3]= RotateZ(State0,step3);
    [State0,step3]= RotateU1(State0,step3);
    [State0,step3]= RotateZ(State0,step3);
    [State0,step3]= RotateU1(State0,step3);
    [State0,step3]= RotateZ(State0,step3);
elseif State0(2,3) == State0(2,4)
    color = State0(1,3);
    [State0,step3]= RotateU1(State0,step3);
    [State0,step3]= RotateZ(State0,step3);
elseif State0(3,3) == State0(3,4)
    color = State0(3,3);
    [State0,step3]= RotateU1(State0,step3);
    [State0,step3]= RotateZ(State0,step3);
    [State0,step3]= RotateU1(State0,step3);
    [State0,step3]= RotateZ(State0,step3);
elseif State0(4,3) == State0(4,4)
    color = State0(4,3);
end

if State0(1,1) == color
    [State0,step3]= RotateU1(State0,step3);
elseif State0(2,1) == color
    [State0,step3]= RotateU(State0,step3);
elseif State0(3,1) == color
    [State0,step3]= RotateU(State0,step3);
    [State0,step3]= RotateU(State0,step3);
end

%還原側面
[State0,step3] = Restore_Side(State0,step3);
if color == 0
    if State0(1,3) == State0(1,4)
        color = State0(1,3);
        [State0,step3] =RotateU1(State0,step3);
        [State0,step3]= RotateZ(State0,step3);
        [State0,step3] =RotateU1(State0,step3);
        [State0,step3]= RotateZ(State0,step3);
        [State0,step3] =RotateU1(State0,step3);
        [State0,step3]= RotateZ(State0,step3);
    elseif State0(2,3) == State0(2,4)
        color = State0(1,3);
        [State0,step3] =RotateU1(State0,step3);
        [State0,step3]= RotateZ(State0,step3);
    elseif State0(3,3) == State0(3,4)
        color = State0(3,3);
        [State0,step3] =RotateU1(State0,step3);
        [State0,step3]= RotateZ(State0,step3);
        [State0,step3] =RotateU1(State0,step3);
        [State0,step3]= RotateZ(State0,step3); 
    elseif State0(4,3) == State0(4,4)
        color = State0(4,3);
    end
    if State0(1,1) == color
        [State0,step3] = RotateU1(State0,step3);
    elseif State0(2,1) == color
        [State0,step3] = RotateU(State0,step3);
    elseif State0(3,1) == color
        [State0,step3] = RotateU(State0,step3);
        [State0,step3] = RotateU(State0,step3);
    end
end

if State0(1,1) == State0(4,3)
    [State0,step3]= RotateU1(State0,step3);
elseif State0(1,1) == State0(3,3)
    [State0,step3]= RotateU(State0,step3);
end

T1 = [step1;step2;step3];
end