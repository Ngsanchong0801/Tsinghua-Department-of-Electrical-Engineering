module alu2(data_a,data_b,s,zero,cs,carry_in,carry_out);
 input[31:0] data_a,data_b;
 input[3:0] cs;
 input carry_in;
 output reg[31:0]s;
 output reg zero;
 output reg carry_out;
 always@(data_a or data_b or cs or carry_in) begin
  case(cs)
	4'b0000: s = data_a & data_b;
	4'b0001: s = data_a | data_b; 
	4'b0010: if(data_a + data_b > 4294967295) begin
			 	 s = data_a + data_b;
				 carry_out = 1;
			   end
			   else begin
				 s = data_a + data_b;
				 carry_out = 0;
			   end
	4'b0011: if(data_a > data_b) begin
				 s = data_a - data_b;
				 carry_out = 1;
			   end
			   else begin
				 s = data_a - data_b;
				 carry_out = 0;
			   end
	4'b0100: if(data_a < data_b) s = 1;
			   else s = 0;
	4'b0101: if(data_a > data_b + 1 - carry_in) begin
				 s = data_a - data_b - 1 + carry_in;
				 carry_out = 1;
			   end
			   else begin
				 s = data_a - data_b - 1 + carry_in;
				 carry_out = 0;
			   end
	4'b0110: if(data_a + data_b + carry_in > 4294967295) begin
				 s = data_a + data_b + carry_in;
				 carry_out = 1;
			   end
			   else begin
				 s = data_a + data_b + carry_in;
				 carry_out = 0;
			   end
  endcase
  if(s == 0) zero = 1;
  else zero = 0;
 end
endmodule