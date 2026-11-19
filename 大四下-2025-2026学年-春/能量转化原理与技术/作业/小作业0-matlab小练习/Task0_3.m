clear; 
clc;
params = [3, 4; -100, 20; 30, -exp(3)];

for i = 1:3
    d = params(i,1); 
    q = params(i,2);
    f = @(x) (x^2 + d) - (-x^2 + q^2);
    x_sol = fsolve(f,1);
    disp(x_sol);
end