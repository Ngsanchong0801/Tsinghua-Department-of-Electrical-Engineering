module flag(clk,rst_n,flagwrite,flagin,flagout,zeroin,zeroout);
 input clk;
 input rst_n;
 input flagwrite;
 input flagin;
 input zeroin;
 output reg flagout;
 output reg zeroout; 
 always@(posedge clk or negedge rst_n) begin
  if(! rst_n) begin
   flagout=0;
  end
  else begin
   if(flagwrite) begin
	 flagout=flagin;
	end
	zeroout=zeroin;
  end
 end
 
endmodule