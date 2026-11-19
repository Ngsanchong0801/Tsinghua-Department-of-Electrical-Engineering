module regfile2(clk,rst_n,n1,n2,nd,di,reg_we,q1,q2);
 input clk;
 input rst_n;
 input [4:0]n1;
 input [4:0]n2;
 input [4:0]nd;
 input [31:0]di;
 input reg_we;
 output reg[31:0]q1;
 output reg[31:0]q2;
 reg[31:0] rf[31:0];
 
 initial begin
   rf[0] = 0;
   rf[16] = 0;
	rf[17] = 124;
	rf[18] = 236;
   rf[8] = 0;
	rf[11] = 13;
	rf[13] = 1;
 end
 
always@(*)
 begin
  q1=rf[n1];
  q2=rf[n2];
 end
 
 always@(posedge clk or negedge rst_n)
 begin
	if(!rst_n) begin
	 rf[0] = 0;
    rf[16] = 0;
	 rf[17] = 124;
	 rf[18] = 236;
    rf[8] = 0;
	 rf[11] = 13;
	 rf[13] = 1;
	end
	else begin
	 if(reg_we == 1) begin
	  rf[nd]=di;
	 end
	end
 end
 endmodule