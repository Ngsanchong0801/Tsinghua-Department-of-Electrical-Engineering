// Copyright (C) 1991-2013 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 64-Bit"
// VERSION		"Version 13.0.0 Build 156 04/24/2013 SJ Full Version"
// CREATED		"Tue Nov 24 14:57:48 2015"

module fulladd(
	CI,
	B,
	A,
	CO,
	S
);


input wire	CI;
input wire	B;
input wire	A;
output wire	CO;
output wire	S;

wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;




assign	SYNTHESIZED_WIRE_11 = SYNTHESIZED_WIRE_19 & SYNTHESIZED_WIRE_20;

assign	SYNTHESIZED_WIRE_20 =  ~B;

assign	SYNTHESIZED_WIRE_21 =  ~A;

assign	SYNTHESIZED_WIRE_6 = CI & B & SYNTHESIZED_WIRE_21;

assign	S = ~(SYNTHESIZED_WIRE_3 | SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5 | SYNTHESIZED_WIRE_6);

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_20 & SYNTHESIZED_WIRE_21;

assign	SYNTHESIZED_WIRE_13 = SYNTHESIZED_WIRE_19 & SYNTHESIZED_WIRE_21;

assign	CO = ~(SYNTHESIZED_WIRE_11 | SYNTHESIZED_WIRE_12 | SYNTHESIZED_WIRE_13);

assign	SYNTHESIZED_WIRE_3 = CI & SYNTHESIZED_WIRE_20 & A;

assign	SYNTHESIZED_WIRE_5 = SYNTHESIZED_WIRE_19 & B & A;

assign	SYNTHESIZED_WIRE_4 = SYNTHESIZED_WIRE_19 & SYNTHESIZED_WIRE_20 & SYNTHESIZED_WIRE_21;

assign	SYNTHESIZED_WIRE_19 =  ~CI;


endmodule
