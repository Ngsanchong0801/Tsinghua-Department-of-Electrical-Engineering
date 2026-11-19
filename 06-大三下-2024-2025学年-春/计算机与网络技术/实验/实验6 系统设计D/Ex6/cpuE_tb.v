`timescale 1ns/1ps
 module cpuE_tb;
  reg clk;
  reg rst_n;
  reg aclr;
  wire [7:0]s;
  wire zeroout;
  initial begin
   aclr=0;
   clk=1;
	rst_n=0;
	#20 rst_n=1;
  end
  always #10 clk = ~clk;
  cpuE cpuE(
            .aclr(aclr),
				.clk(clk),
				.rst_n(rst_n),
				.s(s),
				.zeroout(zeroout)
				);
endmodule