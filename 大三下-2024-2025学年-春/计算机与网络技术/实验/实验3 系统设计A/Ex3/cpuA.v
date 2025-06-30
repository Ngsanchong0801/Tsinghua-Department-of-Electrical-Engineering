module cpuA(scrA,scrB,alucs,clk,rst_n,flagwrite,s,zeroout);
 input [7:0]scrA;
 input [7:0]scrB;
 input [2:0]alucs;
 input clk;
 input rst_n;
 input flagwrite;
 wire carry_out;
 wire carry_in;
 wire zeroin;
 output [7:0]s;
 output zeroout;
 always@(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
  end
  else begin
  end
 end
 alu alu(
         .data_a(scrA),
			.data_b(scrB),
			.s(s),
			.zero(zeroin),
			.cs(alucs),
			.carry_in(carry_in),
			.carry_out(carry_out)
			);
 flag flag(
           .clk(clk),
			  .rst_n(rst_n),
			  .zeroin(zeroin),
			  .flagwrite(flagwrite),
			  .flagin(carry_out),
			  .flagout(carry_in),
			  .zeroout(zeroout)
			  );
endmodule