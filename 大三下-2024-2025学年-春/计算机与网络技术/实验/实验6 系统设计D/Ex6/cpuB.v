module cpuB(Rs,Rt,Rd,selscrB,regdes,memtoreg,memData,imm,alucs,clk,rst_n,regwrite,flagwrite,s,zeroout);
 wire [7:0]scrA;
 wire [7:0]scrB;
 input [1:0]Rs;
 input [1:0]Rt;
 input [1:0]Rd;
 input [7:0]memData;
 input selscrB;
 input regdes;
 input memtoreg;
 input [7:0]imm;
 input regwrite;
 input [2:0]alucs;
 input clk;
 input rst_n;
 input flagwrite;
 wire [1:0]nd;
 wire [7:0]di;
 wire [7:0]q2;
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
 
 mux2 muxscrB(
              .d0(q2),
				  .d1(imm),
				  .sel(selscrB),
				  .y(scrB)
				  );
 mux1 muxnd(
            .d0(Rt),
				.d1(Rd),
				.sel(regdes),
				.y(nd)
				);
 mux2 muxdi(
              .d0(s),
				  .d1(memData),
				  .sel(memtoreg),
				  .y(di)
				  );
 regfile regfile(
                 .clk(clk),
					  .rst_n(rst_n),
					  .n1(Rs),
					  .n2(Rt),
					  .nd(nd),
					  .di(di),
					  .reg_we(regwrite),
					  .q1(scrA),
					  .q2(q2)
					  );
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