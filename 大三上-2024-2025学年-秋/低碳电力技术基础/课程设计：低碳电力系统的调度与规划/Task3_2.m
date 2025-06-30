clear;
clc;
load('load_and_renewable.mat');

times=2; % times表示负荷变化的倍率

demand=1500e5;  %发电需求量/万千瓦时
max_load=2400;  %最大负荷/万千瓦时
pollution=10000;  %碳达峰目标/万吨CO2
day_win=185;  %假设一年冬天典型日用负荷185天
day_sum=180;  %假设一年夏天典型日用负荷180天
day=[day_win;day_sum];
e=0.820e-3;  %火电碳排放强度（万tCO2/万瓦时）

%% 电源
%储能
storage_P=2000;  % 储能最大功率（万千瓦）
storage_E=8000;  % 储能最大能量（万千瓦时）

%水电
hydro_capacitor=[50;120;120;80;130;100];  %水电装机（万千瓦）
hydro_backup=[50;200;200;150;100];  %水电可建设容量（万千瓦）
hydro_construction=[25;200;220;180;80]*1e8;  %水电建设成本
hydro_max_time=3000*4;  %水电最大工作小时（时）

%火电
fire_capacitor=[200;200;200;170;170;170;150;150;130;130;130;100;100;60;60];  %火电装机（万千瓦）
fire_max_time=6200*4;  %火电最大工作小时（时）
%不考虑火电建设

%风电
wind_capacitor=[160];  %风电装机（万千瓦）
wind_backup=[60]; %风电可建设容量（万千瓦）
wind_construction=[40]*1e8; %风电建设成本
wind_max_time=2000*4; %风电最大工作小时（时）

%光伏
solar_capacitor=[240];  %光伏装机（万千瓦）
solar_backup=[90]; %光伏可建设容量（万千瓦）
solar_construction=[80]*1e8; %光伏建设成本
solar_max_time=2000*4; %光伏最大工作小时（时）

%核电
nuclear_all=130;  %核电可建设容量（万千瓦）
nuclear_construction=[130]*1e8; %核电建设成本
nuclear_max_time=8000*4; %核电最大工作小时（时）

%总装机
hydro_all=sum(hydro_capacitor);  %水电总装机（万瓦）
fire_all=fire_capacitor;  %火电总装机（万瓦）
wind_all=sum(wind_capacitor);  %风电总装机（万瓦）
solar_all=sum(solar_capacitor);  %光伏总装机（万瓦）

hydro=sdpvar(96,2);  %水电出力，从左到右为冬季出力、夏季出力
hydro_back_work=binvar(5,1,'full');  %代表是否建设新水电

fire=sdpvar(96,30);  %火电出力，从左到右为冬季出力、夏季出力
fire_if_work=binvar(96,30,'full');  %代表火电是否运作

wind=sdpvar(96,2);  %风电出力，从左到右为冬季出力、夏季出力
wind_back_work=intvar(1,1,'full');  %代表风电机组建设数量

solar=sdpvar(96,2);  %光伏出力，从左到右为冬季出力、夏季出力
solar_back_work=intvar(1,1,'full');  %代表光伏机组建设数量

nuclear=sdpvar(96,2);  %光伏出力，从左到右为冬季出力、夏季出力
if_nuclear=binvar(1,1,'full');  %表示是否投入核电

storage=sdpvar(96,2);  %储能出力，从左到右为冬季出力、夏季出力（正为储存能量，负为放出能量）
storage_e=sdpvar(96,2);  %储能存储能量

%发电成本
expense=[0.20;0.10;0.04;0.03;0.15]*1e4;  %五种发电开销，从左到右为火电、水电、风电、光伏、核电，单位（元/万千瓦时）

%% 约束
cons=[]; 

%目标函数：系统总运行成本最小化
objective=0.25*([sum(fire(:,1:15).*fire_if_work(:,1:15))*fire_all,sum(fire(:,16:30).*fire_if_work(:,16:30))*fire_all]*day*expense(1)...
        +sum(hydro)*day*(hydro_all+sum(hydro_backup.*hydro_back_work))*expense(2)+sum(hydro_construction.*hydro_back_work)...
        +sum(wind)*day*(wind_all+sum(wind_backup.*wind_back_work'))*expense(3)+sum(wind_construction.*wind_back_work')...
        +sum(solar)*day*(solar_all+sum(solar_backup.*solar_back_work'))*expense(4)+sum(solar_construction.*solar_back_work')...
        +sum(nuclear)*day*nuclear_all*expense(5)*if_nuclear+nuclear_construction*if_nuclear);

%系统功率平衡约束
cons=[cons,load_winter(1,:)'*times+storage(:,1)==hydro(:,1).*(hydro_all+sum(hydro_backup.*hydro_back_work))+fire(:,1:15).*fire_if_work(:,1:15)*fire_all+wind(:,1).*(wind_all+sum(wind_backup.*wind_back_work'))+solar(:,1).*(solar_all+sum(solar_backup.*solar_back_work'))+nuclear(:,1).*nuclear_all*if_nuclear];
cons=[cons,load_summer(1,:)'*times+storage(:,2)==hydro(:,2).*(hydro_all+sum(hydro_backup.*hydro_back_work))+fire(:,16:30).*fire_if_work(:,16:30)*fire_all+wind(:,2).*(wind_all+sum(wind_backup.*wind_back_work'))+solar(:,2).*(solar_all+sum(solar_backup.*solar_back_work'))+nuclear(:,2).*nuclear_all*if_nuclear];

%机组出力约束
cons=[cons,0<=hydro(:,1)<=0.6];
cons=[cons,0<=hydro(:,2)<=1];
cons=[cons,0.5<=fire<=1];
cons=[cons,0<=wind(:,1)<=windRatio_winter'];
cons=[cons,0<=wind(:,2)<=windRatio_summer'];
cons=[cons,0<=solar(:,1)<=solarRatio_winter'];
cons=[cons,0<=solar(:,2)<=solarRatio_summer'];
cons=[cons,0.9<=nuclear<=1];

%储能
cons=[cons,-storage_P<=storage<=storage_P];
cons=[cons,storage_e(1,:)==0.5*storage_E];
cons=[cons,storage_e(2:96,:)==storage_e(1:95,:)+storage(1:95,:)*0.25];
cons=[cons,storage_e(96,:)+storage(96,:)*0.25==storage_e(1,:)];  % 该条件使得一天结束时储存的能量和开始时相同，使该规划方法能连续运行
cons=[cons,0.1*storage_E<=storage_e<=0.9*storage_E];

cons=[cons,0<=wind_back_work<=120];
cons=[cons,0<=solar_back_work<=120];

% 风光装机占比大于50%
cons=[cons,wind_backup*wind_back_work>=300+sum(hydro_backup.*hydro_back_work)];  % 风电新增远大于水电新增
cons=[cons,solar_backup*solar_back_work>=10+wind_backup*wind_back_work];  % 光伏新增大于风电新增
cons=[cons,wind_all + solar_all + solar_backup*solar_back_work + wind_backup*wind_back_work >= hydro_all+sum(hydro_backup.*hydro_back_work) + sum(fire_all) + nuclear_all];

cons=[cons,sum(hydro)*day<=hydro_max_time];
cons=[cons,sum(fire(:,1:15).*fire_if_work(:,1:15))*day(1)+sum(fire(:,16:30).*fire_if_work(:,16:30))*day(2)<=fire_max_time];
cons=[cons,sum(wind)*day<=wind_max_time];
cons=[cons,sum(solar)*day<=solar_max_time];
cons=[cons,sum(nuclear)*day<=nuclear_max_time];

%机组爬坡约束
%火电爬坡速率为20%额定容量每小时，而调度决策步长为15分钟，因此爬坡约束应写为5%额定容量每15分钟（每1个点）
cons=[cons,-0.05<=[fire(96,:);fire(1:95,:)]-fire<=0.05];
cons=[cons,-0.125<=[hydro(96,:);hydro(1:95,:)]-hydro<=0.125];

%备用容量约束
cons=[cons,load_winter(1,:)'*0.1<=(0.6-hydro(:,1))*(hydro_all+sum(hydro_backup.*hydro_back_work))+(1-fire(:,1:15).*fire_if_work(:,1:15))*fire_all];
cons=[cons,load_summer(1,:)'*0.1<=(1-hydro(:,2))*(hydro_all+sum(hydro_backup.*hydro_back_work))+(1-fire(:,16:30).*fire_if_work(:,16:30))*fire_all];
cons=[cons,load_winter(1,:)'*0.1<=(hydro(:,1)-0)*(hydro_all+sum(hydro_backup.*hydro_back_work))+(fire(:,1:15)-0)*fire_all];
cons=[cons,load_summer(1,:)'*0.1<=(hydro(:,2)-0)*(hydro_all+sum(hydro_backup.*hydro_back_work))+(fire(:,16:30)-0)*fire_all];


%碳达峰约束
cons=[cons,[sum(fire(:,1:15).*fire_if_work(:,1:15))*fire_all,sum(fire(:,16:30).*fire_if_work(:,16:30))*fire_all]*day*e*0.25<=pollution];

%% 求解
options = sdpsettings('solver','gurobi');
key = optimize(cons,objective,options);
E=value([sum(fire(:,1:15).*fire_if_work(:,1:15))*fire_all,sum(fire(:,16:30).*fire_if_work(:,16:30))*fire_all]*day*e*0.25);
total_cost=value(objective);
construction_total_cost=value(0.25*(sum(hydro_construction.*hydro_back_work)+sum(wind_construction.*wind_back_work')...
                        +sum(solar_construction.*solar_back_work')+nuclear_construction*if_nuclear));

new_wind=wind_backup*value(wind_back_work);
new_solar=solar_backup*value(solar_back_work);

% 显示结果
fprintf('\n总发电成本为：%.2f元',total_cost)
fprintf('\n其中建设成本为：%.2f元',construction_total_cost)
fprintf('\n碳排放总量为：%.2f万吨',E)
fprintf('\n风光的新装机容量分别为：%.2f万千瓦,%.2f万千瓦\n',new_wind,new_solar)


%% 结果可视化
% figure(1)
% t=1:96;
% 
% subplot(2,1,1);
% plot(t,value(hydro(:,1)),t,value(fire(:,1)),t,value(wind(:,1)),t,value(solar(:,1)),t,value(nuclear(:,1).*if_nuclear));
% title('冬季出力曲线 (p.u.)'),legend('水电','火电','风电','光伏','核电')
% 
% subplot(2,1,2);
% plot(t,value(hydro(:,2)),t,value(fire(:,2)),t,value(wind(:,2)),t,value(solar(:,2)),t,value(nuclear(:,2).*if_nuclear));
% title('夏季出力曲线 (p.u.)'),legend('水电','火电','风电','光伏','核电')

% figure(1)
% t=1:96;
% plot(t,value(fire(:,1:15).*fire_if_work(:,1:15)))

figure(2)

hydro_power1=value(hydro(:,1).*hydro_all);
fire_power1=value(fire(:,1:15).*fire_if_work(:,1:15)*fire_all);
wind_power1=value(wind(:,1).*(wind_all+wind_backup*wind_back_work));
solar_power1=value(solar(:,1).*(solar_all+solar_backup*solar_back_work));
nuclear_power1=value(nuclear(:,1).*if_nuclear.*nuclear_all);
storage_power1=value(-storage(:,1));

hydro_power2=value(hydro(:,2).*hydro_all);
fire_power2=value(fire(:,16:30).*fire_if_work(:,16:30)*fire_all);
wind_power2=value(wind(:,2).*(wind_all+wind_backup*wind_back_work));
solar_power2=value(solar(:,2).*(solar_all+solar_backup*solar_back_work));
nuclear_power2=value(nuclear(:,2).*if_nuclear.*nuclear_all);
storage_power2=value(-storage(:,2));

Y1=[hydro_power1,fire_power1,wind_power1,solar_power1,nuclear_power1,storage_power1];
Y2=[hydro_power2,fire_power2,wind_power2,solar_power2,nuclear_power2,storage_power2];
x=1:96;

tiledlayout('flow')

ax1 = nexttile;
a1=area(ax1,x,Y1);
axis([1 96 0 6000]);
title('冬季总出力曲线'),xlabel('时间/点'),ylabel('总出力/万千瓦'),legend({'水电','火电','风电','光伏','核电','储能'})

ax2 = nexttile;
a2=area(ax2,x,Y2);
axis([1 96 0 6000]);
title('夏季总出力曲线'),xlabel('时间/点'),ylabel('总出力/万千瓦'),legend({'水电','火电','风电','光伏','核电','储能'})

% 储能可以更加充分地利用可再生能源