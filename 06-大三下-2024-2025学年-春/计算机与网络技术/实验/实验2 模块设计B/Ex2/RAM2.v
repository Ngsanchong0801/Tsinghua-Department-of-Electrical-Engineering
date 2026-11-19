module RAM2(clk,rst_n,q);
 input clk;
 input rst_n;
 output [31:0]q;
 wire aclr;
 wire wren;
 wire [31:0]data;
 wire [7:0]addr;
 
 addrDataGen2 addrDataGen2(
			.clk(clk),
			.rst_n(rst_n),
			.aclr(aclr),
			.wren(wren),
			.addr(addr),
			.data(data)
			);
 cpuram2 cpu_ram_inst2(
			.aclr(aclr),
			.wren(wren),
			.address(addr),
			.data(data),
			.clock(clk),
			.q(q)
			);
endmodule