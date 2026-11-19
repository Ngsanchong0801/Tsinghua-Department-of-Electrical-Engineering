#include "msp430.h"
unsigned int L=0,M=0;        
int main ( void )
{   unsigned int i;       
    WDTCTL = WDTPW + WDTHOLD;   //关闭看门狗
    P2SEL &=~(BIT2+BIT5);
    P2SEL2 &=~(BIT2+BIT5);
    P2OUT |=BIT2+BIT5;
    P2DIR |=BIT2+BIT5;

    for (;;)    //主循环
    {   L=L+1;
        if (L>0x200) L=0;
        M=0x200-L;
        P2OUT &=~(BIT2+BIT5);
        for (i=0; i<L; i++);
        P2OUT |=(BIT2+BIT5);
        for (i=0; i<M; i++);
    };
}
