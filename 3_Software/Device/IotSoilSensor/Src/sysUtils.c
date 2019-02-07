#include "sysUtils.h"
#include "stm32l0xx_hal.h"

void delay_ms(uint32_t time)
{
	HAL_Delay(time);
}
