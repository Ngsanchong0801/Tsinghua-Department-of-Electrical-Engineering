module EDA3_control(
    input clk,
    input [3:0] inputbottom,
    input ispressed,
    output reg [3:0] money1, money0, time1, time0,
    output reg enable
);

parameter [3:0] // 记录各按键
    num0=4'b0000, num1=4'b0001, num2=4'b0010, num3=4'b0011,
    num4=4'b0100, num5=4'b0101, num6=4'b0110, num7=4'b0111,
    num8=4'b1000, num9=4'b1001, key_start=4'b1010, key_zero=4'b1011,
    key_confirm=4'b1100, key_void=4'b1101;
	 
parameter s0=2'b00, s1=2'b01, s2=2'b10;

initial begin
    money0 <= 4'b0000;
    money1 <= 4'b0000;
    time0 <= 4'b0000;
    time0 <= 4'b0000;
    enable <= 0;
end

always @ (posedge clk) begin
 s1:begin
 enable<=1;
    if (ispressed) begin
        case (inputbottom)
            default: begin
                money1 <= money0;
                money0 <= inputbottom;
            end
            // 添加其他按键的处理逻辑
        endcase
    end
end

end

endmodule
