#include "msp430.h"

void delay(unsigned int i)     //延时函数
{   unsigned int j;            //定义局部变量
    for ( j=0; j<i; j++ );
}

void Blink( )                   //LED闪
{    P2OUT &=~BIT2;
     delay(0x8000);
     P2OUT |= BIT2;
     delay(0x8000);
}

void Buzz( )            //蜂鸣响函数，声音高低、大小适当
{ unsigned int i;
  for ( i=0; i<5; i++)
  {
      P2OUT &=~BIT4;        //响
      delay(0x100);         //响的时长
      P2OUT |=BIT4;;        //停响
      delay(0xfff0);        //停响的时长
  };

}

void main ( void )
{   WDTCTL = WDTPW + WDTHOLD;           //关闭看门狗

//设置引脚P2.4、P2.2输出，P2.2连接LED，P2.4连接蜂鸣器
    P2SEL &=~(BIT2+BIT4);
    P2SEL2 &=~(BIT2+BIT4);
    P2OUT|=(BIT2+BIT4);                 //设置引脚输出的初始值
    P2DIR|=(BIT2+BIT4);

//中断相关设置
    P1SEL &=~BIT5;
    P1SEL2 &=~BIT5;
    P1OUT |=BIT5;
    P1REN |=BIT5;
    P1DIR &=~BIT5;
    P1IES |= BIT5;
    P1IFG &=~BIT5;
    P1IE |= BIT5;		//分中断允许

    _EINT();                    //总中断允许

    for (;;)                    //主循环，看到LED闪，表示在执行主循环部分
    {   Blink();    };
}

#pragma  vector=PORT1_VECTOR    //设置端口P1中断向量
__interrupt  void pin_ISR( )    //中断函数
{  if ( ( P1IFG&BIT5)!=0 )      //判断中断具体来自哪个引脚
   {  Buzz();                   //听到蜂鸣器响，表示在执行中断函数
      P1IFG &=~BIT5;            //清除对应的中断标志
   }
}

