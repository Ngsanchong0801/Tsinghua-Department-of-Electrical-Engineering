function [State1,step1] = Restore_Side(magics,step0)
%還原側面
    [State1,step1] = RotateURU1R1(magics,step0);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateU1(State1,step1);
    [State1,step1] = RotateZ(State1,step1);

    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateU1(State1,step1);
    [State1,step1] = RotateZ(State1,step1);

    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateU1(State1,step1);
    [State1,step1] = RotateZ(State1,step1);
    [State1,step1] = RotateU1(State1,step1);
    [State1,step1] = RotateZ(State1,step1);

    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
    [State1,step1] = RotateURU1R1(State1,step1);
end