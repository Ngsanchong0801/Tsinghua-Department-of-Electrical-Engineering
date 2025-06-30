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
	rf[1] = 1;
	rf[2] = 2;
	rf[3] = 3;
 end
 
 always@(posedge clk)
 begin
	if(rst_n ==1) begin
	 rf[0] = 0;
	 rf[0] = 1;
	 rf[0] = 2;
	 rf[0] = 3;
	end
	else begin
    q1=rf[n1];
	 q2=rf[n2];
	 if(reg_we == 1) begin
	  rf[nd]=di;
	 end
	end
 end
 endmodule