#include "msp430.h"
void delay( );
int main ( void )
{   			
    WDTCTL = WDTPW + WDTHOLD;   	//关闭看门狗
    P1DIR=0xff;       				//设置端口1为输出
    P1OUT=~P1OUT;   				//将端口1的值取反后输出
    delay( );  				//调用函数延时    
}
  
void delay( ) 			//延时函数
{   unsigned char j;		//注意不同类型变量的取值范围
    for (j=0;j<5;j++);  		  
}
