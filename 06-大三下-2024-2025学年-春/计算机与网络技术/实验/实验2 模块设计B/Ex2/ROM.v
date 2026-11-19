module ROM(clk,rst_n,q);
 input clk;
 input rst_n;
 output [15:0]q;
 wire [7:0]addr;
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