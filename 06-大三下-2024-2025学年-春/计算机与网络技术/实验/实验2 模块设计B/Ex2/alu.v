module alu(data_a,data_b,s,zero,cs,carry_in,carry_out);
 input[7:0] data_a,data_b;
 input[2:0] cs;
 input carry_in;
 output reg[7:0]s;
 output reg zero;
 output reg carry_out;
 always@(*) begin
  case(cs)
	3'b000: s = data_a & data_b;
	3'b001: s = data_a | data_b; 
	3'b010: if(data_a + data_b >= 9'b100000000) begin
				s = data_a + data_b;
				carry_out = 1;
			  end
			  else begin
				s = data_a + data_b;
				carry_out = 0;
			  end
	3'b011: if(data_a > data_b) begin
				s = data_a - data_b;
				carry_out = 1;
			  end
			  else begin
				s = data_a - data_b;
				carry_out = 0;
			  end
	3'b100: if(data_a < data_b) s = 1;
			  else s = 0;
	3'b101: if(data_a > data_b + 1 - carry_in) begin
				s = data_a - data_b - 1 + carry_in;
				carry_out = 1;
			  end
			  else begin
				s = data_a - data_b - 1 + carry_in;
				carry_out = 0;
			  end
	3'b110: if(data_a + data_b + carry_in >= 9'b100000000) begin
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