//可据练习的需要，灵活取消或保持各种方式变量i定义前的注释符，
//以便观察不容类型变量对程序执行的影响
#include "msp430.h"
unsigned int j;             //定义全局int型变量
//unsigned long i;             //定义全局long型变量
int main ( void )
{   //unsigned int i;  		//定义局部int型变量
    //unsigned long i;  	//定义局部long型变量
    //register unsigned int i;  //定义寄存器int型局部变量
    //register unsigned long i;  //定义寄存器long型局部变量
    WDTCTL = WDTPW + WDTHOLD;   //关闭看门狗
    P2SEL &=~(BIT2+BIT5);       //设置引脚P2.2和P2.5为基本输入输出功能
    P2SEL2 &=~(BIT2+BIT5);
    P2OUT |=BIT2+BIT5;          //设置引脚P2.2和P2.5输出的初值为1
    P2DIR |=BIT2+BIT5;          //设置端口P2.2和P2.5为输出方向
    for (;;)    //主循环
    {   P2OUT ^=(BIT2+BIT5);    //将P2.2和P2.5的值取反后输出
        for (i=0xFFFF; i>0; i--); //延时
    };
}