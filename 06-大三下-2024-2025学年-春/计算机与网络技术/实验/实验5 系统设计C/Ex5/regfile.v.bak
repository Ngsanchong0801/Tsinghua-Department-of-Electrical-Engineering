module regfile(clk,rst_n,n1,n2,nd,di,reg_we,q1,q2);
 input clk;
 input rst_n;
 input [1:0]n1;
 input [1:0]n2;
 input [1:0]nd;
 input [7:0]di;
 input reg_we;
 output reg[7:0]q1;
 output reg[7:0]q2;
 reg[7:0] rf[3:0];
 
 initial begin
   rf[0] = 10;
	rf[1] = 11;
	rf[2] = 12;
	rf[3] = 13;
 end
 
 always@(posedge clk)
 begin
	if(rst_n ==1) begin
	 rf[0] = 0;
	 rf[1] = 0;
	 rf[2] = 0;
	 rf[3] = 0;
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