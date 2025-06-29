`timescale 1ps/ 1ps
module EDA3_testbench();
reg clk;
reg [3:0]inputbottom;
reg ispressed;

wire [3:0] money1,money0,time1,time0;
wire enable;                          



EDA3_control EDA3_control (
	.clk(clk),                      
	.inputbottom(inputbottom),               
	.money1(money1),
	.money0(money0),
	.time1(time1),
	.time0(time0),       
	.ispressed(ispressed),     
	.enable(enable)
);	



initial begin
	clk=0;
	inputbottom=0;
	ispressed=0;
end

always 
#1 clk=!clk;//重複輸入時鐘信號


 /*num0=4'b0000,num1=4'b0001,num2=4'b0010,num3=4'b0011,num4=4'b0100,num5=4'b0101,num6=4'b0110,num7=4'b0111,num8=4'b1000,num9=4'b1001,
 key_start=4'b1010,//A
 key_zero=4'b1011,//b
 key_confirm=4'b1100,//c
 key_void=4'b1101;//d*/

initial begin
//10=5個周期
//#10 (+2或-2) 可控制輸出同一列的哪一個鍵
#100 inputbottom=4'b1010;ispressed=1;//開始
#20  inputbottom=4'b0000;ispressed=0;

#100 inputbottom=4'b0001;ispressed=1;//1
#20 inputbottom=4'b0000;ispressed=0;

#100 inputbottom=4'b0010;ispressed=1;//2
#20 inputbottom=4'b0000;ispressed=0;

#100 inputbottom=4'b0011;ispressed=1;//3
#20 inputbottom=4'b0000;ispressed=0;

#100 inputbottom=4'b1011;ispressed=1;//清零
#20 inputbottom=4'b0000;ispressed=0;

#100 inputbottom=4'b0011;ispressed=1;//3
#20 inputbottom=4'b0000;ispressed=0;

#100 inputbottom=4'b1100;ispressed=1;//確定
#20 inputbottom=4'b0000;ispressed=0;
#15000; //沒按鍵超過10s


end

endmodule
