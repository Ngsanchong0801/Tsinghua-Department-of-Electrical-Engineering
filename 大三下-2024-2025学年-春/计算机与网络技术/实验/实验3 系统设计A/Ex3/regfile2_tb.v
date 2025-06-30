`timescale 1ns/1ps
 module regfile2_tb;
 reg clk;
 reg rst_n;
 reg [4:0]n1;
 reg [4:0]n2;
 reg [4:0]nd;
 reg [31:0]di;
 reg reg_we;
 wire[31:0]q1;
 wire[31:0]q2;
  initial begin
   clk = 0;
	rst_n = 0;
	n1 = 0;
	n2 = 0;
	nd = 0;
	di = 0;
	reg_we = 0;
	#50.1 rst_n = 1;
	#50 rst_n = 0;
	#100 nd = 0;
		  di = 10;
		  reg_we = 1;
	#100 nd = 1;
		  di = 11;
		  reg_we = 1;
	#100 nd = 2;
		  di = 12;
		  reg_we = 1;
	#100 nd = 3;
		  di = 13;
		  reg_we = 1;
	#100 n1 = 1;
		  n2 = 2;
		  reg_we = 0;
	#100 n1 = 2;
	     n2 = 3;
  end
  always #10 clk = ~clk;
  regfile2 regfile2(
					  .clk(clk),
					  .rst_n(rst_n),
					  .n1(n1),
					  .n2(n2),
					  .nd(nd),
					  .di(di),
					  .reg_we(reg_we),
					  .q1(q1),
					  .q2(q2)
					  );
endmodule