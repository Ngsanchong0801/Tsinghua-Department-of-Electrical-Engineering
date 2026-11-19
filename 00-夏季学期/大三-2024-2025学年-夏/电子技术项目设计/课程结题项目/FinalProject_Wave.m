%--------------------------------------------------------
% 产生基波和谐波分量数据
A = 4096/2-1; % 信号幅值
N = 200; % 一周期内数据点数
Ph = 0; % 初始相位

y1 = sin(Ph:2*pi/N:2*pi*(1-1/N)+Ph); % 基波

% 生成3次谐波分量
y3 = sin(Ph:6*pi/N:6*pi*(1-1/N)+Ph); % 3次谐波
SineData3 = ceil(0.8*A*y1 + 0.25*A*y3 + A);

% 生成5次谐波分量
y5 = sin(Ph:10*pi/N:10*pi*(1-1/N)+Ph); % 5次谐波
SineData5 = ceil(0.8*A*y1 + 0.25*A*y5 + A);

% 生成7次谐波分量
y7 = sin(Ph:14*pi/N:14*pi*(1-1/N)+Ph); % 7次谐波
SineData7 = ceil(0.8*A*y1 + 0.25*A*y7 + A);

% 生成9次谐波分量
y9 = sin(Ph:18*pi/N:18*pi*(1-1/N)+Ph); % 9次谐波
SineData9 = ceil(0.8*A*y1 + 0.25*A*y9 + A);

% 生成方波信号
SquareWave = ceil(A * sign(sin(Ph:2*pi/N:2*pi*(1-1/N)+Ph)) + A);

% 生成三角波信号
TriWave = ceil(A * sawtooth(Ph:2*pi/N:2*pi*(1-1/N)+Ph, 0.5) + A);

% 保存3次谐波数据到文件
Fid = fopen('SineWaveData_3rdHarmonic.txt','w');
fprintf(Fid, '%d,', SineData3);
fclose(Fid);

% 保存5次谐波数据到文件
Fid = fopen('SineWaveData_5thHarmonic.txt','w');
fprintf(Fid, '%d,', SineData5);
fclose(Fid);

% 保存7次谐波数据到文件
Fid = fopen('SineWaveData_7thHarmonic.txt','w');
fprintf(Fid, '%d,', SineData7);
fclose(Fid);

% 保存9次谐波数据到文件
Fid = fopen('SineWaveData_9thHarmonic.txt','w');
fprintf(Fid, '%d,', SineData9);
fclose(Fid);

% 保存方波信号数据到文件
Fid = fopen('SquareWaveData.txt','w');
fprintf(Fid, '%d,', SquareWave);
fclose(Fid);

% 保存三角波信号数据到文件
Fid = fopen('TriangleWaveData.txt','w');
fprintf(Fid, '%d,', TriWave);
fclose(Fid);

% 保存基波数据到文件
Fid = fopen('SineWaveData.txt','w');
fprintf(Fid, '%d,', SineData3);
fclose(Fid);
%--------------------------------------------------------
