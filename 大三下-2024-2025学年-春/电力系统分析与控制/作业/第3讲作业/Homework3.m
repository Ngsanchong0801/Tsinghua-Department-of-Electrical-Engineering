clear
clc
mpc=case57;
% 
% mpc.branch(:,3)=0;
% mpc.branch(:,5)=0;

Y=makeYbus(mpc);
B=imag(Y);
G=real(Y);
n=length(mpc.bus(:,1));
m=length(mpc.branch(:,1));

pq=[];
pv=[];
vh=[];
for i=1:n
    if (mpc.bus(i,2)==1)
        pq=[pq;i];
    elseif (mpc.bus(i,2)==2)
        pv=[pv;i];
    else
        vh=[vh;i];
    end
end

makeB=zeros(n);
for i=1:n
    a=mpc.branch(i,1);
    b=mpc.branch(i,2);
    makeB(a,b)=makeB(a,b)+1/mpc.branch(i,4);
    makeB(b,a)=makeB(b,a)+1/mpc.branch(i,4);
    makeB(a,a)=makeB(a,a)-1/mpc.branch(i,4);
    makeB(b,b)=makeB(b,b)-1/mpc.branch(i,4);
end

%% task1
% X0=inv(B(2:n,2:n));
% dertaP=(X0(8,7)-X0(12,7))*(-B(9,13))*0.1;
% key1=runpf(mpc);
% mpc.gen(5,2)=mpc.gen(5,2)+0.1;
% key2=runpf(mpc);
% dertaP_Plus=key2.branch(12,14)-key1.branch(12,14);
% 3.84  3.86

%% task2
dertaV_pv=[0.01;0.01;0.01;0;0;0];
B11=B([pv;pq],[pv;pq]);
B12=-inv(B11);
t=length(pv);
A=B12(1:t,1:t);
C=B12(t+1:n-1,1:t);
dertaV_pq=C/A*dertaV_pv;
mat1=C/A;
key1=runpf(mpc);
mpc.gen(2:end,6)=mpc.gen(2:end,6)+dertaV_pv;
key2=runpf(mpc);
finalV=zeros(length(pq),2);
finalV(:,1)=key1.bus(pq,8)+dertaV_pq;
finalV(:,2)=key2.bus(pq,8);
finalV(:,3)=(finalV(:,2)-finalV(:,1))/0.01*100;