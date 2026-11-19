#include "msp430.h"
void UARTA0_init( );
char buffer[20],string[30]="Please input 7 characters:\r\n\0";
unsigned char j;
int  main ( void )
{   WDTCTL = WDTPW + WDTHOLD;       //关闭看门狗
//做实验时，如果有示波器
//可在P1.0、P1.4引脚输出时钟ACLK、SMCLK，以便观察时钟频率,修改波特率寄存器设置
//    P1SEL |= BIT0+BIT4;
//    P1SEL2 |=~( BIT0+BIT4);
//    P1DIR |= BIT0+BIT4;

   UARTA0_init( );               //初始化串口
    while(1)
    {   j=0;
        while(string[j]!='\0')      //输出提示信息
        {   while((IFG2&UCA0TXIFG)==0);     //检测发送缓冲是否空
                 UCA0TXBUF=string[j];       //取一个数据发送
        j++;
        };

        for (j=0; j<7; j++)          //接收字符串
        {   while((IFG2&UCA0RXIFG)==0);     //检测接收缓冲器是否满
                buffer[j]= UCA0RXBUF;       //接收一个数据并保存
        };

        for (j=0;j<7;j++)           //发送字符串
        {   while((IFG2&UCA0TXIFG)==0);     //检测发送缓冲是否空
                 UCA0TXBUF=buffer[j];       //取一个数据发送
        };
    };
}

void  UARTA0_init( )
{   UCA0CTL1|= UCSWRST;      //置软件复位位swrst为1
    P1SEL |= BIT1+BIT2;         	//置P1.1、P1.2为串行接口收、发引脚功能
    P1SEL2 |= BIT1+BIT2;        	//
//数据格式选用上电复位设置：无校验，8位数据，1个停止位，异步串行通信
    UCA0CTL1|=UCSSEL0+UCRXEIE; //波特率时钟选择上电复位时的ACLK，32.768KHz，对错均收
    UCA0BR0 =3;              //波特率9600
    UCA0BR1 = 0;
    UCA0MCTL=UCBRF_0+UCBRS_3;
    UCA0CTL1 &=~UCSWRST;        //置软件复位位swrst为0，串口设置完毕
}
