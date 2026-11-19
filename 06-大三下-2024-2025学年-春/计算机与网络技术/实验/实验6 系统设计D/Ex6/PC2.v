module PC2(clk,rst_n,branch,jump,imm,pcout);
 input clk;
 input rst_n;
 input branch;
 input jump;
 input [15:0]imm;
 output reg[7:0]pcout;
 
 initial begin
  pcout=0;
 end
 
 always@(posedge clk or negedge rst_n) begin
  if (!rst_n)
  pcout=0;
  else begin
   if(jump) begin
    pcout=imm;
   end
   else if(branch) begin
    pcout=pcout+imm+1;
   end
   else if(pcout < 255) begin
	 pcout=pcout+1;
   end
   if (pcout>255) begin
    pcout=0;
   end
  end
 end
 endmodule