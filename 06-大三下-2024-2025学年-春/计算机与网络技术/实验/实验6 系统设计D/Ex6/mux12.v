module mux12(d0,d1,sel,y);
 input [4:0]d0;
 input [4:0]d1;
 input sel;
 output reg [4:0]y;
 always@(*) begin
  if(!sel) begin
   y=d0;
  end
  else begin
   y=d1;
  end
 end
endmodule