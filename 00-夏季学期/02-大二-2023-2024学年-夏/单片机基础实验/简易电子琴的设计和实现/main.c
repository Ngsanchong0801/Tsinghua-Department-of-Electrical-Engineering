#include "msp430.h"
#define Rhythm 1.9        //Rhythm用來調整歌的節奏
const char tune1[207] = { 22, 65, 67, 37, 7, 64, 34, 22, 35, 35, 39, 38, 68, 37,
                          67, 7, 82, 67, 68, 67, 7, 52, 63, 63, 35, 64, 4, 22,
                          22, 65, 67, 37, 37, 68, 69, 39, 67, 69, 9, 52, 69, 69,
                          68, 11, 41, 67, 37, 68, 67, 7, 22, 69, 70, 69, 70, 39,
                          67, 67, 67, 65, 68, 8, 22, 22, 40, 40, 40, 69, 69, 38,
                          68, 69, 9, 52, 69, 69, 69, 12, 38, 69, 69, 9, 52, 65,
                          65, 35, 36, 67, 39, 68, 8, 8, 9, 9, 44, 44, 14, 67,
                          74, 44, 74, 22, 67, 44, 73, 72, 72, 71, 39, 9, 69, 68,
                          67, 65, 67, 38, 69, 9, 64, 67, 38, 69, 22, 65, 67, 38,
                          69, 9, 9, 22, 44, 44, 44, 73, 72, 72, 43, 74, 52, 67,
                          67, 44, 74, 73, 72, 41, 69, 9, 69, 68, 67, 65, 9, 69,
                          68, 67, 65, 9, 69, 68, 67, 65, 65, 38, 38, 8, 52, 44,
                          74, 73, 72, 74, 74, 71, 12, 42, 22, 71, 70, 69, 70,
                          70, 68, 69, 68, 8, 8, 73, 73, 72, 73, 44, 44, 79, 9,
                          42, 42, 71, 71, 39, 68, 8, 8, 22, 22, 22, 22 };
const char tune2[115] = { 7, 37, 39, 11, 11, 12, 44, 42, 11, 11, 9, 9, 41, 39,
                          7, 5, 37, 38, 11, 11, 12, 12, 42, 44, 11, 9, 8, 39,
                          38, 7, 8, 11, 41, 40, 11, 12, 12, 43, 42, 11, 14, 44,
                          44, 12, 14, 11, 41, 42, 11, 11, 12, 42, 42, 11, 9, 8,
                          38, 39, 11, 11, 7, 37, 37, 7, 9, 8, 39, 38, 7, 7, 12,
                          42, 42, 11, 9, 8, 39, 38, 7, 7, 14, 14, 14, 22, 12,
                          12, 12, 22, 11, 11, 12, 11, 8, 9, 11, 11, 14, 14, 14,
                          22, 12, 12, 12, 22, 11, 11, 12, 11, 8, 39, 38, 7, 7,
                          22, 22 };
//tune1和tune2存放了兩首歌的樂譜
const char melody1[21] = { 250, 222, 198, 187, 166, 148, 132, 124, 111, 98, 93,
                           83, 73, 65, 62, 55, 49, 46, 41, 36, 32 };
const char melody2[21] = { 25, 22, 19, 18, 16, 14, 13, 12, 11, 9, 9, 8, 7, 6, 6,
                           5, 4, 4, 4, 3, 3 };
//melody1和melody2存放了7個音調

void initializePins();           //初始化管腳
void initializeInterrupts();       //初始化中斷管腳
void int_light();          //控制四个燈的狀態
void ctrl_light1_1();
void ctrl_light1_2();
void ctrl_light1_3();
void light2();
void crtl_light2_1();
void crtl_light2_2();
unsigned pauseif = 0;     //結束功能

int main(void)
{
    WDTCTL = WDTPW + WDTHOLD;
    initializePins();                      //初始化引脚
    initializeInterrupts();
    unsigned int pitchRange = 0;   //pitchRange用來存放音域，0為低音，1為中音，2為高音
    unsigned int note = 22;       //note用來記錄按下的音調()
    unsigned int i;
    unsigned int tone;
    unsigned int save;

    while (1)
    {
        int_light();
        pauseif = 0;              //pauseif为1时回到功能选择界面
        while ((P1IN & BIT0) != 0 & (P1IN & BIT1) != 0)
            ;


        if ((P1IN & BIT0) == 0)
        {    //按下K1，進入功能1
            __delay_cycles(500000);   //延時，避免一次按鍵多次回應
            while (pauseif == 0)
            {
                note = 22;
                if ((P1IN & BIT7) == 0)
                {
                    pitchRange++;
                    __delay_cycles(500000);
                    if (pitchRange == 3)
                        pitchRange = 0;
                }

                if (pitchRange == 0) //不同音調下的亮燈
                    ctrl_light1_1();
                else if (pitchRange == 1)
                    ctrl_light1_2();
                else if (pitchRange == 2)
                    ctrl_light1_3();

                if ((P1IN & BIT0) == 0) //劃分音調
                    note = 7 * pitchRange;
                else if ((P1IN & BIT1) == 0)
                    note = 7 * pitchRange + 1;
                else if ((P1IN & BIT2) == 0)
                    note = 7 * pitchRange + 2;
                else if ((P1IN & BIT3) == 0)
                    note = 7 * pitchRange + 3;
                else if ((P1IN & BIT4) == 0)
                    note = 7 * pitchRange + 4;
                else if ((P1IN & BIT5) == 0)
                    note = 7 * pitchRange + 5;
                else if ((P1IN & BIT6) == 0)
                    note = 7 * pitchRange + 6;

                if (note != 22) //輸出音調
                {
                    TA1CCR0 = melody1[note];
                    TA1CCR1 = melody2[note];
                    __delay_cycles(400000 * Rhythm);
                    TA1CCR0 = 32767;
                    TA1CCR1 = 32767;
                }
                else if (note == 22)
                {
                    TA1CCR0 = 32767;
                    TA1CCR1 = 32767;
                }
            }
        }  //功能1結束

        else if ((P1IN & BIT1) == 0)
        {    //进入播放功能
            light2();
            __delay_cycles(500000);
            while ((P1IN & BIT0) != 0 & (P1IN & BIT1) != 0)
                ;  //等待按键选择


            if ((P1IN & BIT0) == 0)
            {      //选择第一首曲子
                save = 115;              //save存储了这首曲子的音符总数
                crtl_light2_1();
            }
            else if ((P1IN & BIT1) == 0)
            {  //选择第二首曲子
                save = 207;
                crtl_light2_2();
            }
            i = 0;


            while ((i < save) & (pauseif == 0))
            {
                if (save == 207)
                    tone = tune1[i];
                else if (save == 115)
                    tone = tune2[i];
                if (tone == 22)
                {
                    TA1CCR0 = 32767;
                    TA1CCR1 = 32767;
                    __delay_cycles(400000 * Rhythm);
                }
                else if (tone == 52)
                {
                    TA1CCR0 = 32767;
                    TA1CCR1 = 32767;
                    __delay_cycles(200000 * Rhythm);
                }
                else if (tone == 82)
                {
                    TA1CCR0 = 32767;
                    TA1CCR1 = 32767;
                    __delay_cycles(100000 * Rhythm);
                }
                else if (tone >= 30 & tone < 60)
                {
                    TA1CCR0 = melody1[tone - 30];
                    TA1CCR1 = melody2[tone - 30];
                    __delay_cycles(180000 * Rhythm);
                    TA1CCR0 = 32767;
                    TA1CCR1 = 32767;
                    __delay_cycles(20000 * Rhythm);
                }
                else if (tone >= 60)
                {
                    TA1CCR0 = melody1[tone - 60];
                    TA1CCR1 = melody2[tone - 60];
                    __delay_cycles(80000 * Rhythm);
                    TA1CCR0 = 32767;
                    TA1CCR1 = 32767;
                    __delay_cycles(20000 * Rhythm);
                }
                else
                {
                    TA1CCR0 = melody1[tone];
                    TA1CCR1 = melody2[tone];
                    __delay_cycles(370000 * Rhythm);
                    TA1CCR0 = 32767;
                    TA1CCR1 = 32767;
                    __delay_cycles(30000 * Rhythm);
                }
                i++;
            }

        }   //功能2结束
    }
}

void initializePins(void)
{
    P2SEL |= BIT1;
    P2SEL2 &= ~BIT1;
    P2DIR |= BIT1;
    P2DIR |= BIT2 + BIT3 + BIT4 + BIT5;
    P2OUT |= BIT2 + BIT3 + BIT4 + BIT5;
    P1OUT = 0xff;
    P1REN = 0xff;
    TA1CTL |= TASSEL0;
    TA1CCR0 = 250;
    TA1CCTL1 = OUTMOD_2;
    TA1CCR1 = 25;
    TA1CTL |= TACLR + MC0;
    TA1CCR0 = 32767;
    TA1CCR1 = 32767;
}

void initializeInterrupts()
{
    _DINT();
    P1IES |= BIT7;
    P1IFG &= ~BIT7;
    P1IE |= BIT7;
    _EINT();
}

void int_light()
{
    P2OUT &= ~(BIT2 + BIT3 + BIT4 + BIT5);
}

void ctrl_light1_1()
{
    P2OUT &= ~BIT2;
    P2OUT |= BIT3 + BIT4 + BIT5;
}

void ctrl_light1_2()
{
    P2OUT &= ~BIT3;
    P2OUT |= BIT2 + BIT4 + BIT5;
}

void ctrl_light1_3()
{
    P2OUT &= ~(BIT2 + BIT3);
    P2OUT |= BIT4 + BIT5;
}

void light2()
{
    P2OUT &= ~(BIT4 + BIT5);
    P2OUT |= BIT2 + BIT3;
}

void crtl_light2_1()
{
    P2OUT &= ~BIT4;
    P2OUT |= BIT2 + BIT3 + BIT5;
}

void crtl_light2_2()
{
    P2OUT &= ~BIT5;
    P2OUT |= BIT2 + BIT3 + BIT4;
}

#pragma vector=PORT1_VECTOR
__interrupt void pause1()
{
    if ((P1IFG & BIT7) != 0)
    {
        P1IFG &= ~BIT7;
        if ((P2OUT & BIT2) != 0 & (P2OUT & BIT3) != 0)
            pauseif = 1;
        else if ((P1IN & BIT1) == 0)
            pauseif = 1;
    }
}
