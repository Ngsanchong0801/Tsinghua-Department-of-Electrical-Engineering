`timescale 1ns/1ps
module cpuB_tb;
 reg [1:0]Rs;
 reg [1:0]Rt;
 reg [1:0]Rd;
 reg [7:0]memData;
 reg selscrB;
 reg regdes;
 reg memtoreg;
 reg [7:0]imm;
 reg regwrite;
 reg [2:0]alucs;
 reg clk;
 reg rst_n;
 reg flagwrite;
 wire [7:0]s;
 wire zeroout;
 parameter AND =3'b000,
			  OR  =3'b001,
			  ADD =3'b010,
			  SUB =3'b011,
			  SLT =3'b100,
			  SUBC=3'b101,
			  ADDC=3'b110;
  initial begin
   clk=1;
	rst_n=1;
   Rs=0;
	Rt=0;
	Rd=0;
	memData=0;
	selscrB=0;
	regdes=0;
	memtoreg=0;
	imm=0;
	regwrite=0;
	alucs=0;
	#20 rst_n=0;
	#20 rst_n=1;
	#20 alucs=0;
	    flagwrite=0;
		 Rs=0;
		 Rt=1;
		 Rd=2;
		 memtoreg=0;
		 regdes=1;
		 selscrB=0;
		 regwrite=1;
	#20 alucs=1;
	    flagwrite=0;
		 Rs=0;
		 Rt=1;
		 Rd=3;
		 memtoreg=0;
		 regdes=1;
		 selscrB=0;
		 regwrite=1;
	#20 alucs=2;
	    flagwrite=1;
		 Rs=2;
		 Rt=3;
		 Rd=2;
		 memtoreg=0;
		 regdes=1;
		 selscrB=0;
		 regwrite=1;
	#20 alucs=6;
	    flagwrite=1;
		 Rs=2;
		 Rt=3;
		 Rd=2;
		 memtoreg=0;
		 regdes=0;
		 selscrB=1;
		 imm=255;
		 regwrite=1;
	#20 alucs=6;
	    flagwrite=1;
		 Rs=2;
		 Rt=3;
		 Rd=2;
		 memtoreg=1;
		 memData=112;
		 regdes=0;
		 selscrB=0;
		 regwrite=1;
	#20 alucs=3;
	    flagwrite=1;
		 Rs=3;
		 Rt=0;
		 Rd=3;
		 memtoreg=0;
		 regdes=1;
		 selscrB=0;
		 regwrite=1;
	#20;
  end
  always #10 clk = ~clk;
  cpuB cpuB(
            .Rs(Rs),
				.Rt(Rt),
				.Rd(Rd),
				.selscrB(selscrB),
				.regdes(regdes),
				.memtoreg(memtoreg),
				.memData(memData),
				.imm(imm),
				.alucs(alucs),
				.clk(clk),
				.rst_n(rst_n),
				.regwrite(regwrite),
				.flagwrite(flagwrite),
				.s(s),
				.zeroout(zeroout)
				);
endmodule