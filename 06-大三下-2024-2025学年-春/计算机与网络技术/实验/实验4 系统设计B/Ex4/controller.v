module controller(Op,alucs,flagwrite,regwrite,selscrB,redges,memtoreg,wren);
 input [3:0]Op;
 output reg [2:0]alucs;
 output reg flagwrite;
 output reg regwrite;
 output reg selscrB;
 output reg redges;
 output reg memtoreg;
 output reg wren;
 always@(*) begin
  if(Op>=0 && Op<=6) begin
   regwrite=1;
	selscrB=0;
	redges=1;
	memtoreg=0;
	wren=0;
	alucs=Op[2:0];
	if(Op==2 || Op==3 || Op==5 || Op==6) begin
	 flagwrite=1;
	end
	else begin
	 flagwrite=0;
	end
  end
  else if(Op>=8 && Op<=10) begin
	regwrite=1;
	selscrB=1;
	redges=0;
	memtoreg=0;
	wren=0;
	alucs=Op[2:0];
	flagwrite=Op[1];
  end
  else if(Op==11) begin
   wren=0;
	regwrite=1;
	selscrB=1;
	redges=0;
	memtoreg=1;
	alucs=2;
	flagwrite=1;
  end
  else if(Op==12) begin
   wren=1;
	regwrite=0;
	selscrB=1;
	redges=0;
	memtoreg=1;
	alucs=2;
	flagwrite=1;
  end
  else begin
   wren=0;
	regwrite=0;
  end
 end
endmodule