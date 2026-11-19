#include "msp430.h"

void delay( unsigned int i)     //延时函数
{   unsigned int j;             //定义局部变量
    for (j=0;j<i;j++);
}

void Blink( )           //LED闪
{   unsigned int i;
    for (i=0;i<3;i++)
    { P2OUT &=~BIT2;
        delay(0x8000);
      P2OUT |=BIT2;
         delay(0x8000);
    };
}
void Buzz( )            //蜂鸣响
{   unsigned int i;
    for (i=0;i<3;i++)
    { P2OUT &= ~BIT4;
        delay(0x100);
      P2OUT |=BIT4;
        delay(0xff00);
    };
}
int    main ( void )
{       WDTCTL = WDTPW + WDTHOLD;       //关闭看门狗
//设置端口P2.2输出，控制LED；P2.4输出，控制蜂鸣器
    P2SEL &=~(BIT2+BIT4);
    P2SEL2&=~(BIT2+BIT4);
    P2OUT |= BIT2+BIT4;
    P2DIR |= BIT2+BIT4;

//设置端口P1.1允许中断
    P1SEL &=~BIT1;
    P1SEL2 &=~BIT1;
    P1REN |=BIT1;
    P1OUT |=BIT1;
    P1DIR &=~BIT1;
    P1IES |=BIT1;
    P1IFG &=~BIT1;
    P1IE |=BIT1;
    _EINT();

//P1.0输出时钟ACLK, P1.4输出时钟SMCLK
    P1SEL |=BIT0+BIT4;
    P1SEL2 &=~(BIT0+BIT4);
    P1DIR |=BIT0+BIT4;

    Blink();
    Buzz();

    for (;;)  //主循环
    {   LPM4;   //
        Blink();
    }
}

#pragma  vector=PORT1_VECTOR
__interrupt  void  port_ISR( )
{   Buzz();
    P1IFG&=~(BIT1);      //清中断标志
 //   LPM4_EXIT;
}

