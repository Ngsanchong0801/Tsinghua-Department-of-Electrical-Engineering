`timescale 1 ps/ 1 ps
module EDA3_testbench();

reg clk;                       //時鐘信號
reg [3:0] col;               //列信號輸入
 
wire row0;                   //行信號輸出
wire row1;
wire row2;
wire row3;      
wire ispressed;             //按鈕按壓信號
wire [3:0] inputbottom;


EDA3_keyboard u1(
	.clk(clk),                      
	.column(col),               
	.row0(row0),
	.row1(row1),
	.row2(row2),
	.row3(row3),       
	.ispressed(ispressed),            
	.inputbottom(inputbottom)
);	

always #1 clk=!clk;//重複輸入時鐘信號


initial begin
	clk=0;
	col=4'hF;
end



initial begin
//10=5個周期
//#10 (+2或-2) 可控制輸出同一列的哪一個鍵
#8 col=4'b0111;//正常 

#100 col=4'b1111;
#100 col=4'b1011;
#50 col=4'b1111; //25個周期,在第16周期時跳變
#100;

#10 col=4'b0111;//防抖
#10 col=4'b1111;
#10 col=4'b0111;
#10 col=4'b1111;
#10 col=4'b0111;
#10 col=4'b1111;
#100

#100 col=4'b0111;//長按
#500 col=4'b1111;//在第16周期時跳變
#500;

end

endmodule
