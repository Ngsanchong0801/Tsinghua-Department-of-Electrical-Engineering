#include "msp430.h"
#define  Led_a   BIT0	//������LED���ӵ�����
#define  Led_b   BIT5	
unsigned int  i;             	//������ʱ�ñ���
int main ( void )
{   WDTCTL = WDTPW + WDTHOLD;   //�رտ��Ź�

//������δ�����ʾ����ʱ�ã���ʾ����ʱ�ɲ���
    P1SEL |=BIT0;       	//����P1.0 ���ACLKʱ��
    P1SEL2 &= ~BIT0;
    P1DIR |=BIT0;
    P1SEL |=BIT4;       	//����P1.4 ���SMCLKʱ��
    P1SEL2 &= ~BIT4;
    P1DIR |=BIT4;

    P2SEL &=~(Led_a+Led_b);	//��������P2.0��P2.5Ϊ���������������
    P2SEL2 &=~(Led_a+Led_b);
    P2OUT |=Led_a+Led_b;    	//��������P2.0��P2.5����ĳ�ֵΪ1
    P2DIR |=Led_a+Led_b;     	//���ö˿�P2.0��P2.5Ϊ�������
    while (1)    		//��ѭ��
    {   P2OUT ^=(Led_a+Led_b);    	//��P2.0��P2.5��ֵȡ�������
        for (i=0xFFF; i>0; i--); 	//��ʱ
    }
}
