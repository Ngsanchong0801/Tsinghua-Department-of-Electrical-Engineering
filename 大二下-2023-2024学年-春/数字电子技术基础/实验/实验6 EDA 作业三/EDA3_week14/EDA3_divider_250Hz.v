module EDA3_divider_250Hz
(
    input clk,
    output reg clk_250Hz
);

reg [16:0] count = 17'b0; // 17位寬的二進制數字

always @ (posedge clk) begin // 上升沿改變
    if (count == 17'd99999) begin // 當計數器count達到99999+1時，將輸出時鐘信號clk_250Hz翻轉
        clk_250Hz <= ~clk_250Hz; // 半個周期,取反翻轉 50000000/200000=250
        count <= 0;
    end else begin
        count <= count + 1;
    end
end

endmodule
