module mux2(d0,d1,sel,y);
 input [7:0]d0;
 input [7:0]d1;
 input sel;
 output reg [7:0]y;
 always@(*) begin
  if(!sel) begin
   y=d0;
  end
  else begin
   y=d1;
  end
 end
endmodule