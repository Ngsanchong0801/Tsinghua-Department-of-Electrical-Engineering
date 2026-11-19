module fsm3                                                      //ex6.2.3 P266
(	input	clk, A, reset,
	output reg  out);

	reg		[1:0] current_state,next_state;

	parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

	always @ (current_state or A ) begin
		case (current_state)
			S0:
				if (A) out = 1;
				else   out = 0;
			S1:
				if (A) out = 0;
				else   out = 0;
			S2:
				if (A) out = 0;
				else   out = 0;
			S3:
				if (A) out = 0;
				else   out = 1;
		endcase
	end

	always @ (posedge clk or posedge reset) begin
		if (reset)
			current_state <= S0;
		else
		   current_state <= next_state;
  end 
	
	always @ (current_state or A) 
	   begin
			case (current_state)
				S0:
					if (A)
						next_state <= S3;
					else
					   next_state <= S1;
				S1:
					if (A)
						next_state <= S0;
					else
						next_state <= S2;
				S2:
					if (A)
						next_state <= S1;
					else
						next_state <= S3;
				S3:
					if (A)
						next_state <= S2;
					else
						next_state <= S0;
			endcase
	   end

endmodule
