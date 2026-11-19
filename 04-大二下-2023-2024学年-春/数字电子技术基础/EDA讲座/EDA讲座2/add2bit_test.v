`timescale 10ns / 1ns  
module add2bit_test; 
  
 reg[2:0] a_in, b_in; 
 reg   op_in; 
  
 wire[1:0] result_out; 
 wire      carry_out; 

 add2bit eda2(.A(a_in[1:0]), .B(b_in[1:0]), .Cin(op_in), 
          .S(result_out), .CO(carry_out)); 
 
 reg[2:0] get, expected; 
 reg   has_error; 
  
 initial begin 
  has_error = 1'b0; 
 
//  op_in = 1'b1; 		// test addition 

  op_in = 1'b0;		// test addition
   
  for (a_in = 2'b0; a_in != 4; a_in = a_in + 1) 
      for (b_in = 2'b0; b_in != 4; b_in = b_in + 1) begin 
       #1; 
       get = {carry_out, result_out}; 
       expected = a_in + b_in; 
       if (get !== expected) begin 
        $display("a_in = %d, b_in = %d, expected %d, get %d", 
                 a_in, b_in, expected, get); 
        has_error = 1'b1; 
       end 
      end 
      
  // ... 
  if (has_error === 1'b0) begin 
   $display("ALL TESTS PASSED!"); 
  end 
  // $finish; 
 end 
endmodule 