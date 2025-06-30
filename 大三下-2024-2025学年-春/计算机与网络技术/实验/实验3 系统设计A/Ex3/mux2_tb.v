`timescale 1ns/1ps
module mux2_tb;
 reg [7:0]d0;
 reg [7:0]d1;
 reg sel;
 wire [7:0]y;
initial begin
d0 = 1;
d1 = 2;
sel = 0;

#100 sel = 1;
#100;

end
  mux2 mux2(
				.d0(d0),
				.d1(d1),
				.sel(sel),
				.y(y)
				);
endmodule