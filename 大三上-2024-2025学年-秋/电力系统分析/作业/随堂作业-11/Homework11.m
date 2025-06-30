t = 0:0.00001:1;
figure
ib = 8.547*exp(-6.173*t) + (3.339*exp(-9.524*t) + 4.671*exp(-1.190*t) + 0.5376).*cos(100*pi*t - pi);
plot(t,ib)
title('Three phase short circuit ib')
figure
ic = -4.274*exp(-6.173*t) + (3.339*exp(-9.524*t) + 4.671*exp(-1.190*t) + 0.5376).*cos(100*pi*t + pi/3);
plot(t,ic)
title('Three phase short circuit ic')