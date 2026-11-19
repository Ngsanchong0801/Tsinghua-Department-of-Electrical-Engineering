`timescale 1ns/1ps
 module cpuD_tb;
  reg clk;
  reg rst_n;
  reg [7:0]memData;
  wire [7:0]s;
  wire zeroout;
  initial begin
   memData=0;
   clk=1;
	rst_n=0;
	#20 rst_n=1;
  end
  always #10 clk = ~clk;
  cpuD cpuD(
            .memData(memData),
				.clk(clk),
				.rst_n(rst_n),
				.s(s),
				.zeroout(zeroout)
				);
endmodule