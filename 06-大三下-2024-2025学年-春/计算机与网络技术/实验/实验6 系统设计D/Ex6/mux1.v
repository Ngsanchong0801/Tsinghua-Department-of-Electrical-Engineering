module mux1(d0,d1,sel,y);
 input [1:0]d0;
 input [1:0]d1;
 input sel;
 output reg [1:0]y;
 always@(*) begin
  if(!sel) begin
   y=d0;
  end
  else begin
   y=d1;
  end
 end
endmodule