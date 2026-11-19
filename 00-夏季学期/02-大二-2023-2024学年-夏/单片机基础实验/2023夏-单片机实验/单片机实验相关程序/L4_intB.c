#include "msp430.h"

//定义蜂鸣器连接的引脚和端口
#define buzz_PSEL       P2SEL
#define buzz_PSEL2      P2SEL2
#define buzz_PDIR       P2DIR
#define buzz_POUT       P2OUT
#define buzz_Pin        BIT5

//定义控制蜂鸣器响的按键次数
#define num_Buzz    6

//定义中断相关的引脚和端口
#define key_PSEL        P1SEL
#define key_PSEL2       P1SEL2
#define key_POUT    P1OUT
#define key_PREN    P1REN
#define key_PDIR    P1DIR
#define key_PIES        P1IES
#define key_PIFG        P1IFG
#define key_PIE         P1IE
#define key_Pin         BIT4
#define key_Vector  PORT1_VECTOR

unsigned int num_Key=0;     //计数按键次数
unsigned int flag_Buzz=0;   //蜂鸣器响标志

void delay(unsigned int i)  //延时函数
{   unsigned int j;
    for ( j=0; j<i; j++ );
}

void Buzz( )            //蜂鸣响函数，声音高低、大小适当
{ unsigned int i;
  for ( i=0; i<3; i++)
  {
      buzz_POUT &=~buzz_Pin;        //响
      delay(0x100);               //响的时长
      buzz_POUT |=buzz_Pin;        //停响
      delay(0xfff0);         //停响的时长
  };
}

void main ( void )
{   WDTCTL = WDTPW + WDTHOLD;       //关闭看门狗

//初始化LED引脚，基本输出，初值LED灭
    P2SEL &=~BIT0;
    P2SEL2 &=~BIT0;
    P2OUT |=BIT0;
    P2DIR |=BIT0;

//初始化蜂鸣器引脚，基本输出，初值蜂鸣器不响
    buzz_PSEL &=~buzz_Pin;
    buzz_PSEL2 &=~buzz_Pin;
    buzz_POUT|=buzz_Pin;
    buzz_PDIR|=buzz_Pin;

//中断引脚的相关设置
    key_PSEL &=~key_Pin;
    key_PSEL2 &=~key_Pin;
    key_POUT |=key_Pin;
    key_PREN |=key_Pin;
    key_PDIR &=~key_Pin;
    key_PIES |= key_Pin;
    key_PIFG &=~key_Pin;
    key_PIE |= key_Pin;

    _EINT();    //总中断允许

    while (1)  //主循环
    {
        if (flag_Buzz==1)       //蜂鸣器响标志成立
            {   // flag_Buzz=0;        //清蜂鸣器响标志
                Buzz();                 //蜂鸣响
                flag_Buzz=0;            //清蜂鸣器响标志
            };
     }
}

#pragma  vector=key_Vector
__interrupt  void pin_ISR( )
{      num_Key++;                           //按键次数加1
       P2OUT^=BIT0;                     //LED变化一次
       if (num_Key==num_Buzz)           //蜂鸣响的条件到
            {  //Buzz( );                 //蜂鸣响;
               flag_Buzz=1;         //清蜂鸣器响标志
               num_Key=0;               //按键次数回零，重新计数
            };
        key_PIFG &=~key_Pin;            //清除中断标志
}
