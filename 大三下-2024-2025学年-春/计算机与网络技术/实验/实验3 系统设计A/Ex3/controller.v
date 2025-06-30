module controller(Op,alucs,flagwrite,regwrite,selscrB,redges,memtoreg);
 input [3:0]Op;
 output reg [2:0]alucs;
 output reg flagwrite;
 output reg regwrite;
 output reg selscrB;
 output reg redges;
 output reg memtoreg;
 always@(*) begin
  if(Op>=0 && Op<=6) begin
   regwrite=1;
	selscrB=0;
	redges=1;
	memtoreg=0;
	alucs=Op[2:0];
	if(Op==2 || Op==3 || Op==5 || Op==6) begin
	 flagwrite=1;
	end
	else begin
	 flagwrite=0;
	end
  end
 end
endmodule