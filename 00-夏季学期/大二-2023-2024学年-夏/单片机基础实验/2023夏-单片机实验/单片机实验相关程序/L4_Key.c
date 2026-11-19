#include "msp430.h"
unsigned int number=0;        //记录响应按键次数
int main( void )
{  	WDTCTL = WDTPW + WDTHOLD;       //关闭看门狗
	P2SEL=0;			//置P2为基本I/O功能
  	P2SEL2=0;			//
  	P2OUT=0xFF;			//置P2输出的初值
  	P2DIR=0xFF;			//置P2为输出方向
    	P1SEL &= ~BIT2; 
    	P1SEL2 &= ~BIT2;
    	P1OUT |=BIT2;;
    	P1REN |=BIT2; 
    	P1DIR &=~BIT2;
    	P1IES |= BIT2;
    	P1IFG &=~BIT2; 
    	P1IE |= BIT2; 
   	_EINT();		//总中断允许
    	while(1){ };
}
      
#pragma  vector=PORT1_VECTOR  				
__interrupt void port_int(void)
{   	unsigned int i;
	if ( ( P1IFG&BIT2 )!=0 )
  	{   	number++;
		P2OUT=~number;	 
   	} 
    	P1IFG &=~BIT2; 

}

