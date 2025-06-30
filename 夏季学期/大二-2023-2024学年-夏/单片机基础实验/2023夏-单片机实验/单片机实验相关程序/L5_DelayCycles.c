#include "msp430.h"

#define  number  100            //�ɸ�����Ҫ���ı�ó�����С

void main( void )
{       
    WDTCTL = WDTPW + WDTHOLD;   // Stop watchdog timer to prevent time out reset

    P2DIR |=BIT0;               //���ϵ縴λ�����ϣ�����P2.0Ϊ���

    while(1)
    {   
	P2OUT|=BIT0;            //��P2.0Ϊ1
        __delay_cycles(number);

        P2OUT&=~BIT0;           //��P2.0Ϊ0
        __delay_cycles(number);
    }
}
