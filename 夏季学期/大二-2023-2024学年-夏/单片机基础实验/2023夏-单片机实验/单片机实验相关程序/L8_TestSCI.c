#include "msp430.h"
void UARTA0_init( );
char buffer[20],string[30]="Please input 7 characters:\r\n\0";
unsigned char j;
int  main ( void )
{   WDTCTL = WDTPW + WDTHOLD;       //�رտ��Ź�
//��ʵ��ʱ�������ʾ����
//����P1.0��P1.4�������ʱ��ACLK��SMCLK���Ա�۲�ʱ��Ƶ��,�޸Ĳ����ʼĴ�������
//    P1SEL |= BIT0+BIT4;
//    P1SEL2 |=~( BIT0+BIT4);
//    P1DIR |= BIT0+BIT4;

   UARTA0_init( );               //��ʼ������
    while(1)
    {   j=0;
        while(string[j]!='\0')      //�����ʾ��Ϣ
        {   while((IFG2&UCA0TXIFG)==0);     //��ⷢ�ͻ����Ƿ��
                 UCA0TXBUF=string[j];       //ȡһ�����ݷ���
        j++;
        };

        for (j=0; j<7; j++)          //�����ַ���
        {   while((IFG2&UCA0RXIFG)==0);     //�����ջ������Ƿ���
                buffer[j]= UCA0RXBUF;       //����һ�����ݲ�����
        };

        for (j=0;j<7;j++)           //�����ַ���
        {   while((IFG2&UCA0TXIFG)==0);     //��ⷢ�ͻ����Ƿ��
                 UCA0TXBUF=buffer[j];       //ȡһ�����ݷ���
        };
    };
}

void  UARTA0_init( )
{   UCA0CTL1|= UCSWRST;      //�������λλswrstΪ1
    P1SEL |= BIT1+BIT2;         	//��P1.1��P1.2Ϊ���нӿ��ա������Ź���
    P1SEL2 |= BIT1+BIT2;        	//
//���ݸ�ʽѡ���ϵ縴λ���ã���У�飬8λ���ݣ�1��ֹͣλ���첽����ͨ��
    UCA0CTL1|=UCSSEL0+UCRXEIE; //������ʱ��ѡ���ϵ縴λʱ��ACLK��32.768KHz���Դ����
    UCA0BR0 =3;              //������9600
    UCA0BR1 = 0;
    UCA0MCTL=UCBRF_0+UCBRS_3;
    UCA0CTL1 &=~UCSWRST;        //�������λλswrstΪ0�������������
}
