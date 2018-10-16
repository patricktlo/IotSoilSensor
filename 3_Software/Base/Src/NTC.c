/*
 * NTC.c
 *
 *  Created on: 7 de out de 2018
 *      Author: patrick
 */

#include <main.h>
#include "stm32f1xx_hal.h"

// Define constants

const uint32_t ADC_POLL_TIMEOUT = 1000;


// Define externals

extern ADC_HandleTypeDef hadc1;

#if 0
uint32_t NTC_gettemperature()
{
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_3, GPIO_PIN_SET);
	HAL_Delay(1);

	HAL_ADC_Start(&hadc1);


	for (int i=0; i<16; i++)
	{
		HAL_ADC_PollForConversion(&hadc1, 10);
		adcValue += HAL_ADC_GetValue(&hadc1);
	}

	adcValue /= 16;

	HAL_ADC_PollForConversion(&hadc1, 100);
	adcValue = HAL_ADC_GetValue(&hadc1);

	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_3, GPIO_PIN_RESET);

	// Send over uart
	char output[25];

	sprintf(output, "%lu\r\n", adcValue);

	HAL_UART_Transmit(&huart1, &output, strlen(output)+1, 100);

	HAL_ADC_Stop(&hadc1);

	HAL_GPIO_TogglePin(GPIOC, GPIO_PIN_13);

	HAL_Delay(1000);
}
#endif




