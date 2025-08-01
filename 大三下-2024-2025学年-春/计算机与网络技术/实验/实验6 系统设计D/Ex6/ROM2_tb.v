`timescale 1ns/1ps
 module ROM2_tb;
  reg clk;
  reg rst_n;
  wire [7:0]addr;
  wire [31:0]q;
  initial begin
   clk = 0;
	rst_n = 0;
	#10.1
	rst_n = 1;
	#50.1
	rst_n = 0;
  end
  always #10 clk = ~clk;
  ROM2 ROM2(
			.clk(clk),
			.rst_n(rst_n),
			.q(q)
			);
  addrGen addrGen(
			.clk(clk),
			.rst_n(rst_n),
			.addr(addr)
			);
endmodule