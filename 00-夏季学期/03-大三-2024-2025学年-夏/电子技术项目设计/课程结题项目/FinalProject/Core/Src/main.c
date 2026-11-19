/* USER CODE BEGIN Header */
/**
 ******************************************************************************
 * @file           : main.c
 * @brief          : Main program body
 ******************************************************************************
 * @attention
 *
 * Copyright (c) 2024 STMicroelectronics.
 * All rights reserved.
 *
 * This software is licensed under terms that can be found in the LICENSE file
 * in the root directory of this software component.
 * If no LICENSE file comes with this software, it is provided AS-IS.
 *
 ******************************************************************************
 */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
//------------------------------------------------
#define ADC_CONVERTED_DATA_BUFFER_SIZE (uint16_t) 2000
#define DAC_BUFFER_SIZE (uint16_t) 200

#define RXBUFFERSIZE 20
//#define NUM_CHANNELS 2
//------------------------------------------------

/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
ADC_HandleTypeDef hadc1;
DMA_HandleTypeDef hdma_adc1;

DAC_HandleTypeDef hdac1;
DMA_HandleTypeDef hdma_dac1_ch1;
DMA_HandleTypeDef hdma_dac1_ch2;

TIM_HandleTypeDef htim3;
TIM_HandleTypeDef htim4;
TIM_HandleTypeDef htim8;

UART_HandleTypeDef huart2;

/* USER CODE BEGIN PV */
//------------------------------------------------
uint16_t ADC1ConvertedValue = 0;
int i = 0;

//基波
uint16_t SineWaveData[DAC_BUFFER_SIZE ] = { 2047, 2112, 2176, 2240, 2304, 2368,
		2431, 2494, 2557, 2619, 2680, 2741, 2801, 2860, 2919, 2977, 3034, 3090,
		3144, 3198, 3251, 3302, 3352, 3401, 3449, 3495, 3540, 3583, 3625, 3665,
		3704, 3741, 3776, 3809, 3841, 3871, 3900, 3926, 3951, 3973, 3994, 4013,
		4030, 4045, 4058, 4069, 4078, 4085, 4090, 4093, 4094, 4093, 4090, 4085,
		4078, 4069, 4058, 4045, 4030, 4013, 3994, 3973, 3951, 3926, 3900, 3871,
		3841, 3809, 3776, 3741, 3704, 3665, 3625, 3583, 3540, 3495, 3449, 3401,
		3352, 3302, 3251, 3198, 3144, 3090, 3034, 2977, 2919, 2860, 2801, 2741,
		2680, 2619, 2557, 2494, 2431, 2368, 2304, 2240, 2176, 2112, 2048, 1983,
		1919, 1855, 1791, 1727, 1664, 1601, 1538, 1476, 1415, 1354, 1294, 1235,
		1176, 1118, 1061, 1005, 951, 897, 844, 793, 743, 694, 646, 600, 555,
		512, 470, 430, 391, 354, 319, 286, 254, 224, 195, 169, 144, 122, 101,
		82, 65, 50, 37, 26, 17, 10, 5, 2, 0, 2, 5, 10, 17, 26, 37, 50, 65, 82,
		101, 122, 144, 169, 195, 224, 254, 286, 319, 354, 391, 430, 470, 512,
		555, 600, 646, 694, 743, 793, 844, 897, 951, 1005, 1061, 1118, 1176,
		1235, 1294, 1354, 1415, 1476, 1538, 1601, 1664, 1727, 1791, 1855, 1919,
		1983 };

//3次諧波
uint16_t SineWaveData_3rdHarmonic[DAC_BUFFER_SIZE ] = { 2047, 2147, 2246, 2344,
		2441, 2536, 2629, 2718, 2805, 2888, 2968, 3043, 3113, 3179, 3240, 3296,
		3347, 3393, 3433, 3467, 3497, 3521, 3540, 3554, 3563, 3567, 3567, 3564,
		3556, 3545, 3530, 3514, 3494, 3473, 3450, 3427, 3402, 3377, 3352, 3328,
		3304, 3282, 3261, 3241, 3224, 3209, 3196, 3186, 3179, 3175, 3173, 3175,
		3179, 3186, 3196, 3209, 3224, 3241, 3261, 3282, 3304, 3328, 3352, 3377,
		3402, 3427, 3450, 3473, 3494, 3514, 3530, 3545, 3556, 3564, 3567, 3567,
		3563, 3554, 3540, 3521, 3497, 3467, 3433, 3393, 3347, 3296, 3240, 3179,
		3113, 3043, 2968, 2888, 2805, 2718, 2629, 2536, 2441, 2344, 2246, 2147,
		2048, 1948, 1849, 1751, 1654, 1559, 1466, 1377, 1290, 1207, 1127, 1052,
		982, 916, 855, 799, 748, 702, 662, 628, 598, 574, 555, 541, 532, 528,
		528, 531, 539, 550, 565, 581, 601, 622, 645, 668, 693, 718, 743, 767,
		791, 813, 834, 854, 871, 886, 899, 909, 916, 920, 922, 920, 916, 909,
		899, 886, 871, 854, 834, 813, 791, 767, 743, 718, 693, 668, 645, 622,
		601, 581, 565, 550, 539, 531, 528, 528, 532, 541, 555, 574, 598, 628,
		662, 702, 748, 799, 855, 916, 982, 1052, 1127, 1207, 1290, 1377, 1466,
		1559, 1654, 1751, 1849, 1948 };

//5次諧波
uint16_t SineWaveData_5thHarmonic[DAC_BUFFER_SIZE ] = { 2047, 2179, 2308, 2434,
		2554, 2666, 2768, 2861, 2941, 3010, 3065, 3108, 3137, 3154, 3159, 3153,
		3137, 3113, 3083, 3048, 3010, 2971, 2933, 2898, 2868, 2844, 2827, 2820,
		2823, 2836, 2861, 2896, 2943, 3001, 3069, 3145, 3228, 3318, 3412, 3508,
		3605, 3700, 3792, 3878, 3957, 4027, 4086, 4134, 4169, 4190, 4197, 4190,
		4169, 4134, 4086, 4027, 3957, 3878, 3792, 3700, 3605, 3508, 3412, 3318,
		3228, 3145, 3069, 3001, 2943, 2896, 2861, 2836, 2823, 2820, 2827, 2844,
		2868, 2898, 2933, 2971, 3010, 3048, 3083, 3113, 3137, 3153, 3159, 3154,
		3137, 3108, 3065, 3010, 2941, 2861, 2768, 2666, 2554, 2434, 2308, 2179,
		2048, 1916, 1787, 1661, 1541, 1429, 1327, 1234, 1154, 1085, 1030, 987,
		958, 941, 936, 942, 958, 982, 1012, 1047, 1085, 1124, 1162, 1197, 1227,
		1251, 1268, 1275, 1272, 1259, 1234, 1199, 1152, 1094, 1026, 950, 867,
		777, 683, 587, 490, 395, 303, 217, 138, 68, 9, -39, -74, -95, -102, -95,
		-74, -39, 9, 68, 138, 217, 303, 395, 490, 587, 683, 777, 867, 950, 1026,
		1094, 1152, 1199, 1234, 1259, 1272, 1275, 1268, 1251, 1227, 1197, 1162,
		1124, 1085, 1047, 1012, 982, 958, 942, 936, 941, 958, 987, 1030, 1085,
		1154, 1234, 1327, 1429, 1541, 1661, 1787, 1916 };

//7次諧波
uint16_t SineWaveData_7thHarmonic[DAC_BUFFER_SIZE ] = { 2047, 2211, 2368, 2515,
		2647, 2760, 2850, 2916, 2957, 2974, 2968, 2941, 2897, 2841, 2777, 2711,
		2648, 2593, 2552, 2527, 2523, 2542, 2584, 2649, 2736, 2844, 2967, 3103,
		3245, 3390, 3530, 3662, 3780, 3880, 3958, 4012, 4040, 4042, 4019, 3972,
		3906, 3823, 3730, 3630, 3529, 3433, 3346, 3273, 3219, 3185, 3173, 3185,
		3219, 3273, 3346, 3433, 3529, 3630, 3730, 3823, 3906, 3972, 4019, 4042,
		4040, 4012, 3958, 3880, 3780, 3662, 3530, 3390, 3245, 3103, 2967, 2844,
		2736, 2649, 2584, 2542, 2523, 2527, 2552, 2593, 2648, 2711, 2777, 2841,
		2897, 2941, 2968, 2974, 2957, 2916, 2850, 2760, 2647, 2515, 2368, 2211,
		2047, 1884, 1727, 1580, 1448, 1335, 1245, 1179, 1138, 1121, 1127, 1154,
		1198, 1254, 1318, 1384, 1447, 1502, 1543, 1568, 1572, 1553, 1511, 1446,
		1359, 1251, 1128, 992, 850, 705, 565, 433, 315, 215, 137, 83, 55, 53,
		76, 123, 189, 272, 365, 465, 566, 662, 749, 822, 876, 910, 922, 910,
		876, 822, 749, 662, 566, 465, 365, 272, 189, 123, 76, 53, 55, 83, 137,
		215, 315, 433, 565, 705, 850, 992, 1128, 1251, 1359, 1446, 1511, 1553,
		1572, 1568, 1543, 1502, 1447, 1384, 1318, 1254, 1198, 1154, 1127, 1121,
		1138, 1179, 1245, 1335, 1448, 1580, 1727, 1884 };

//9次諧波
uint16_t SineWaveData_9thHarmonic[DAC_BUFFER_SIZE ] = { 2047, 2242, 2425, 2585,
		2716, 2809, 2862, 2874, 2849, 2792, 2712, 2618, 2523, 2437, 2372, 2335,
		2334, 2372, 2449, 2564, 2709, 2878, 3059, 3242, 3415, 3567, 3690, 3775,
		3820, 3823, 3786, 3716, 3619, 3505, 3387, 3274, 3179, 3110, 3074, 3077,
		3118, 3197, 3307, 3442, 3592, 3745, 3890, 4016, 4114, 4176, 4197, 4176,
		4114, 4016, 3890, 3745, 3592, 3442, 3307, 3197, 3118, 3077, 3074, 3110,
		3179, 3274, 3387, 3505, 3619, 3716, 3786, 3823, 3820, 3775, 3690, 3567,
		3415, 3242, 3059, 2878, 2709, 2564, 2449, 2372, 2334, 2335, 2372, 2437,
		2523, 2618, 2712, 2792, 2849, 2874, 2862, 2809, 2716, 2585, 2425, 2242,
		2048, 1853, 1670, 1510, 1379, 1286, 1233, 1221, 1246, 1303, 1383, 1477,
		1572, 1658, 1723, 1760, 1761, 1723, 1646, 1531, 1386, 1217, 1036, 853,
		680, 528, 405, 320, 275, 272, 309, 379, 476, 590, 708, 821, 916, 985,
		1021, 1018, 977, 898, 788, 653, 503, 350, 205, 79, -19, -81, -102, -81,
		-19, 79, 205, 350, 503, 653, 788, 898, 977, 1018, 1021, 985, 916, 821,
		708, 590, 476, 379, 309, 272, 275, 320, 405, 528, 680, 853, 1036, 1217,
		1386, 1531, 1646, 1723, 1761, 1760, 1723, 1658, 1572, 1477, 1383, 1303,
		1246, 1221, 1233, 1286, 1379, 1510, 1670, 1853 };

//方波
uint16_t SquareWaveData[DAC_BUFFER_SIZE ] = { 2047, 4094, 4094, 4094, 4094,
		4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094,
		4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094,
		4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094,
		4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094,
		4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094,
		4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094,
		4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094,
		4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094, 4094,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
		0, 0, 0 };

//三角波
uint16_t TriangleWaveData[DAC_BUFFER_SIZE ] = { 0, 41, 82, 123, 164, 205, 246,
		287, 328, 369, 410, 451, 492, 533, 574, 615, 656, 696, 737, 778, 819,
		860, 901, 942, 983, 1024, 1065, 1106, 1147, 1188, 1229, 1270, 1311,
		1352, 1392, 1433, 1474, 1515, 1556, 1597, 1638, 1679, 1720, 1761, 1802,
		1843, 1884, 1925, 1966, 2007, 2048, 2088, 2129, 2170, 2211, 2252, 2293,
		2334, 2375, 2416, 2457, 2498, 2539, 2580, 2621, 2662, 2703, 2743, 2784,
		2825, 2866, 2907, 2948, 2989, 3030, 3071, 3112, 3153, 3194, 3235, 3276,
		3317, 3358, 3399, 3439, 3480, 3521, 3562, 3603, 3644, 3685, 3726, 3767,
		3808, 3849, 3890, 3931, 3972, 4013, 4054, 4094, 4054, 4013, 3972, 3931,
		3890, 3849, 3808, 3767, 3726, 3685, 3644, 3603, 3562, 3521, 3480, 3439,
		3399, 3358, 3317, 3276, 3235, 3194, 3153, 3112, 3071, 3030, 2989, 2948,
		2907, 2866, 2825, 2784, 2743, 2703, 2662, 2621, 2580, 2539, 2498, 2457,
		2416, 2375, 2334, 2293, 2252, 2211, 2170, 2129, 2088, 2047, 2007, 1966,
		1925, 1884, 1843, 1802, 1761, 1720, 1679, 1638, 1597, 1556, 1515, 1474,
		1433, 1392, 1352, 1311, 1270, 1229, 1188, 1147, 1106, 1065, 1024, 983,
		942, 901, 860, 819, 778, 737, 696, 656, 615, 574, 533, 492, 451, 410,
		369, 328, 287, 246, 205, 164, 123, 82, 41 };

uint16_t WaveData[DAC_BUFFER_SIZE ] = { 0 };
uint16_t Channel = 0;

uint16_t ADC1ConvertedData[ADC_CONVERTED_DATA_BUFFER_SIZE ];
uint16_t FrameHeader = 0x5353;
uint16_t FrameTerm = 0x4545;

uint8_t CommFlag = 0;
uint8_t RxBuffer[RXBUFFERSIZE] = { 0 };

//初值
uint16_t Ch1_Amp = 2024;
uint16_t Ch1_Freq = 1000;
uint16_t Ch1_Phrase = 0;
uint16_t Ch1_Har3 = 0;
uint16_t Ch1_Har5 = 0;
uint16_t Ch1_Har7 = 0;
uint16_t Ch1_Har9 = 0;
uint16_t Ch1_Type = 0;

uint16_t Ch2_Amp = 4096;
uint16_t Ch2_Freq = 10000;
uint16_t Ch2_Phrase = 0;
uint16_t Ch2_Har3 = 0;
uint16_t Ch2_Har5 = 0;
uint16_t Ch2_Har7 = 0;
uint16_t Ch2_Har9 = 0;
uint16_t Ch2_Type = 1;
//------------------------------------------------

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_DAC1_Init(void);
static void MX_ADC1_Init(void);
static void MX_TIM4_Init(void);
static void MX_USART2_UART_Init(void);
static void MX_TIM3_Init(void);
static void MX_TIM8_Init(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
 * @brief  The application entry point.
 * @retval int
 */
int main(void) {
	/* USER CODE BEGIN 1 */

	/* USER CODE END 1 */

	/* MCU Configuration--------------------------------------------------------*/

	/* Reset of all peripherals, Initializes the Flash interface and the Systick. */
	HAL_Init();

	/* USER CODE BEGIN Init */

	/* USER CODE END Init */

	/* Configure the system clock */
	SystemClock_Config();

	/* USER CODE BEGIN SysInit */

	/* USER CODE END SysInit */

	/* Initialize all configured peripherals */
	MX_GPIO_Init();
	MX_DMA_Init();
	MX_DAC1_Init();
	MX_ADC1_Init();
	MX_TIM4_Init();
	MX_USART2_UART_Init();
	MX_TIM3_Init();
	MX_TIM8_Init();
	/* USER CODE BEGIN 2 */
	HAL_TIM_Base_Start(&htim3);
	HAL_TIM_Base_Start(&htim4);
	HAL_DAC_Start_DMA(&hdac1, DAC_CHANNEL_1, (uint32_t*) SineWaveData,
	DAC_BUFFER_SIZE, DAC_ALIGN_12B_R);
	HAL_ADCEx_Calibration_Start(&hadc1, ADC_SINGLE_ENDED);
	HAL_ADC_Start_DMA(&hadc1, (uint32_t*) &ADC1ConvertedData,
	ADC_CONVERTED_DATA_BUFFER_SIZE);

	HAL_UART_Receive_IT(&huart2, (uint8_t*) RxBuffer, RXBUFFERSIZE);

	/* USER CODE END 2 */

	/* Infinite loop */
	/* USER CODE BEGIN WHILE */
	//printf("Please Enter What Type of Wave You Want:\r\n");
	while (1) {
		/* USER CODE END WHILE */

		/* USER CODE BEGIN 3 */
		//------------------------------------------------
		if (CommFlag == 1) {
			// Channel输出波形
			if (Channel == 0) {
				// 停止定时器，设置定时器频率并重新启动
				HAL_TIM_Base_Stop(&htim4);
				__HAL_TIM_SET_AUTORELOAD(&htim4, 850000.0 / Ch1_Freq - 1);
				HAL_TIM_Base_Start(&htim4);

				// 停止DAC通道1的DMA传输
				HAL_DAC_Stop_DMA(&hdac1, DAC_CHANNEL_1);

				// 生成不同的波形数据
				for (i = 0; i < DAC_BUFFER_SIZE ; i++) {
					switch (Ch1_Type) {
					case 0: // 正弦波加谐波
						WaveData[i] = (uint16_t) (Ch1_Amp / 4095.0
								* (SineWaveData[i]
										+ Ch1_Har3 * 0.01
												* SineWaveData_3rdHarmonic[i]
										+ Ch1_Har5 * 0.01
												* SineWaveData_5thHarmonic[i]
										+ Ch1_Har7 * 0.01
												* SineWaveData_7thHarmonic[i]
										+ Ch1_Har9 * 0.01
												* SineWaveData_9thHarmonic[i]));
						break;
					case 1: // 方波
						WaveData[i] = (uint16_t) (Ch1_Amp / 4095.0
								* SquareWaveData[i]);
						break;
					case 2: // 三角波
						WaveData[i] = (uint16_t) (Ch1_Amp / 4095.0
								* TriangleWaveData[i]);
						break;
					default:
						break;
					}
				}

				HAL_Delay(50);
				HAL_DAC_Start_DMA(&hdac1, DAC_CHANNEL_1, (uint32_t*) WaveData,
						DAC_BUFFER_SIZE, DAC_ALIGN_12B_R);

				// Channel输出波形
			} else if (Channel == 1) {
				// 停止定时器，设置定时器频率并重新启动
				HAL_TIM_Base_Stop(&htim8);
				__HAL_TIM_SET_AUTORELOAD(&htim8, 850000.0 / Ch2_Freq - 1);
				HAL_TIM_Base_Start(&htim8);

				// 停止DAC通道2的DMA传输
				HAL_DAC_Stop_DMA(&hdac1, DAC_CHANNEL_2);

				// 生成不同的波形数据
				for (i = 0; i < DAC_BUFFER_SIZE ; i++) {
					switch (Ch2_Type) {
					case 0: // 正弦波加谐波
						WaveData[i] = (uint16_t) (Ch2_Amp / 4095.0
								* (SineWaveData[i]
										+ Ch2_Har3 * 0.01
												* SineWaveData_3rdHarmonic[i]
										+ Ch2_Har5 * 0.01
												* SineWaveData_5thHarmonic[i]
										+ Ch2_Har7 * 0.01
												* SineWaveData_7thHarmonic[i]
										+ Ch2_Har9 * 0.01
												* SineWaveData_9thHarmonic[i]));
						break;
					case 1: // 方波
						WaveData[i] = (uint16_t) (Ch2_Amp / 4095.0
								* SquareWaveData[i]);
						break;
					case 2: // 三角波
						WaveData[i] = (uint16_t) (Ch2_Amp / 4095.0
								* TriangleWaveData[i]);
						break;
					default:
						break;
					}
				}

				HAL_Delay(50);
				HAL_DAC_Start_DMA(&hdac1, DAC_CHANNEL_2, (uint32_t*) WaveData,
						DAC_BUFFER_SIZE, DAC_ALIGN_12B_R);
			}
			CommFlag = 0;
		}

	//------------------------------------------------
}

/* USER CODE END 3 */
}

/**
 * @brief System Clock Configuration
 * @retval None
 */
void SystemClock_Config(void) {
RCC_OscInitTypeDef RCC_OscInitStruct = { 0 };
RCC_ClkInitTypeDef RCC_ClkInitStruct = { 0 };

/** Configure the main internal regulator output voltage
 */
HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE1_BOOST);

/** Initializes the RCC Oscillators according to the specified parameters
 * in the RCC_OscInitTypeDef structure.
 */
RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
RCC_OscInitStruct.HSEState = RCC_HSE_ON;
RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
RCC_OscInitStruct.PLL.PLLM = RCC_PLLM_DIV6;
RCC_OscInitStruct.PLL.PLLN = 85;
RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV10;
RCC_OscInitStruct.PLL.PLLQ = RCC_PLLQ_DIV2;
RCC_OscInitStruct.PLL.PLLR = RCC_PLLR_DIV2;
if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK) {
	Error_Handler();
}

/** Initializes the CPU, AHB and APB buses clocks
 */
RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK
		| RCC_CLOCKTYPE_PCLK1 | RCC_CLOCKTYPE_PCLK2;
RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;

if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_4) != HAL_OK) {
	Error_Handler();
}
}

/**
 * @brief ADC1 Initialization Function
 * @param None
 * @retval None
 */
static void MX_ADC1_Init(void) {

/* USER CODE BEGIN ADC1_Init 0 */

/* USER CODE END ADC1_Init 0 */

ADC_MultiModeTypeDef multimode = { 0 };
ADC_ChannelConfTypeDef sConfig = { 0 };

/* USER CODE BEGIN ADC1_Init 1 */

/* USER CODE END ADC1_Init 1 */

/** Common config
 */
hadc1.Instance = ADC1;
hadc1.Init.ClockPrescaler = ADC_CLOCK_ASYNC_DIV1;
hadc1.Init.Resolution = ADC_RESOLUTION_12B;
hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
hadc1.Init.GainCompensation = 0;
hadc1.Init.ScanConvMode = ADC_SCAN_DISABLE;
hadc1.Init.EOCSelection = ADC_EOC_SINGLE_CONV;
hadc1.Init.LowPowerAutoWait = DISABLE;
hadc1.Init.ContinuousConvMode = DISABLE;
hadc1.Init.NbrOfConversion = 1;
hadc1.Init.DiscontinuousConvMode = DISABLE;
hadc1.Init.ExternalTrigConv = ADC_EXTERNALTRIG_T3_TRGO;
hadc1.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_RISING;
hadc1.Init.DMAContinuousRequests = ENABLE;
hadc1.Init.Overrun = ADC_OVR_DATA_PRESERVED;
hadc1.Init.OversamplingMode = DISABLE;
if (HAL_ADC_Init(&hadc1) != HAL_OK) {
	Error_Handler();
}

/** Configure the ADC multi-mode
 */
multimode.Mode = ADC_MODE_INDEPENDENT;
if (HAL_ADCEx_MultiModeConfigChannel(&hadc1, &multimode) != HAL_OK) {
	Error_Handler();
}

/** Configure Regular Channel
 */
sConfig.Channel = ADC_CHANNEL_1;
sConfig.Rank = ADC_REGULAR_RANK_1;
sConfig.SamplingTime = ADC_SAMPLETIME_2CYCLES_5;
sConfig.SingleDiff = ADC_SINGLE_ENDED;
sConfig.OffsetNumber = ADC_OFFSET_NONE;
sConfig.Offset = 0;
if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK) {
	Error_Handler();
}
/* USER CODE BEGIN ADC1_Init 2 */

/* USER CODE END ADC1_Init 2 */

}

/**
 * @brief DAC1 Initialization Function
 * @param None
 * @retval None
 */
static void MX_DAC1_Init(void) {

/* USER CODE BEGIN DAC1_Init 0 */

/* USER CODE END DAC1_Init 0 */

DAC_ChannelConfTypeDef sConfig = { 0 };

/* USER CODE BEGIN DAC1_Init 1 */

/* USER CODE END DAC1_Init 1 */

/** DAC Initialization
 */
hdac1.Instance = DAC1;
if (HAL_DAC_Init(&hdac1) != HAL_OK) {
	Error_Handler();
}

/** DAC channel OUT1 config
 */
sConfig.DAC_HighFrequency = DAC_HIGH_FREQUENCY_INTERFACE_MODE_AUTOMATIC;
sConfig.DAC_DMADoubleDataMode = DISABLE;
sConfig.DAC_SignedFormat = DISABLE;
sConfig.DAC_SampleAndHold = DAC_SAMPLEANDHOLD_DISABLE;
sConfig.DAC_Trigger = DAC_TRIGGER_T4_TRGO;
sConfig.DAC_Trigger2 = DAC_TRIGGER_NONE;
sConfig.DAC_OutputBuffer = DAC_OUTPUTBUFFER_ENABLE;
sConfig.DAC_ConnectOnChipPeripheral = DAC_CHIPCONNECT_EXTERNAL;
sConfig.DAC_UserTrimming = DAC_TRIMMING_FACTORY;
if (HAL_DAC_ConfigChannel(&hdac1, &sConfig, DAC_CHANNEL_1) != HAL_OK) {
	Error_Handler();
}

/** DAC channel OUT2 config
 */
sConfig.DAC_Trigger = DAC_TRIGGER_T8_TRGO;
if (HAL_DAC_ConfigChannel(&hdac1, &sConfig, DAC_CHANNEL_2) != HAL_OK) {
	Error_Handler();
}
/* USER CODE BEGIN DAC1_Init 2 */

/* USER CODE END DAC1_Init 2 */

}

/**
 * @brief TIM3 Initialization Function
 * @param None
 * @retval None
 */
static void MX_TIM3_Init(void) {

/* USER CODE BEGIN TIM3_Init 0 */

/* USER CODE END TIM3_Init 0 */

TIM_ClockConfigTypeDef sClockSourceConfig = { 0 };
TIM_MasterConfigTypeDef sMasterConfig = { 0 };

/* USER CODE BEGIN TIM3_Init 1 */

/* USER CODE END TIM3_Init 1 */
htim3.Instance = TIM3;
htim3.Init.Prescaler = 169;
htim3.Init.CounterMode = TIM_COUNTERMODE_UP;
htim3.Init.Period = 9;
htim3.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
htim3.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
if (HAL_TIM_Base_Init(&htim3) != HAL_OK) {
	Error_Handler();
}
sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
if (HAL_TIM_ConfigClockSource(&htim3, &sClockSourceConfig) != HAL_OK) {
	Error_Handler();
}
sMasterConfig.MasterOutputTrigger = TIM_TRGO_UPDATE;
sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
if (HAL_TIMEx_MasterConfigSynchronization(&htim3, &sMasterConfig) != HAL_OK) {
	Error_Handler();
}
/* USER CODE BEGIN TIM3_Init 2 */

/* USER CODE END TIM3_Init 2 */

}

/**
 * @brief TIM4 Initialization Function
 * @param None
 * @retval None
 */
static void MX_TIM4_Init(void) {

/* USER CODE BEGIN TIM4_Init 0 */

/* USER CODE END TIM4_Init 0 */

TIM_ClockConfigTypeDef sClockSourceConfig = { 0 };
TIM_MasterConfigTypeDef sMasterConfig = { 0 };

/* USER CODE BEGIN TIM4_Init 1 */

/* USER CODE END TIM4_Init 1 */
htim4.Instance = TIM4;
htim4.Init.Prescaler = 0;
htim4.Init.CounterMode = TIM_COUNTERMODE_UP;
htim4.Init.Period = 849;
htim4.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
htim4.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
if (HAL_TIM_Base_Init(&htim4) != HAL_OK) {
	Error_Handler();
}
sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
if (HAL_TIM_ConfigClockSource(&htim4, &sClockSourceConfig) != HAL_OK) {
	Error_Handler();
}
sMasterConfig.MasterOutputTrigger = TIM_TRGO_UPDATE;
sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
if (HAL_TIMEx_MasterConfigSynchronization(&htim4, &sMasterConfig) != HAL_OK) {
	Error_Handler();
}
/* USER CODE BEGIN TIM4_Init 2 */

/* USER CODE END TIM4_Init 2 */

}

/**
 * @brief TIM8 Initialization Function
 * @param None
 * @retval None
 */
static void MX_TIM8_Init(void) {

/* USER CODE BEGIN TIM8_Init 0 */

/* USER CODE END TIM8_Init 0 */

TIM_ClockConfigTypeDef sClockSourceConfig = { 0 };
TIM_MasterConfigTypeDef sMasterConfig = { 0 };

/* USER CODE BEGIN TIM8_Init 1 */

/* USER CODE END TIM8_Init 1 */
htim8.Instance = TIM8;
htim8.Init.Prescaler = 0;
htim8.Init.CounterMode = TIM_COUNTERMODE_UP;
htim8.Init.Period = 849;
htim8.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
htim8.Init.RepetitionCounter = 0;
htim8.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
if (HAL_TIM_Base_Init(&htim8) != HAL_OK) {
	Error_Handler();
}
sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
if (HAL_TIM_ConfigClockSource(&htim8, &sClockSourceConfig) != HAL_OK) {
	Error_Handler();
}
sMasterConfig.MasterOutputTrigger = TIM_TRGO_UPDATE;
sMasterConfig.MasterOutputTrigger2 = TIM_TRGO2_RESET;
sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
if (HAL_TIMEx_MasterConfigSynchronization(&htim8, &sMasterConfig) != HAL_OK) {
	Error_Handler();
}
/* USER CODE BEGIN TIM8_Init 2 */

/* USER CODE END TIM8_Init 2 */

}

/**
 * @brief USART2 Initialization Function
 * @param None
 * @retval None
 */
static void MX_USART2_UART_Init(void) {

/* USER CODE BEGIN USART2_Init 0 */

/* USER CODE END USART2_Init 0 */

/* USER CODE BEGIN USART2_Init 1 */

/* USER CODE END USART2_Init 1 */
huart2.Instance = USART2;
huart2.Init.BaudRate = 10000000;
huart2.Init.WordLength = UART_WORDLENGTH_8B;
huart2.Init.StopBits = UART_STOPBITS_1;
huart2.Init.Parity = UART_PARITY_NONE;
huart2.Init.Mode = UART_MODE_TX_RX;
huart2.Init.HwFlowCtl = UART_HWCONTROL_NONE;
huart2.Init.OverSampling = UART_OVERSAMPLING_16;
huart2.Init.OneBitSampling = UART_ONE_BIT_SAMPLE_DISABLE;
huart2.Init.ClockPrescaler = UART_PRESCALER_DIV1;
huart2.AdvancedInit.AdvFeatureInit = UART_ADVFEATURE_NO_INIT;
if (HAL_UART_Init(&huart2) != HAL_OK) {
	Error_Handler();
}
if (HAL_UARTEx_SetTxFifoThreshold(&huart2, UART_TXFIFO_THRESHOLD_1_8)
		!= HAL_OK) {
	Error_Handler();
}
if (HAL_UARTEx_SetRxFifoThreshold(&huart2, UART_RXFIFO_THRESHOLD_8_8)
		!= HAL_OK) {
	Error_Handler();
}
if (HAL_UARTEx_EnableFifoMode(&huart2) != HAL_OK) {
	Error_Handler();
}
/* USER CODE BEGIN USART2_Init 2 */

/* USER CODE END USART2_Init 2 */

}

/**
 * Enable DMA controller clock
 */
static void MX_DMA_Init(void) {

/* DMA controller clock enable */
__HAL_RCC_DMAMUX1_CLK_ENABLE();
__HAL_RCC_DMA1_CLK_ENABLE();

/* DMA interrupt init */
/* DMA1_Channel1_IRQn interrupt configuration */
HAL_NVIC_SetPriority(DMA1_Channel1_IRQn, 0, 0);
HAL_NVIC_EnableIRQ(DMA1_Channel1_IRQn);
/* DMA1_Channel2_IRQn interrupt configuration */
HAL_NVIC_SetPriority(DMA1_Channel2_IRQn, 0, 0);
HAL_NVIC_EnableIRQ(DMA1_Channel2_IRQn);
/* DMA1_Channel3_IRQn interrupt configuration */
HAL_NVIC_SetPriority(DMA1_Channel3_IRQn, 0, 0);
HAL_NVIC_EnableIRQ(DMA1_Channel3_IRQn);

}

/**
 * @brief GPIO Initialization Function
 * @param None
 * @retval None
 */
static void MX_GPIO_Init(void) {

/* GPIO Ports Clock Enable */
__HAL_RCC_GPIOF_CLK_ENABLE();
__HAL_RCC_GPIOA_CLK_ENABLE();

}

/* USER CODE BEGIN 4 */
//------------------------------------------------
void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef *AdcHandle) {
//  HAL_UART_Transmit(&huart2, (uint8_t*) &FrameHeader, 2, 0xFFFF);
HAL_UART_Transmit(&huart2, (uint8_t*) &ADC1ConvertedData,
ADC_CONVERTED_DATA_BUFFER_SIZE * 2, 0xFFFF);
//  HAL_UART_Transmit(&huart2, (uint8_t*) &FrameTerm, 2, 0xFFFF);
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart) {

CommFlag = 1;
Channel = (RxBuffer[2] << 8) | RxBuffer[1];
if (Channel == 0) {
	Ch1_Amp = (RxBuffer[4] << 8) | RxBuffer[3];
	Ch1_Freq = (RxBuffer[6] << 8) | RxBuffer[5];
	Ch1_Phrase = (RxBuffer[8] << 8) | RxBuffer[7];
	Ch1_Har3 = (RxBuffer[10] << 8) | RxBuffer[9];
	Ch1_Har5 = (RxBuffer[12] << 8) | RxBuffer[11];
	Ch1_Har7 = (RxBuffer[14] << 8) | RxBuffer[13];
	Ch1_Har9 = (RxBuffer[16] << 8) | RxBuffer[15];
	Ch1_Type = (RxBuffer[18] << 8) | RxBuffer[17];
} else if (Channel == 1) {
	Ch2_Amp = (RxBuffer[4] << 8) | RxBuffer[3];
	Ch2_Freq = (RxBuffer[6] << 8) | RxBuffer[5];
	Ch2_Phrase = (RxBuffer[8] << 8) | RxBuffer[7];
	Ch2_Har3 = (RxBuffer[10] << 8) | RxBuffer[9];
	Ch2_Har5 = (RxBuffer[12] << 8) | RxBuffer[11];
	Ch2_Har7 = (RxBuffer[14] << 8) | RxBuffer[13];
	Ch2_Har9 = (RxBuffer[16] << 8) | RxBuffer[15];
	Ch2_Type = (RxBuffer[18] << 8) | RxBuffer[17];
}

HAL_UART_Receive_IT(&huart2, (uint8_t*) RxBuffer, RXBUFFERSIZE);
}

//------------------------------------------------

/* USER CODE END 4 */

/**
 * @brief  This function is executed in case of error occurrence.
 * @retval None
 */
void Error_Handler(void) {
/* USER CODE BEGIN Error_Handler_Debug */
/* User can add his own implementation to report the HAL error return state */
__disable_irq();
while (1) {
}
/* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
