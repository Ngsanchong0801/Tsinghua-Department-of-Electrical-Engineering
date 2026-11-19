#include "msp430.h"

#define  number  100            //可根据需要，改变该常数大小

void main( void )
{       
    WDTCTL = WDTPW + WDTHOLD;   // Stop watchdog timer to prevent time out reset

    P2DIR |=BIT0;               //在上电复位基础上，设置P2.0为输出

    while(1)
    {   
	P2OUT|=BIT0;            //置P2.0为1
        __delay_cycles(number);

        P2OUT&=~BIT0;           //置P2.0为0
        __delay_cycles(number);
    }
}
