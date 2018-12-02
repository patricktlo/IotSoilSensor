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
	HAL_GPIO_WritePin(PWR_RH_COMP_GPIO_Port, PWR_RH_COMP_Pin, GPIO_PIN_SET);
}

void GPIO_HR202_off()
{
	HAL_GPIO_WritePin(PWR_RH_COMP_GPIO_Port, PWR_RH_COMP_Pin, GPIO_PIN_RESET);
}

void GPIO_HR202_timer_off()
{
	HAL_GPIO_WritePin(PWR_RH_GPIO_Port, PWR_RH_Pin, GPIO_PIN_RESET);
}

void GPIO_MS_on()
{
	HAL_GPIO_WritePin(PWR_MS_COMP_GPIO_Port, PWR_MS_COMP_Pin, GPIO_PIN_SET);
}

void GPIO_MS_off()
{
	HAL_GPIO_WritePin(PWR_MS_COMP_GPIO_Port, PWR_MS_COMP_Pin, GPIO_PIN_RESET);
}

void GPIO_MS_timer_off()
{
	HAL_GPIO_WritePin(PWR_MS_GPIO_Port, PWR_MS_Pin, GPIO_PIN_RESET);
}

void GPIO_userLed_on()
{
	HAL_GPIO_WritePin(userLED_GPIO_Port, userLED_Pin, GPIO_PIN_RESET);
}

void GPIO_userLed_off()
{
	HAL_GPIO_WritePin(userLED_GPIO_Port, userLED_Pin, GPIO_PIN_SET);
}
