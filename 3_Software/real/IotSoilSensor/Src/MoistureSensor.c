#include "MoistureSensor.h"
#include "GPIO.h"
#include "stm32l0xx_hal.h"
#include "COMP.h"

#define COMP_MEASURES	(8)

void MS_init()
{
	// Turn timer off
	timer_MS_init();

	// Turn comp off
	COMP_init();
}

uint32_t MS_getMS()
{
	uint32_t countValue = 0;

	// Turn on bridge
	GPIO_MS_on();

	// Turn on Comp
	COMP_start();

	// Reset timer
	timer_MS_reset();

	// Start square wave
	timer_MS_start_square();

	uint32_t lastCompValue = COMP_getOutput();

	for (uint32_t i=0; i<COMP_MEASURES; i++)
	{
		// poll comparator
		while ( lastCompValue == COMP_getOutput() ) {
		}

		// Save timer count
		countValue += timer_MS_getTimer();
		// Save current state
		lastCompValue = COMP_getOutput();
	}
	// Turn off square
	timer_MS_stop_square();

	// Turn off bridge
	GPIO_MS_off();

	GPIO_MS_timer_off();

	countValue = countValue/COMP_MEASURES;

	return countValue;
}
