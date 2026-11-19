`timescale 1ns/1ps
 module regfile_tb;
 reg clk;
 reg rst_n;
 reg [1:0]n1;
 reg [1:0]n2;
 reg [1:0]nd;
 reg [7:0]di;
 reg reg_we;
 wire[7:0]q1;
 wire[7:0]q2;
  initial begin
   clk = 0;
	rst_n = 0;
	n1 = 0;
	n2 = 0;
	nd = 0;
	di = 0;
	reg_we = 0;
	#100.1 rst_n = 1;
	#50 rst_n = 0;
	#100 nd = 0;
		  di = 11;
		  reg_we = 1;
	#100 nd = 0;
	     di = 12;
	#100 nd = 0;
	     di = 11;
  end
  always #10 clk = ~clk;
  regfile regfile(
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