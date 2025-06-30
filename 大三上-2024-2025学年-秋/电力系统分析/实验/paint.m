clc;
clear all;

A=readmatrix("17/5号发电机RTU.csv");
F=A(:,25);
ua=A(:,3);ia=A(:,13);pa=A(:,26);qa=A(:,30);
ub=A(:,4);ib=A(:,14);pb=A(:,27);qb=A(:,31);
uc=A(:,5);ic=A(:,15);pc=A(:,28);qc=A(:,32);

%% normal integrate
close all;
paint1(ua,ub,uc,ia,ib,ic,pa,pb,pc,qa,qb,qc,F,8,10);

% %% over-voltage 20V
% close all;
% paint1(ua,ub,uc,ia,ib,ic,pa,pb,pc,qa,qb,qc,F,13,16.8);
% %% under-voltage 20V
% close all;
% paint1(ua,ub,uc,ia,ib,ic,pa,pb,pc,qa,qb,qc,F,20,22);
% %% over-frequency
% close all;
% paint1(ua,ub,uc,ia,ib,ic,pa,pb,pc,qa,qb,qc,F,30.7,31.7);
% %% under-frequency
% close all;
% paint1(ua,ub,uc,ia,ib,ic,pa,pb,pc,qa,qb,qc,F,32.5,33.5);

% %% normal deblock
% close all;
% paint1(ua,ub,uc,ia,ib,ic,pa,pb,pc,qa,qb,qc,F,9.5,10.5);
% %% P positive
% close all;
% paint1(ua,ub,uc,ia,ib,ic,pa,pb,pc,qa,qb,qc,F,39.7,40.4);
% %% P negative
% close all;
% paint1(ua,ub,uc,ia,ib,ic,pa,pb,pc,qa,qb,qc,F,44,45);

% %% Q change
% close all;
% paint1(ua,ub,uc,ia,ib,ic,pa,pb,pc,qa,qb,qc,F,46,48);
