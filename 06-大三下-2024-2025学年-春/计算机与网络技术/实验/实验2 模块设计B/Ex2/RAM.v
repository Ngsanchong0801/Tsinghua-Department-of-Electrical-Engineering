module RAM(clk,rst_n,q);
 input clk;
 input rst_n;
 output [7:0]q;
 wire aclr;
 wire wren;
 wire [7:0]data;
 wire [7:0]addr;
 
 addrDataGen addrDataGen(
			.clk(clk),
			.rst_n(rst_n),
			.aclr(aclr),
			.wren(wren),
			.addr(addr),
			.data(data)
			);
 cpuram cpu_ram_inst(
			.aclr(aclr),
			.wren(wren),
			.address(addr),
			.data(data),
			.clock(clk),
			.q(q)
			);
endmodule