#include "msp430.h"
unsigned int j;             //����ȫ�ֱ���
int main ( void )
{   //unsigned int i;  		//����ֲ�����
    //register unsigned int i;  //����Ĵ����;ֲ�����
    WDTCTL = WDTPW + WDTHOLD;   //�رտ��Ź�
    P2SEL &=~(BIT2+BIT5);       //��������P2.2��P2.5Ϊ���������������
    P2SEL2 &=~(BIT2+BIT5);
    P2OUT |=BIT2+BIT5;          //��������P2.2��P2.5����ĳ�ֵΪ1
    P2DIR |=BIT2+BIT5;          //���ö˿�P2.2��P2.5Ϊ�������
    for (;;)    //��ѭ��
    {   P2OUT ^=(BIT2+BIT5);    //��P2.2��P2.5��ֵȡ�������
        for (i=0xFFFF; i>0; i--); //��ʱ
    };
}


