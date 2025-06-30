`timescale 1ns/1ps
module cpuA_tb;
 reg[7:0] scrA,scrB;
 reg[2:0] alucs;
 reg clk;
 reg rst_n;
 reg flagwrite;
 wire[7:0]s;
 wire zeroout;
 parameter AND =3'b000,
			  OR  =3'b001,
			  ADD =3'b010,
			  SUB =3'b011,
			  SLT =3'b100,
			  SUBC=3'b101,
			  ADDC=3'b110;
  initial begin
   clk = 1;
   scrA = 0;
	scrB = 0;
	alucs = 0;
	flagwrite = 0;
	rst_n = 0;
	#20 rst_n=1;
	#20 alucs=2;
	    flagwrite=1;
	    scrA=22;
		 scrB=11;
	#20 scrB=250;
	#20 alucs=6;
	    scrB=33;
	#20 alucs=3;
	    scrB=11;
	#20 scrB=253;
	#20 alucs=5;
	    scrB=11;
	#20 scrB=10;
	#20 alucs=0;
	    flagwrite=0;
		 scrA=6;
		 scrB=5;
	#20 alucs=1;
	#20;
  end
  always #10 clk = ~clk;
  cpuA cpuA(
            .scrA(scrA),
				.scrB(scrB),
				.alucs(alucs),
				.clk(clk),
				.rst_n(rst_n),
				.flagwrite(flagwrite),
				.s(s),
				.zeroout(zeroout)
				);
endmodule