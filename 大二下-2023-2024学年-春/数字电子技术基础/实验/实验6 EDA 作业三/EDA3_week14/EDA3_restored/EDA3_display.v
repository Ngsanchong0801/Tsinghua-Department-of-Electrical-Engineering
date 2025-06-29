module EDA3_display (
  input clk,
  input [3:0] money1, money0, time1, time0,
  input enable, //是否亮起
  output reg OA, OB, OC, OD, OE, OF, OG, DIG0, DIG1, DIG2, DIG3
);

reg [1:0] count;

initial begin
  OA <= 1; OB <= 1; OC <= 1; OD <= 1; OE <= 1; OF <= 1; OG <= 1;
  DIG0 <= 1; DIG1 <= 1; DIG2 <= 1; DIG3 <= 1;
  count <= 0;
end

//定義顯示數字
task display_digit;
  input [3:0] digit;
  output reg [6:0] segments;
  begin
    case (digit)
      4'b0000: segments = 7'b1111110;
      4'b0001: segments = 7'b0110000;
      4'b0010: segments = 7'b1101101;
      4'b0011: segments = 7'b1111001;
      4'b0100: segments = 7'b0110011;
      4'b0101: segments = 7'b1011011;
      4'b0110: segments = 7'b1011111;
      4'b0111: segments = 7'b1110000;
      4'b1000: segments = 7'b1111111;
      4'b1001: segments = 7'b1111011;
      4'b1010: segments = 7'b1110111; // A
      4'b1011: segments = 7'b0011111; // b
      4'b1100: segments = 7'b1001110; // C
      4'b1101: segments = 7'b0111101; // d
      4'b1110: segments = 7'b1001111; // E
      4'b1111: segments = 7'b1000111; // F
      default: segments = 7'b1111110; // 默認顯示 0
    endcase
  end
endtask

always @(posedge clk) begin
  if (count >= 2'b11)
    count <= 0;
  else
    count <= count + 2'b01;

  if (enable) begin
    case (count)
      2'b00: begin // DIG0
        DIG3 <= 0; DIG2 <= 0; DIG1 <= 0; DIG0 <= 1;
        display_digit(time0, {OA, OB, OC, OD, OE, OF, OG});
      end
      2'b01: begin // DIG1
        DIG3 <= 0; DIG2 <= 0; DIG1 <= 1; DIG0 <= 0;
        display_digit(time1, {OA, OB, OC, OD, OE, OF, OG});
      end
      2'b10: begin // DIG2
        DIG3 <= 0; DIG2 <= 1; DIG1 <= 0; DIG0 <= 0;
        display_digit(money0, {OA, OB, OC, OD, OE, OF, OG});
      end
      2'b11: begin // DIG3
        DIG3 <= 1; DIG2 <= 0; DIG1 <= 0; DIG0 <= 0;
        display_digit(money1, {OA, OB, OC, OD, OE, OF, OG});
      end
    endcase
  end else begin
    DIG3 <= 0; DIG2 <= 0; DIG1 <= 0; DIG0 <= 0;
    {OA, OB, OC, OD, OE, OF, OG} <= 7'b0000000;
  end
end

endmodule
