module ROM2(clk,rst_n,q);
 input clk;
 input rst_n;
 output [31:0]q;
 wire [7:0]addr;
 addrGen addrGen(
			.clk(clk),
			.rst_n(rst_n),
			.addr(addr)
			);
 cpurom2 cpu_rom_inst(
			.address(addr),
			.clock(clk),
			.q(q)
			);
endmodule