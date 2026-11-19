module EDA3_control
(
    input clk,
    input [3:0] inputbottom,
    input ispressed,
    output reg [3:0] money1, money0, time1, time0,
    output reg enable                          // 是否亮起
);

reg [1:0] state;
reg [5:0] timer; // 顯示的時間
reg [11:0] count10s; // 倒數10s,回到初始狀態
reg [13:0] charge_time; // 充电倒計時
reg charge_start; // 是否開始充電
reg charge_end; // 是否結束充電

reg posclk = 0; // 判斷上升沿

parameter // 對應初始狀態、投币狀態、計時狀態
s0 = 2'b00, s1 = 2'b01, s2 = 2'b10;

parameter // 對應開始鍵、清零鍵、確定鍵
key_start = 4'b1010, key_clear = 4'b1011, key_confirm = 4'b1100;

initial begin 
    state <= s0;
    money1 <= 4'b0000; money0 <= 4'b0000; time1 <= 4'b0000; time0 <= 4'b0000;
    enable <= 0;
    count10s <= 0;
    charge_time <= 0;
    charge_start <= 0;
end

always @(posedge clk) begin // 輸出方程
    case (state)
        s0: begin // 初始狀態
            enable <= 0; // 數碼管全滅
            count10s <= 0;
            charge_time <= 0;
        end

        s1: begin // 投币狀態
            posclk <= ispressed;
            enable <= 1; // 數碼管亮起

            if (posclk == 0 && ispressed == 1) begin
                count10s <= 0;
                case (inputbottom)
                    key_clear: begin // 按下清零
                        money1 <= 4'b0000; money0 <= 4'b0000; time1 <= 4'b0000; time0 <= 4'b0000;
                        count10s <= 0;
                    end

                    key_confirm: begin // 按下確定
                        count10s <= 0;
                        charge_start <= 1;
                    end 

                    key_start: count10s <= 0;

                    default: begin // 按下数字键
                        if ((money0 * 10 + inputbottom) > 20) begin // 数额 > 20，显示 2040
                            money1 <= 4'b0010; // 十位数设置为 2
                            money0 <= 4'b0000; // 个位数设置为 0
                            time1 <= 4'b0100;  // 时间的十位数设置为 4
                            time0 <= 4'b0000;  // 时间的个位数设置为 0
                        end else begin
                            if (inputbottom <= 4'b0100) begin // 如果輸入數字 <= 4
                                time1 <= money0 * 2;
                                time0 <= inputbottom * 2;
                            end else begin // 如果輸入數字 > 4
                                time1 <= money0 * 2 + 4'b0001;
                                time0 <= inputbottom * 2 - 10;
                            end

                            // 存入數字在個位和十位
                            money1 <= money0;
                            money0 <= inputbottom;
                        end
                    end
                endcase
            end else begin // 沒有按鍵按下
                timer <= 2 * (money1 * 10 + money0);
                charge_time <= timer * 250;
                if (money1 == 0 && money0 == 0 && time1 == 0 && time0 == 0)
                    count10s <= count10s + 1; // 計時10s
                else ;
            end
        end

        s2: begin // 充電狀態
            enable <= 1;
            count10s <= 0;

            if (charge_start) begin
                if (charge_time >= 250) begin
                    charge_time <= charge_time - 4'b0001; // 開始計時
                    time1 <= (charge_time / 250) / 10; // 250為一秒
                    time0 <= (charge_time / 250) - time1 * 10;
                end else begin
                    charge_start <= 0;
                    money1 <= 0;
                    money0 <= 0;
                    time1 <= 0;
                    time0 <= 0;
                end
            end else begin
                money1 <= 0;
                money0 <= 0;
                time1 <= 0;
                time0 <= 0;
            end
        end

        default: begin
            enable <= 1;
            money1 <= 4'b0000; money0 <= 4'b0000; time1 <= 4'b0000; time0 <= 4'b0000;
            count10s <= 0; charge_time <= 0;
        end
    endcase
end

// 對應s0初始狀態、s1投币狀態、s2計時狀態
always @(posedge clk) begin // 狀態方程
    case (state)
        s0: begin
            if (ispressed) begin
                if (inputbottom == key_start) state <= s1; // 按下開始鍵進入s1
                else ;
            end else state <= s0;
        end

        s1: begin
            if (count10s >= 2500) // 不操作10s回到s0
                state <= s0;
            else ;

            if (ispressed) begin
                case (inputbottom)
                    key_clear: ;
                    key_confirm: state <= s2; // 按下確定鍵進入s2
                    default: state <= s1;
                endcase
            end else ;
        end

        s2: begin
            if (charge_start == 0) begin
                state <= s1; // 充電結束回到s1
            end else state <= s2;
        end

        default: state <= s0;
    endcase
end

endmodule
