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

void GPIO_HR202_on()
{
	HAL_GPIO_WritePin(PWR_RH_GPIO_Port, PWR_RH_Pin, GPIO_PIN_SET);
	HAL_GPIO_WritePin(PWR_RH_COMP_GPIO_Port, PWR_RH_COMP_Pin, GPIO_PIN_SET);
}

void GPIO_HR202_off()
{
	HAL_GPIO_WritePin(PWR_RH_GPIO_Port, PWR_RH_Pin, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(PWR_RH_COMP_GPIO_Port, PWR_RH_COMP_Pin, GPIO_PIN_RESET);
}
