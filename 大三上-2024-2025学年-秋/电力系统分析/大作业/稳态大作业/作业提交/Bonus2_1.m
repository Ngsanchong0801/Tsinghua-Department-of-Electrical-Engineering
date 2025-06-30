clc;clear;
mpc = case33bw;
mpc.bus(33,3) = 4.14;

NR = runpf(mpc);
opt = mpoption('pf.alg','FDXB');
PQ = runpf(mpc,opt);





