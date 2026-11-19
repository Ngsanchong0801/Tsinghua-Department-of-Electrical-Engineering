/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2025 STMicroelectronics.
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
#include "stm32g4xx_hal.h"  // 主HAL头文件
#include "stm32g4xx_hal_adc.h"  // 明确包含ADC头文件
#include "stm32g4xx_hal_dac.h"  // DAC头文件
#include "stm32g4xx_hal_tim.h"  // TIM头文件
#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/* Private defines -----------------------------------------------------------*/
#define SAMPLE_COUNT 200
#define BASE_FREQ    50
#define PI           3.14159265358979323846f
#define ADC_BUFFER_SIZE (4*SAMPLE_COUNT)
#define FFT_SIZE     256

// 谐波参数
#define DC_OFFSET    1.25f
#define BASE_AMP     0.5f
#define HARM3_RATIO  0.1f
#define HARM5_RATIO  0.05f
#define HARM7_RATIO  0.03f
#define HARM9_RATIO  0.01f

/* Private variables ---------------------------------------------------------*/
DAC_HandleTypeDef hdac1;
ADC_HandleTypeDef hadc1;
TIM_HandleTypeDef htim6;

uint16_t waveform[SAMPLE_COUNT];
uint16_t adcBuffer[ADC_BUFFER_SIZE];
volatile uint8_t adcReady = 0;
float fftInput[FFT_SIZE];
float fftOutput[FFT_SIZE/2];

typedef struct {
    float dc;
    float fundamental;
    float harmonics[9];
    float freq;
} HarmonicAnalysis;

HarmonicAnalysis analysisResult;

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DAC1_Init(void);
static void MX_ADC1_Init(void);
static void MX_TIM6_Init(void);
void GenerateWaveform(void);
void ProcessADCData(uint16_t* data, uint32_t size);
void PerformFFT(float* input, float* output, uint16_t size);
void AnalyzeHarmonics(float* fftData, uint16_t size, float samplingRate, HarmonicAnalysis* result);
float FindFundamentalFrequency(float* fftData, uint16_t size, float samplingRate);
void SendAnalysisResults(HarmonicAnalysis* result);

/* USER CODE BEGIN 0 */

void GenerateWaveform(void)
{
    for(int i = 0; i < SAMPLE_COUNT; i++) {
        float theta = 2 * PI * i / SAMPLE_COUNT;
        float value = DC_OFFSET +
                     BASE_AMP * sinf(theta) +
                     BASE_AMP * HARM3_RATIO * sinf(3 * theta) +
                     BASE_AMP * HARM5_RATIO * sinf(5 * theta) +
                     BASE_AMP * HARM7_RATIO * sinf(7 * theta) +
                     BASE_AMP * HARM9_RATIO * sinf(9 * theta);

        waveform[i] = (uint16_t)((value / 3.3f) * 4095);
        waveform[i] = (waveform[i] > 4095) ? 4095 : waveform[i];
    }
}

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{
    adcReady = 1;
    ProcessADCData(adcBuffer, ADC_BUFFER_SIZE);
}

void ProcessADCData(uint16_t* data, uint32_t size)
{
    uint32_t copySize = (size > FFT_SIZE) ? FFT_SIZE : size;
    for(uint32_t i = 0; i < copySize; i++) {
        fftInput[i] = (data[i] / 4095.0f) * 3.3f;
    }

    PerformFFT(fftInput, fftOutput, FFT_SIZE);
    AnalyzeHarmonics(fftOutput, FFT_SIZE/2, BASE_FREQ * SAMPLE_COUNT, &analysisResult);
    SendAnalysisResults(&analysisResult);
}

void PerformFFT(float* input, float* output, uint16_t size)
{
    float sum = 0;
    for(uint16_t i = 0; i < size; i++) {
        sum += input[i];
    }
    output[0] = sum / size;

    for(uint16_t k = 1; k < size/2; k++) {
        float re = 0, im = 0;
        for(uint16_t n = 0; n < size; n++) {
            float angle = 2 * PI * k * n / size;
            re += input[n] * cosf(angle);
        }
        output[k] = 2 * sqrtf(re*re + im*im) / size;
    }
}

void AnalyzeHarmonics(float* fftData, uint16_t size, float samplingRate, HarmonicAnalysis* result)
{
    result->freq = FindFundamentalFrequency(fftData, size, samplingRate);
    result->dc = fftData[0];

    float freqResolution = samplingRate / FFT_SIZE;
    uint16_t fundamentalBin = (uint16_t)(result->freq / freqResolution);

    for(uint8_t h = 1; h <= 9; h++) {
        uint16_t bin = fundamentalBin * h;
        result->harmonics[h-1] = (bin < size) ? fftData[bin] : 0;
    }
    result->fundamental = result->harmonics[0];
}

float FindFundamentalFrequency(float* fftData, uint16_t size, float samplingRate)
{
    float maxAmp = 0;
    uint16_t maxBin = 0;
    float freqResolution = samplingRate / FFT_SIZE;

    uint16_t startBin = (uint16_t)(40 / freqResolution);
    uint16_t endBin = (uint16_t)(60 / freqResolution);
    endBin = (endBin > size) ? size : endBin;

    for(uint16_t i = startBin; i < endBin; i++) {
        if(fftData[i] > maxAmp) {
            maxAmp = fftData[i];
            maxBin = i;
        }
    }
    return maxBin * freqResolution;
}

void SendAnalysisResults(HarmonicAnalysis* result)
{
    char buffer[128];
    sprintf(buffer, "Frequency: %.2f Hz\r\n", result->freq);
    // HAL_UART_Transmit(&huart1, (uint8_t*)buffer, strlen(buffer), HAL_MAX_DELAY);

    sprintf(buffer, "DC Offset: %.3f V\r\n", result->dc);
    // HAL_UART_Transmit(&huart1, (uint8_t*)buffer, strlen(buffer), HAL_MAX_DELAY);

    sprintf(buffer, "Fundamental: %.3f V\r\n", result->fundamental);
    // HAL_UART_Transmit(&huart1, (uint8_t*)buffer, strlen(buffer), HAL_MAX_DELAY);

    for(uint8_t h = 1; h < 9; h++) {
        sprintf(buffer, "Harmonic %d: %.3f V (%.1f%%)\r\n",
               h+1, result->harmonics[h],
               (result->harmonics[h]/result->fundamental)*100);
        // HAL_UART_Transmit(&huart1, (uint8_t*)buffer, strlen(buffer), HAL_MAX_DELAY);
    }
}

/* USER CODE END 0 */

int main(void)
{
    HAL_Init();
    SystemClock_Config();
    MX_GPIO_Init();
    MX_DAC1_Init();
    MX_ADC1_Init();
    MX_TIM6_Init();

    GenerateWaveform();
    HAL_DAC_Start_DMA(&hdac1, DAC_CHANNEL_1, (uint32_t*)waveform, SAMPLE_COUNT, DAC_ALIGN_12B_R);
    HAL_ADC_Start_DMA(&hadc1, (uint32_t*)adcBuffer, ADC_BUFFER_SIZE);
    HAL_TIM_Base_Start(&htim6);

    while (1) {
        if(adcReady) {
            adcReady = 0;
        }
    }
}

void SystemClock_Config(void)
{
    RCC_OscInitTypeDef RCC_OscInitStruct = {0};
    RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

    HAL_PWREx_ControlVoltageScaling(PWR_REGULATOR_VOLTAGE_SCALE1);

    RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
    RCC_OscInitStruct.HSIState = RCC_HSI_ON;
    RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
    RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
    HAL_RCC_OscConfig(&RCC_OscInitStruct);

    RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                                |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
    RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
    RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
    RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
    RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV1;
    HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0);
}

static void MX_GPIO_Init(void)
{
    __HAL_RCC_GPIOA_CLK_ENABLE();

    GPIO_InitTypeDef GPIO_InitStruct = {0};
    GPIO_InitStruct.Pin = GPIO_PIN_1;
    GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
}

static void MX_DAC1_Init(void)
{
    DAC_ChannelConfTypeDef sConfig = {0};

    hdac1.Instance = DAC1;
    HAL_DAC_Init(&hdac1);

    sConfig.DAC_SampleAndHold = DAC_SAMPLEANDHOLD_DISABLE;
    sConfig.DAC_Trigger = DAC_TRIGGER_T6_TRGO;
    sConfig.DAC_OutputBuffer = DAC_OUTPUTBUFFER_ENABLE;
    sConfig.DAC_ConnectOnChipPeripheral = DAC_CHIPCONNECT_DISABLE;
    sConfig.DAC_UserTrimming = DAC_TRIMMING_FACTORY;
    HAL_DAC_ConfigChannel(&hdac1, &sConfig, DAC_CHANNEL_1);
}

static void MX_ADC1_Init(void)
{
    ADC_ChannelConfTypeDef sConfig = {0};

    hadc1.Instance = ADC1;
    hadc1.Init.ClockPrescaler = ADC_CLOCK_ASYNC_DIV1;
    hadc1.Init.Resolution = ADC_RESOLUTION_12B;
    hadc1.Init.ScanConvMode = ADC_SCAN_DISABLE;
    hadc1.Init.ContinuousConvMode = DISABLE;
    hadc1.Init.DiscontinuousConvMode = DISABLE;
    hadc1.Init.ExternalTrigConv = ADC_EXTERNALTRIG_T6_TRGO;
    hadc1.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_RISING;
    hadc1.Init.DMAContinuousRequests = ENABLE;
    hadc1.Init.Overrun = ADC_OVR_DATA_OVERWRITTEN;
    hadc1.Init.OversamplingMode = DISABLE;
    HAL_ADC_Init(&hadc1);

    sConfig.Channel = ADC_CHANNEL_1;
    sConfig.Rank = ADC_REGULAR_RANK_1;
    sConfig.SamplingTime = ADC_SAMPLETIME_247CYCLES_5;
    sConfig.SingleDiff = ADC_SINGLE_ENDED;
    sConfig.OffsetNumber = ADC_OFFSET_NONE;
    sConfig.Offset = 0;
    HAL_ADC_ConfigChannel(&hadc1, &sConfig);
}

static void MX_TIM6_Init(void)
{
    TIM_MasterConfigTypeDef sMasterConfig = {0};

    htim6.Instance = TIM6;
    htim6.Init.Prescaler = 0;
    htim6.Init.CounterMode = TIM_COUNTERMODE_UP;
    htim6.Init.Period = 1599;
    htim6.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
    HAL_TIM_Base_Init(&htim6);

    sMasterConfig.MasterOutputTrigger = TIM_TRGO_UPDATE;
    sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
    HAL_TIMEx_MasterConfigSynchronization(&htim6, &sMasterConfig);
}

void Error_Handler(void)
{
    __disable_irq();
    while (1) {}
}

#ifdef USE_FULL_ASSERT
void assert_failed(uint8_t *file, uint32_t line)
{
    while (1) {}
}
#endif
