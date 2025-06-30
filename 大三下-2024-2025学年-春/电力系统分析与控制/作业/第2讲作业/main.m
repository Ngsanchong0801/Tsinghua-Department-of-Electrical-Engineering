clc
clear
mpc = loadcase('case3375wp');
opt = mpoption('pf.alg', 'NR-SC','pf.nr.max_it', 200); 
results = runpf(mpc, opt);
