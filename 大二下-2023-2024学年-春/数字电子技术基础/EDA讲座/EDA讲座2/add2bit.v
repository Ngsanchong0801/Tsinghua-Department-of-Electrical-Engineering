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
// CREATED		"Tue Nov 24 13:44:45 2015"

module add2bit(
	Cin,
	A,
	B,
	CO,
	S
);


input wire	Cin;
input wire	[1:0] A;
input wire	[1:0] B;
output wire	CO;
output wire	[1:0] S;

wire	SYNTHESIZED_WIRE_0;





fulladd	fa0_inst(
	.CI(Cin),
	.B(B[0]),
	.A(A[0]),
	.CO(SYNTHESIZED_WIRE_0),
	.S(S[0]));


fulladd	fa1_inst(
	.CI(SYNTHESIZED_WIRE_0),
	.B(B[1]),
	.A(A[1]),
	.CO(CO),
	.S(S[1]));


endmodule
