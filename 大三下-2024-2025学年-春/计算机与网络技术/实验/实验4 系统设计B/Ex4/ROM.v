module ROM(clk,rst_n,Op,Rs,Rt,Rd,imm);
 input clk;
 input rst_n;
 output reg[3:0]Op;
 output reg[1:0]Rs;
 output reg[1:0]Rt;
 output reg[1:0]Rd;
 output reg[7:0]imm;
 wire [15:0]q;
 wire [7:0]addr;
 
 always@(*) begin
  Op=q[15:12];
  Rs=q[11:10];
  Rt=q[9:8];
  Rd=q[7:6];
  imm=q[7:0];
 end
 
 addrGen addrGen(
			.clk(clk),
			.rst_n(rst_n),
			.addr(addr)
			);
 cpurom cpu_rom_inst(
			.address(addr),
			.clock(clk),
			.q(q)
			);
endmodule