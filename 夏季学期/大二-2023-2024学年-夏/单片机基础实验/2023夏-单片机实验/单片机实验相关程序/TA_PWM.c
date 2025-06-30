#include "msp430.h"

int main ( void )
{   WDTCTL = WDTPW + WDTHOLD;   	//关闭看门狗
    P2SEL |=BIT1+BIT4;      		//置P2.1和 P2.4为定时器TA1的PWM输出引脚
    P2SEL2 &=~(BIT1+BIT4);      		//置P2.1为比较器1的PWM输出引脚
    P2DIR |=BIT1+BIT4;   		//置P2.4为比较器2的PWM输出引脚

    TA1CTL |=TASSEL0;	//选择ACLK为TA1计数时钟，ACLK使用上电复位设置，即外部晶振32768Hz
    TA1CCR0=32767;          	//设置PWM周期，周期= (TA1CCR0+1)*T =(TA1CCR0+1)/计数时钟频率
			//即输出的PWM波形频率=1/PWM周期=计数时钟频率/(TA1CCR0+1)
    TA1CCTL1|=OUTMOD1; 	//置TA1比较器1的PWM输出为模式2： 计数到CCR1值翻转，到CCR0值置0
    TA1CCR1=24575;          	//置TA1比较器1设定值CCR1，TA1CCR1=TA1CCR0*(1-PWM波形占空比25%)

    TA1CCTL2|=OUTMOD1; 	//置比较器2的PWM输出为模式2： 计数到CCR2值翻转，到CCR0值置0
    TA1CCR2=16383;          	//置TA1比较器2设定值CCR2，TA1CCR2=TA1CCR0*(1-PWM波形占空比50%)

    TA1CTL |=TACLR+MC0;	//置增计数方式，使计数器从0开始计数，计数到TA1CCR0后又从0计数。
			
      while(1){  };      	// 主循环，CPU可做其他事情
}
