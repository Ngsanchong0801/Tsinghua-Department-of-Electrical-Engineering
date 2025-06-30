#include "msp430.h"
void main ( void )
{   
    WDTCTL = WDTPW + WDTHOLD;       //关闭看门狗

//初始化LED引脚，基本输出，初值LED灭
        ......

//设置基本时钟ACK八分频=32768/8=4096(上电复位ACLK来自外部晶振时钟)
        ......

//设置P1.0输出时钟ACLK
        ......

//中断引脚的相关设置
        ......

        _EINT();            //总中断允许

        while (1) { };      //主循环

}

unsigned int num_clk=0;     //计数时钟个数变量
#pragma  vector=PORT1_VECTOR
__interrupt  void port_ISR( )
{   num_clk++;              //中断次数加1，时钟个数加1
    if (num_clk==2048)      //半秒计数时钟个数到
   {    P2OUT^=BIT3;        //LED半秒变化一次: 亮半秒, 灭半秒
        num_clk=0;          //计数时钟个数清零
    }
        ......              //清除中断标志
}
