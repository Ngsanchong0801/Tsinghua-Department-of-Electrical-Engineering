clear;
clc;
mpc=case39_d;
% mpc = loadcase('case3375wp');
opt = mpoption('pf.alg', 'FDXB','pf.nr.max_it', 200); 
results = runpf(mpc, opt);

