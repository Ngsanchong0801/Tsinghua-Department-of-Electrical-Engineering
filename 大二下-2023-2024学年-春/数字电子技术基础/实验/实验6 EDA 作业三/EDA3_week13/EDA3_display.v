module EDA3_display
(input clk,
 input money1,money0,time1,time0,
 input enable,
 
 output reg OA,OB,OC,OD,OE,OF,OG,DIG0,DIG1,DIG2,DIG3);
 
 wire [3:0] num;
 assign num = {money1,money0,time1,time0};
 
 reg count; //選擇輸出的數碼管
 reg OA1,OB1,OC1,OD1,OE1,OF1,OG1;//第1位的數碼管
 reg OA0,OB0,OC0,OD0,OE0,OF0,OG0;//第0位的數碼管
 

initial begin
OA<=1;OB<=1;OC<=1;OD<=1;OE<=1;OF<=1;OG<=1;
OA0<=1;OB0<=1;OC0<=1;OD0<=1;OE0<=1;OF0<=1;OG0<=0;
OA1<=1;OB1<=1;OC1<=1;OD1<=1;OE1<=1;OF1<=1;OG1<=0;
DIG2<=1;
DIG3<=1;
count <= 0;
end


always@(posedge clk) begin
 if (enable)begin
  case (num)
  4'b0000:begin
  OA1<=OA0;OB1<=OB0;OC1<=OC0;OD1<=OD0;OE1<=OE0;OF1<=OF0;OG1<=OG0;//先把第0位的數字放在第1位
  OA0<=1;OB0<=1;OC0<=1;OD0<=1;OE0<=1;OF0<=1;OG0<=0;//更新第0位
  end
  4'b0001:begin
  OA1<=OA0;OB1<=OB0;OC1<=OC0;OD1<=OD0;OE1<=OE0;OF1<=OF0;OG1<=OG0;
  OA0<=0;OB0<=1;OC0<=1;OD0<=0;OE0<=0;OF0<=0;OG0<=0;
  end
  4'b0010:begin
  OA1<=OA0;OB1<=OB0;OC1<=OC0;OD1<=OD0;OE1<=OE0;OF1<=OF0;OG1<=OG0;
  OA0<=1;OB0<=1;OC0<=0;OD0<=1;OE0<=1;OF0<=0;OG0<=1;
  end
  4'b0011:begin
  OA1<=OA0;OB1<=OB0;OC1<=OC0;OD1<=OD0;OE1<=OE0;OF1<=OF0;OG1<=OG0;
  OA0<=1;OB0<=1;OC0<=1;OD0<=1;OE0<=0;OF0<=0;OG0<=1;
  end
  4'b0100:begin
  OA1<=OA0;OB1<=OB0;OC1<=OC0;OD1<=OD0;OE1<=OE0;OF1<=OF0;OG1<=OG0;
  OA0<=0;OB0<=1;OC0<=1;OD0<=0;OE0<=0;OF0<=1;OG0<=1;
  end
  4'b0101:begin
  OA1<=OA0;OB1<=OB0;OC1<=OC0;OD1<=OD0;OE1<=OE0;OF1<=OF0;OG1<=OG0;
  OA0<=1;OB0<=0;OC0<=1;OD0<=1;OE0<=0;OF0<=1;OG0<=1;
  end
  4'b0110:begin
  OA1<=OA0;OB1<=OB0;OC1<=OC0;OD1<=OD0;OE1<=OE0;OF1<=OF0;OG1<=OG0;
  OA0<=1;OB0<=0;OC0<=1;OD0<=1;OE0<=1;OF0<=1;OG0<=1;
  end
  4'b0111:begin//7
  OA1<=OA0;OB1<=OB0;OC1<=OC0;OD1<=OD0;OE1<=OE0;OF1<=OF0;OG1<=OG0;
  OA0<=1;OB0<=1;OC0<=1;OD0<=0;OE0<=0;OF0<=0;OG0<=0;
  end
  4'b1000:begin
  OA1<=OA0;OB1<=OB0;OC1<=OC0;OD1<=OD0;OE1<=OE0;OF1<=OF0;OG1<=OG0;
  OA0<=1;OB0<=1;OC0<=1;OD0<=1;OE0<=1;OF0<=1;OG0<=1;
  end
  4'b1001:begin
  OA1<=OA0;OB1<=OB0;OC1<=OC0;OD1<=OD0;OE1<=OE0;OF1<=OF0;OG1<=OG0;
  OA0<=1;OB0<=1;OC0<=1;OD0<=1;OE0<=0;OF0<=1;OG0<=1;
  end
  4'b1010:begin//A
  OA1<=OA0;OB1<=OB0;OC1<=OC0;OD1<=OD0;OE1<=OE0;OF1<=OF0;OG1<=OG0;
  OA0<=1;OB0<=1;OC0<=1;OD0<=0;OE0<=1;OF0<=1;OG0<=1;
  end
  4'b1011:begin
  OA1<=OA0;OB1<=OB0;OC1<=OC0;OD1<=OD0;OE1<=OE0;OF1<=OF0;OG1<=OG0;
  OA0<=0;OB0<=0;OC0<=1;OD0<=1;OE0<=1;OF0<=1;OG0<=1;
  end
  4'b1100:begin
  OA1<=OA0;OB1<=OB0;OC1<=OC0;OD1<=OD0;OE1<=OE0;OF1<=OF0;OG1<=OG0;
  OA0<=1;OB0<=0;OC0<=0;OD0<=1;OE0<=1;OF0<=1;OG0<=0;
  end
  4'b1101:begin
  OA1<=OA0;OB1<=OB0;OC1<=OC0;OD1<=OD0;OE1<=OE0;OF1<=OF0;OG1<=OG0;
  OA0<=0;OB0<=1;OC0<=1;OD0<=1;OE0<=1;OF0<=0;OG0<=1;
  end
  4'b1110:begin
  OA1<=OA0;OB1<=OB0;OC1<=OC0;OD1<=OD0;OE1<=OE0;OF1<=OF0;OG1<=OG0;
  OA0<=1;OB0<=0;OC0<=0;OD0<=1;OE0<=1;OF0<=1;OG0<=1;
  end
  4'b1111:begin
  OA1<=OA0;OB1<=OB0;OC1<=OC0;OD1<=OD0;OE1<=OE0;OF1<=OF0;OG1<=OG0;
  OA0<=1;OB0<=0;OC0<=0;OD0<=0;OE0<=1;OF0<=1;OG0<=1;
  end
  endcase
  end
  
 else begin
    if(count==0)begin //輸出第0位數碼管
	   DIG2<=1;DIG3<=0;
		OA<=OA0;OB<=OB0;OC<=OC0;OD<=OD0;OE<=OE0;OF<=OF0;OG<=OG0;
		count<=1;
		end
		
	 else if(count==1)begin//輸出第1位數碼管
	   DIG2<=0;DIG3<=1;
		OA<=OA1;OB<=OB1;OC<=OC1;OD<=OD1;OE<=OE1;OF<=OF1;OG<=OG1;
		count<=0;
		end
		
	 else begin//輸出00
	   DIG3<=1;DIG2<=1;
		OA<=1;OB<=1;OC<=1;OD<=1;OE<=1;OF<=1;OG<=0;
		count<=0;
		end
    end
end
  
endmodule
	