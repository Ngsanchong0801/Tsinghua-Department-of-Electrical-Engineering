module controller22(Op,zero,funct,alucs,flagwrite,regwrite,selscrB,redges,memtoreg,wren,branch,jump);
 input [5:0]Op;
 input zero;
 input [5:0]funct; //多了个输入funct
 output reg [4:0]alucs;
 output reg flagwrite;
 output reg regwrite;
 output reg selscrB;
 output reg redges;
 output reg memtoreg;
 output reg wren;
 output reg branch;
 output reg jump;

 initial begin
   wren=0;
	regwrite=0;
	branch=0;
	jump=0;
 end
 
 always@(*) begin
  if(Op==0) begin //Op=0表示R-Type
   regwrite=1;
	selscrB=0;
	redges=1;
	memtoreg=0;
	wren=0;
	branch=0;
	jump=0;
	if(funct==32) begin //R-add
	 flagwrite=1;
	 alucs=2;
	end
	else if(funct==34) begin  //R-sub
	 flagwrite=1;
	 alucs=3;
	end
	else if(funct==42) begin  //R-sel
	 flagwrite=1;
	 alucs=4;
	end
	else begin
	 flagwrite=0;
	 alucs=0;
	end
  end
  else if(Op==8) begin  //I-add
	regwrite=1;
	selscrB=1;
	redges=0;
	memtoreg=0;
	wren=0;
	alucs=2;
	flagwrite=1;
	branch=0;
	jump=0;
  end
  else if(Op==9) begin  //I-add-unsign
	regwrite=1;
	selscrB=1;
	redges=0;
	memtoreg=0;
	wren=0;
	alucs=2;
	flagwrite=1;
	branch=0;
	jump=0;
  end
  else if(Op==12) begin  //I-and-unsign
	regwrite=1;
	selscrB=1;
	redges=0;
	memtoreg=0;
	wren=0;
	alucs=0;
	flagwrite=1;
	branch=0;
	jump=0;
  end
  else if(Op==4) begin  //BEQ相等时跳转
   wren=0;
	regwrite=0;
	selscrB=0;
	redges=0;
	memtoreg=0;
	alucs=3;
	flagwrite=0;
	jump=0;
	if(zero==1) begin
	 branch=1;
	end
	else begin
	 branch=0;
	end
  end
  else if(Op==5) begin  //BNE不等时跳转
   wren=0;
	regwrite=0;
	selscrB=0;
	redges=0;
	memtoreg=0;
	alucs=3;
	flagwrite=0;
	jump=0;
	if(zero==1) begin
	 branch=0;
	end
	else begin
	 branch=1;
	end
  end
  else if(Op==2) begin  //跳转
   wren=0;
	regwrite=0;
	selscrB=0;
	redges=0;
	memtoreg=0;
	alucs=2;
	flagwrite=0;
	branch=0;
	jump=1;
  end
  else begin
   wren=0;
	regwrite=0;
	branch=0;
	jump=0;
  end
 end
endmodule