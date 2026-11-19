VF = 400; rF = 0.4; iF0 = VF/rF;
f = 50;    w = 2.*pi*f; pi2=2.*pi/3;
%-----------------------------------------------------------------------
d = 180;  % 调整thetaa(0)时，需将此参数改为对应的角度制数值(90、180)
%-----------------------------------------------------------------------
d = d*pi/180;
t0 = 0 ; tfinal = 0.80;
i0 = [0; 0; 0; iF0; 0; 0;];           % Initial currents
%[t,i] = ode45('Gllshort', t0, tfinal, i0);         % use for MATLAB 4
tspan = [t0, tfinal];                              % use for MATLAB 5
[t,i] = ode45(@Gllshort, tspan, i0);               % use for MATLAB 5
% id,iq,i0 = Armature current  iF=Field current
id=i(:,1); iq=i(:,2);i0=i(:,3); iF=i(:,4); iD=i(:,5); iQ=i(:,6);
%current dq0 to current abc
nn=length(id);
for kk=1:nn
    tt=t(kk);
%-----------------------------------------------------------------------
    thetaa=w*tt+pi; % 调整thetaa(0)时，需在w*tt后面加上对应的弧度制数值(pi/2、pi)
%-----------------------------------------------------------------------
    thetab=thetaa-pi2;
    thetac=thetaa+pi2;
    ia(kk)=cos(thetaa)*id(kk)-sin(thetaa)*iq(kk)+i0(kk);
    ib(kk)=cos(thetab)*id(kk)-sin(thetab)*iq(kk)+i0(kk);
    ic(kk)=cos(thetac)*id(kk)-sin(thetac)*iq(kk)+i0(kk);
end
figure(1), plot(t,ia), xlabel('t/s'), ylabel('ia/A'), grid
title(['three phase short circuit  ia,  ','delta = ', num2str(d)])
figure(2), plot(t,iF), xlabel('t/s'), ylabel('iF/A'), grid
title(['Line-line short circuit iF, ','delta = ',num2str(d)])

%% Gllshort.m
function iprime = Gllshort(t,i)
f=50.;  w=2.*pi*f;
d=0.;   d=d*pi/180.;  theta=w*t+d;

% Parameters of a 500 MVA, 30 kV Synchronous Machine
Ld = 0.0072;   Lq = 0.0070;  L0=0.0010;  LF = 2.500;   LD = 0.0068;   LQ = 0.0016;
MF = 0.100;   MD = 0.0054;   MQ = 0.0026;  MR = 0.1250;
r  = 0.002;   rF = 0.4000;   rD  = 0.015;  rQ = 0.0150;

VF = 400;                % dc field voltage
V = [0; 0; 0; VF; 0; 0];   % Voltage column vector
K=3/2.;  RT2=sqrt(2.0);

R=[r        0          0        0          0               0
    0        r          0        0          0               0
    0        0          r        0          0               0
    0        0          0        rF         0               0
    0        0          0        0          rD              0
    0        0          0        0          0               rQ];

L=[Ld       0          0        MF         MD         0
    0        Lq         0        0          0          MQ
    0        0          L0       0          0          0
    K*MF     0          0        LF         MR         0
    K*MD     0          0        MR         LD         0
    0        K*MQ       0        0          0          LQ];

WW=[0        -w          0        0          0               0
    w        0           0        0          0               0
    0        0           0        0          0               0
    0        0           0        0          0               0
    0        0           0        0          0               0
    0        0           0        0          0               0];

Li=inv(L);
iprime=Li*V - Li*(WW*L+R)*i;
end
