`timescale 1ns/1ps
module alu_tb;
 reg[7:0] data_a,data_b;
 reg[2:0] cs;
 reg carry_in;
 wire[7:0]s;
 wire zero;
 wire carry_out;
 parameter AND =3'b000,
			  OR  =3'b001,
			  ADD =3'b010,
			  SUB =3'b011,
			  SLT =3'b100,
			  SUBC=3'b101,
			  ADDC=3'b110;
  initial begin
   data_a = 0;
	data_b = 0;
	cs = 0;
	carry_in = 0;
	#100 data_a = 8'h1f;
	     data_b = 8'hf1;
		  cs = AND;
	#100 cs = OR;
	#100 cs = ADD;
	#100;
  end
  alu alu(
         .data_a(data_a),
			.data_b(data_b),
			.s(s),
			.zero(zero),
			.cs(cs),
			.carry_in(carry_in),
			.carry_out(carry_out)
			);
endmodule