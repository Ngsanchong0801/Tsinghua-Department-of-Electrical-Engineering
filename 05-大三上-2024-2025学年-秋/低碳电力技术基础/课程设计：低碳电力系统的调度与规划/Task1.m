clear;
clc;
load('load_and_renewable.mat');
max_load=2400;  %最大负荷/万千瓦时
e=0.820e-3;  %火电碳排放强度（万tCO2/万瓦时）

%% 电源
%水电
hydro_capacitor=[50;120;120;80;130;100];  %水电装机（万千瓦）
hydro_max_time=3000;  %水电最大工作小时（时）

%火电
fire_capacitor=[200;200;200;170;170;170;150;150;130;130;130;100;100;60;60];  %火电装机（万千瓦）
fire_max_time=6200;  %火电最大工作小时（时）

%风电
wind_capacitor=[160];  %风电装机（万千瓦）
wind_max_time=2000; %风电最大工作小时（时）

%光伏
solar_capacitor=[240];  %光伏装机（万千瓦）
solar_max_time=2000; %光伏最大工作小时（时）

%总装机
hydro_all=sum(hydro_capacitor);  %火电总装机（万瓦）
fire_all=sum(fire_capacitor);  %水电总装机（万瓦）
wind_all=sum(wind_capacitor);  %风电总装机（万瓦）
solar_all=sum(solar_capacitor);  %光伏总装机（万瓦）

hydro=sdpvar(96,2);  %水电出力，从左到右为冬季出力、夏季出力
fire=sdpvar(96,2);  %火电出力，从左到右为冬季出力、夏季出力
wind=sdpvar(96,2);  %风电出力，从左到右为冬季出力、夏季出力
solar=sdpvar(96,2);  %光伏出力，从左到右为冬季出力、夏季出力

%发电成本
expense=[0.20;0.10;0.04;0.03;0.15]*1e4;  %五种发电开销，从左到右为火电、水电、风电、光伏、核电，单位（元/万千瓦时）

%% 约束
cons1=[]; %冬季
cons2=[]; %夏季

%目标函数：系统总运行成本最小化
objective1=0.25*(sum(fire(:,1))*fire_all*expense(1)+sum(hydro(:,1))*hydro_all*expense(2)+sum(wind(:,1))*wind_all*expense(3)+sum(solar(:,1))*solar_all*expense(4));
objective2=0.25*(sum(fire(:,2))*fire_all*expense(1)+sum(hydro(:,2))*hydro_all*expense(2)+sum(wind(:,2))*wind_all*expense(3)+sum(solar(:,2))*solar_all*expense(4));

%系统功率平衡约束
cons1=[cons1,load_winter(1,:)'==hydro(:,1).*hydro_all+fire(:,1).*fire_all+wind(:,1).*wind_all+solar(:,1).*solar_all];
cons2=[cons2,load_summer(1,:)'==hydro(:,2).*hydro_all+fire(:,2).*fire_all+wind(:,2).*wind_all+solar(:,2).*solar_all];

%机组出力约束
cons1=[cons1,0<=hydro(:,1)<=0.6];
cons2=[cons2,0<=hydro(:,2)<=1];
cons1=[cons1,0.5<=fire<=1];
cons2=[cons2,0.5<=fire<=1];
cons1=[cons1,0<=wind(:,1)<=windRatio_winter'];
cons2=[cons2,0<=wind(:,2)<=windRatio_summer'];
cons1=[cons1,0<=solar(:,1)<=solarRatio_winter'];
cons2=[cons2,0<=solar(:,2)<=solarRatio_summer'];

%机组爬坡约束
%火电爬坡速率为20%额定容量每小时，而调度决策步长为15分钟，因此爬坡约束应写为5%额定容量每15分钟（每1个点）
cons1=[cons1,-0.05<=[fire(96,:);fire(1:95,:)]-fire<=0.05];
cons1=[cons1,-0.125<=[hydro(96,:);hydro(1:95,:)]-hydro<=0.125];

cons2=[cons2,-0.05<=[fire(96,:);fire(1:95,:)]-fire<=0.05];
cons2=[cons2,-0.125<=[hydro(96,:);hydro(1:95,:)]-hydro<=0.125];

%% 求解
options = sdpsettings('solver','gurobi');
key1 = optimize(cons1,objective1,options);
E1=value(sum(fire(:,1))*fire_all*e);
total_cost1=value(objective1);

fire_power1=value(fire(:,1).*fire_all);
hydro_power1=value(hydro(:,1).*hydro_all);
wind_power1=value(wind(:,1).*wind_all);
solar_power1=value(solar(:,1).*solar_all);

options = sdpsettings('solver','gurobi');
key2 = optimize(cons2,objective2,options);
E2=value(sum(fire(:,2))*fire_all*e);
total_cost2=value(objective2);

fire_power2=value(fire(:,2).*fire_all);
hydro_power2=value(hydro(:,2).*hydro_all);
wind_power2=value(wind(:,2).*wind_all);
solar_power2=value(solar(:,2).*solar_all);

% 显示结果
fprintf('\n冬季-总发电成本为：%.2f元',total_cost1)
fprintf('\n冬季-碳排放总量为：%.2f万吨\n',E1)

fprintf('\n夏季-总发电成本为：%.2f元',total_cost2)
fprintf('\n夏季-碳排放总量为：%.2f万吨\n',E2)

%% 结果可视化
figure(1)
t=1:96;

subplot(2,1,1);
plot(t,value(hydro_power1./hydro_all),t,value(fire_power1./fire_all),t,value(wind_power1./wind_all),t,value(solar_power1./solar_all));
title('冬季出力曲线 (p.u.)'),xlabel('时间/点'),ylabel('出力'),legend('水电','火电','风电','光伏')

subplot(2,1,2);
plot(t,value(hydro_power2./hydro_all),t,value(fire_power2./fire_all),t,value(wind_power2./wind_all),t,value(solar_power2./solar_all));
title('夏季出力曲线 (p.u.)'),xlabel('时间/点'),ylabel('出力'),legend('水电','火电','风电','光伏')

figure(2)

Y1=[hydro_power1,fire_power1,wind_power1,solar_power1];
Y2=[hydro_power2,fire_power2,wind_power2,solar_power2];
x=t;

tiledlayout('flow')

ax1 = nexttile;
a1=area(ax1,x,Y1);
axis([1 96 0 3000]);
title('冬季总出力曲线'),xlabel('时间/点'),ylabel('总出力/万千瓦'),legend({'水电','火电','风电','光伏'})

ax2 = nexttile;
a2=area(ax2,x,Y2);
axis([1 96 0 3000]);
title('夏季总出力曲线'),xlabel('时间/点'),ylabel('总出力/万千瓦'),legend({'水电','火电','风电','光伏'})
