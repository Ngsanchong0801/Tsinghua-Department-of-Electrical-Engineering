module addrGen(clk,rst_n,addr);
 input clk;
 input rst_n;
 output reg[7:0]addr;
 always@(posedge clk)
 begin
  if (rst_n == 1)
  addr=0;
  else begin
   addr=addr+1;
   if (addr>255) begin
   addr=0;
   end
  end
 end
 endmodule