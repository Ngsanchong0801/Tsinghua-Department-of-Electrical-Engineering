    function mpc=case9_2022010311
%CASE5  Power flow data for modified 5 bus, 5 gen case based on PJM 5-bus system
%   Please see CASEFORMAT for details on the case file format.
%
%   Based on data from ...
%     F.Li and R.Bo, "Small Test Systems for Power System Economic Studies",
%     Proceedings of the 2010 IEEE Power & Energy Society General Meeting

%   Created by Rui Bo in 2006, modified in 2010, 2014.
%   Distributed with permission.

%   MATPOWER

%% MATPOWER Case Format : Version 2
mpc.version = '2';

%%-----  Power Flow Data  -----%%
%% system MVA base
mpc.baseMVA = 100;

%% bus data
%	bus_i	type	Pd	Qd	Gs	Bs	area	Vm	Va	baseKV	zone	Vmax	Vmin
mpc.bus = [
    1	1	35	18	0	0	1	1	0	121	1	1.1	0.9;
    2	1	30	16	0	0	1	1	0	121	1	1.1	0.9;
    3	1	40	20	0	0	1	1	0	121	1	1.1	0.9;
    4	1	25	12	0	0	1	1	0	121	1	1.1	0.9;
    5	1	20	10	0	0	1	1	0	121	1	1.1	0.9;
    6	1	15	6	0	0	1	1	0	121	1	1.1	0.9;
    7	2	0	0	0	0	1	1.05	0	10.5	1	1.1	0.9;
    8	2	0	0	0	0	1	1.05	0	10.5	1	1.1	0.9;
    9	3	0	0	0	0	1	1.05	0	10.5	1	1.1	0.9;
    ];

%% generator data
%	bus	Pg	Qg	Qmax	Qmin	Vg	mBase	status	Pmax	Pmin	Pc1	Pc2	Qc1min	Qc1max	Qc2min	Qc2max	ramp_agc	ramp_10	ramp_30	ramp_q	apf
mpc.gen = [
    7	40	0	300	-300	1	100	1	200	10	0	0	0	0	0	0	0	0	0	0	0;
    8	45	0	300	-300	1	100	1	200	10	0	0	0	0	0	0	0	0	0	0	0;
    9	0	0	300	-300	1	100	1	200	10	0	0	0	0	0	0	0	0	0	0	0;
    ];

%% branch data
%	fbus	tbus	r	x	b	rateA	rateB	rateC	ratio	angle	status	angmin	angmax
mpc.branch = [
    5	2	0.0224	0.0683	0.00545	0	0	0	0	0	1	-360	360;
    4	1	0.0447	0.1366	0.0109	0	0	0	0	0	1	-360	360;
    6	1	0.0323	0.1208	0.0100	0	0	0	0	0	1	-360	360;
    5	3	0.0268	0.0820	0.0065	0	0	0	0	0	1	-360	360;
    6	3	0.0251	0.0939	0.0078	0	0	0	0	0	1	-360	360;
    4	2	0.0179	0.0546	0.0044	0	0	0	0	0	1	-360	360;
    7	4	0.0100	0.2100	-0.0075	0	0	0	1	0	1	-360	360;
    9	6	0.0064	0.1313	-0.0120	0	0	0	1	0	1	-360	360;
    8	5	0.0100	0.2100	-0.0075	0	0	0	1	0	1	-360	360;
    ];

%%-----  OPF Data  -----%%
%% generator cost data
%	1	startup	shutdown	n	x1	y1	...	xn	yn
%	2	startup	shutdown	n	c(n-1)	...	c0
% mpc.gencost = [
% 	2	0	0	2	14	0;
% 	2	0	0	2	15	0;
% 	2	0	0	2	30	0;
% 	2	0	0	2	40	0;
% 	2	0	0	2	10	0;
% ];
