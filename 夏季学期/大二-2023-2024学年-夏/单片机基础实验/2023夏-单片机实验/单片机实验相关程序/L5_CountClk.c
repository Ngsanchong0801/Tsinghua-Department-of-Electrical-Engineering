#include "msp430.h"
void main ( void )
{   
    WDTCTL = WDTPW + WDTHOLD;       //�رտ��Ź�

//��ʼ��LED���ţ������������ֵLED��
        ......

//���û���ʱ��ACK�˷�Ƶ=32768/8=4096(�ϵ縴λACLK�����ⲿ����ʱ��)
        ......

//����P1.0���ʱ��ACLK
        ......

//�ж����ŵ��������
        ......

        _EINT();            //���ж�����

        while (1) { };      //��ѭ��

}

unsigned int num_clk=0;     //����ʱ�Ӹ�������
#pragma  vector=PORT1_VECTOR
__interrupt  void port_ISR( )
{   num_clk++;              //�жϴ�����1��ʱ�Ӹ�����1
    if (num_clk==2048)      //�������ʱ�Ӹ�����
   {    P2OUT^=BIT3;        //LED����仯һ��: ������, �����
        num_clk=0;          //����ʱ�Ӹ�������
    }
        ......              //����жϱ�־
}
