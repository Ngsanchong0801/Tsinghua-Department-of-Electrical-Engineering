delta = 0:0.001:180;
subplot(1,2,1);
PEq = 1.411*sin(delta*pi/180) + 0.09820*sin(2*delta*pi/180);
p = find(PEq==max(PEq));
plot(delta,PEq,'b',[0,delta(p)],[PEq(p),PEq(p)],'r--',...
[delta(p),delta(p)],[0,PEq(p)],'r--','LineWidth',2)
title('内电势E_q 恒定时发电机的功角特性曲线','FontSize',14)
xlabel('\delta/°','FontSize',12)
ylabel('P_E_q','FontSize',12)
grid on

text(delta(p),PEq(p)+0.04,['(',num2str(delta(p)),'°',',',num2str(PEq(p)),')'],...
'color','r','FontSize',14)
axis([0 180 0 1.5])
subplot(1,2,2);
PEq0 = 1.821*sin(delta*pi/180) - 0.1723*sin(2*delta*pi/180);
% p0 = find(PEq0==max(PEq0));
plot(delta,PEq0,'b',[0,delta(p0)],[PEq0(p0),PEq0(p0)],'r--',...
[delta(p0),delta(p0)],[0,PEq0(p0)],'r--','LineWidth',2)
title('暂态电势E^’_q 恒定时发电机的功角特性曲线','FontSize',14)
xlabel('\delta/°','FontSize',12)
ylabel('P_E^’_q','FontSize',12)
grid on
text(delta(p0),PEq0(p0)+0.06,['(',num2str(delta(p0)),'°',',',num2str(PEq0(p0)),')'],...
'color','r','FontSize',14)
axis([0 180 0 2.0])