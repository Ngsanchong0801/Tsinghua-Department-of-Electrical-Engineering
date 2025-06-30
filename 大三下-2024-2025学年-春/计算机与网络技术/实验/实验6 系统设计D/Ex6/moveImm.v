module moveImm(imm,immout);
 input [15:0]imm;
 output reg[31:0]immout;
 always@(*) begin
  immout[15:0]=imm;
  immout[31:16]=0;
 end
 endmodule