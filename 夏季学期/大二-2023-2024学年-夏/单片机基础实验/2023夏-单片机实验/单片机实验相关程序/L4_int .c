#include "msp430.h"

void delay(unsigned int i)     //��ʱ����
{   unsigned int j;            //����ֲ�����
    for ( j=0; j<i; j++ );
}

void Blink( )                   //LED��
{    P2OUT &=~BIT2;
     delay(0x8000);
     P2OUT |= BIT2;
     delay(0x8000);
}

void Buzz( )            //�����캯���������ߵ͡���С�ʵ�
{ unsigned int i;
  for ( i=0; i<5; i++)
  {
      P2OUT &=~BIT4;        //��
      delay(0x100);         //���ʱ��
      P2OUT |=BIT4;;        //ͣ��
      delay(0xfff0);        //ͣ���ʱ��
  };

}

void main ( void )
{   WDTCTL = WDTPW + WDTHOLD;           //�رտ��Ź�

//��������P2.4��P2.2�����P2.2����LED��P2.4���ӷ�����
    P2SEL &=~(BIT2+BIT4);
    P2SEL2 &=~(BIT2+BIT4);
    P2OUT|=(BIT2+BIT4);                 //������������ĳ�ʼֵ
    P2DIR|=(BIT2+BIT4);

//�ж��������
    P1SEL &=~BIT5;
    P1SEL2 &=~BIT5;
    P1OUT |=BIT5;
    P1REN |=BIT5;
    P1DIR &=~BIT5;
    P1IES |= BIT5;
    P1IFG &=~BIT5;
    P1IE |= BIT5;		//���ж�����

    _EINT();                    //���ж�����

    for (;;)                    //��ѭ��������LED������ʾ��ִ����ѭ������
    {   Blink();    };
}

#pragma  vector=PORT1_VECTOR    //���ö˿�P1�ж�����
__interrupt  void pin_ISR( )    //�жϺ���
{  if ( ( P1IFG&BIT5)!=0 )      //�ж��жϾ��������ĸ�����
   {  Buzz();                   //�����������죬��ʾ��ִ���жϺ���
      P1IFG &=~BIT5;            //�����Ӧ���жϱ�־
   }
}

