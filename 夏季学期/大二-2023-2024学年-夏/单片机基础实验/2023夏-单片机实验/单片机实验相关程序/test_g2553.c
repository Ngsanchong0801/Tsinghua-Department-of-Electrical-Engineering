//�ɾ���ϰ����Ҫ�����ȡ���򱣳ָ��ַ�ʽ����i����ǰ��ע�ͷ���
//�Ա�۲첻�����ͱ����Գ���ִ�е�Ӱ��
#include "msp430.h"
unsigned int j;             //����ȫ��int�ͱ���
//unsigned long i;             //����ȫ��long�ͱ���
int main ( void )
{   //unsigned int i;  		//����ֲ�int�ͱ���
    //unsigned long i;  	//����ֲ�long�ͱ���
    //register unsigned int i;  //����Ĵ���int�;ֲ�����
    //register unsigned long i;  //����Ĵ���long�;ֲ�����
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