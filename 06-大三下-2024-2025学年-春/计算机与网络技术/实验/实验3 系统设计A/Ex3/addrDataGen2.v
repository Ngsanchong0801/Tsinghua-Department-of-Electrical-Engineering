module addrDataGen2(clk,rst_n,wren,aclr,addr,data);
 input clk;
 input rst_n;
 reg [1:0]count;
 output reg wren;
 output reg aclr;
 output reg[7:0] addr;
 output reg[31:0] data;
 reg state;
 
 initial begin 
  aclr=0;
  addr=0;
  wren=0;
  data=1;
  count=0;
 end
 
 always@(posedge clk or negedge rst_n)
 begin
  if(!rst_n) begin
   aclr=1;
	addr=0;
   wren=0;
   data=1;
	count=0;
  end
  else begin
   count=count+1;
	if(count>=3)begin
	 count=0;
	 aclr=0;
	 addr=addr+1;
	 data=data+1;
	 if(addr>10) begin
	  addr=0;
	 end
    if(data>15) begin
	  data=0;
	 end
	 wren=1-wren;
	end
  end
 end
 endmodule