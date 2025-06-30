#include "msp430.h"
#define  Led_a   BIT0	//定义与LED连接的引脚
#define  Led_b   BIT5	
unsigned int  i;             	//定义延时用变量
int main ( void )
{   WDTCTL = WDTPW + WDTHOLD;   //关闭看门狗

//下面这段代码有示波器时用，无示波器时可不用
    P1SEL |=BIT0;       	//设置P1.0 输出ACLK时钟
    P1SEL2 &= ~BIT0;
    P1DIR |=BIT0;
    P1SEL |=BIT4;       	//设置P1.4 输出SMCLK时钟
    P1SEL2 &= ~BIT4;
    P1DIR |=BIT4;

    P2SEL &=~(Led_a+Led_b);	//设置引脚P2.0和P2.5为基本输入输出功能
    P2SEL2 &=~(Led_a+Led_b);
    P2OUT |=Led_a+Led_b;    	//设置引脚P2.0和P2.5输出的初值为1
    P2DIR |=Led_a+Led_b;     	//设置端口P2.0和P2.5为输出方向
    while (1)    		//主循环
    {   P2OUT ^=(Led_a+Led_b);    	//将P2.0和P2.5的值取反后输出
        for (i=0xFFF; i>0; i--); 	//延时
    }
}
