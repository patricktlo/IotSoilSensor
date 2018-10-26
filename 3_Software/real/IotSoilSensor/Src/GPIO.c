#include "GPIO.h"
#include "stm32l0xx_hal.h"
#include "main.h"


void GPIO_NTC_on()
{
	HAL_GPIO_WritePin(PWR_Temp_GPIO_Port, PWR_Temp_Pin, GPIO_PIN_SET);
}

void GPIO_NTC_off()
{
	HAL_GPIO_WritePin(PWR_Temp_GPIO_Port, PWR_Temp_Pin, GPIO_PIN_RESET);
}
