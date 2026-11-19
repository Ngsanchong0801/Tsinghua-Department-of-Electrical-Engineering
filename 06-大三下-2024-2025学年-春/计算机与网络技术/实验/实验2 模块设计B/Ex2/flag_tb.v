`timescale 1ns/1ps
module flag_tb;
 reg clk;
 reg rst_n;
 reg flagwrite;
 reg flagin;
 wire flagout;
initial begin
clk = 0;
rst_n = 0;
flagwrite = 0;
flagin = 0;
#50.1 rst_n = 1;
#100 flagin = 1;
#100 flagwrite = 1;
#100 flagwrite = 0;
flagin = 0;
end
  always #10 clk = ~clk;
  flag flag(
				.clk(clk),
				.rst_n(rst_n),
				.flagwrite(flagwrite),
				.flagin(flagin),
				.flagout(flagout)
				);
endmodule