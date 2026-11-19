module EDA3_keyboard
(input clk,                        //時鐘信號
 input [3:0] column,               //列信號輸入
 
 output row0,row1,row2,row3,       //行信號輸出
 output reg ispressed,             //按鈕按壓信號
 output reg [3:0] inputbottom);    //按鈕序號信號

 reg[3:0]row;
 assign {row0,row1,row2,row3}=row;
 
 reg[3:0]nextstate;
 reg[3:0]pressed;
 reg hold;
 reg[3:0]temp;
 reg[3:0]count_0,count_1;
 
 parameter//列線
 sn=4'b1111, s0=4'b1110, s1=4'b1101, s2=4'b1011, s3=4'b0111;
	
 parameter [3:0]//記錄各按鈕
 num0=4'b0000,num1=4'b0001,num2=4'b0010,num3=4'b0011,num4=4'b0100,num5=4'b0101,num6=4'b0110,num7=4'b0111,num8=4'b1000,num9=4'b1001,
 key_start=4'b1010,//A
 key_zero=4'b1011,//b
 key_confirm=4'b1100,//c
 key_void=4'b1101;//d
 
 initial begin
 nextstate <= s0;
 end
 
 always @ (posedge clk) begin
	row <= nextstate;
	case(row)
	
	s0://掃瞄第一行(最底最右邊開始)
		case(column)
		s0:begin pressed[0] <= 1; temp <= key_void;end
		s1:begin pressed[0] <= 1; temp <= key_confirm;end
		s2:begin pressed[0] <= 1; temp <= key_zero;end
		s3:begin pressed[0] <= 1; temp <= key_start;end
		
		default: pressed[0] <= 0;//列信號不是上述值，即沒有按鈕被按下
		endcase
		
	s1://掃瞄第二行
		case(column)
		s0:begin pressed[1] <= 1; temp <= num0;end
		s1:begin pressed[1] <= 1; temp <= num9;end
		s2:begin pressed[1] <= 1; temp <= num8;end
		s3:begin pressed[1] <= 1; temp <= num7;end
		
		default: pressed[1] <= 0;//列信號不是上述值，即沒有按鈕被按下
		endcase
		
	s2://掃瞄第三行
		case(column)
		s0:begin pressed[2] <= 1; temp <= key_void;end
		s1:begin pressed[2] <= 1; temp <= num6;end
		s2:begin pressed[2] <= 1; temp <= num5;end
		s3:begin pressed[2] <= 1; temp <= num4;end
		
		default: pressed[2] <= 0;//列信號不是上述值，即沒有按鈕被按下
		endcase
			
	s3://掃瞄第四行
		case(column)
		s0:begin pressed[3] <= 1; temp <= key_void;end
		s1:begin pressed[3] <= 1; temp <= num3;end
		s2:begin pressed[3] <= 1; temp <= num2;end
		s3:begin pressed[3] <= 1; temp <= num1;end
		
		default: pressed[3] <= 0;//列信號不是上述值，即沒有按鈕被按下
		endcase
		
		endcase
		end

//狀態的循環遍歷	
always @ (row) begin
	case(row)
		s0:nextstate<=s1;
		s1:nextstate<=s2;
		s2:nextstate<=s3;
		s3:nextstate<=s0;
		default:nextstate<=s0;
	   endcase
end		
		
		
always@(posedge clk)begin
  if(pressed == 4'b0000)begin//沒有按下時
    count_0 <= count_0 + 1;
	 count_1 <= 0;
  end
  else begin//按下時
    count_0 <= 0;
	 count_1 <= count_1 + 1;
  end
end
		

always@(negedge clk) begin//防抖,防長按
  if(pressed == 4'b0000) begin 
  hold <= 0;
  ispressed <= 0;
  end
  
  else if(hold == 0 && count_1>=4'b1111)begin //16個時鐘周期,約6.4ms (1/250)*16
  hold <= 1;
  ispressed <= 1;
  inputbottom <= temp;//只記錄一次按下的按鈕(防長按)
  end
  
  else ispressed<=0;
  end
   endmodule
	