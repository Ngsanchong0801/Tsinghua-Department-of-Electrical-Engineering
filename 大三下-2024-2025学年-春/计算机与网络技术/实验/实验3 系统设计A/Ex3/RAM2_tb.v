`timescale 1ns/1ps
 module RAM2_tb;
  reg clk;
  reg rst_n;
  wire aclr;
  wire [7:0]addr;
  wire [31:0]data;
  wire wren;
  wire [31:0]q;
  initial begin
   clk = 0;
	rst_n = 1;
	#10.1
	rst_n = 0;
	#50.1
	rst_n = 1;
  end
  always #10 clk = ~clk;
 
 RAM2 RAM2(
			.rst_n(rst_n),
			.clk(clk),
			.q(q)
			);
 addrDataGen2 addrDataGen2(
			.clk(clk),
			.rst_n(rst_n),
			.aclr(aclr),
			.wren(wren),
			.addr(addr),
			.data(data)
			);
endmodule