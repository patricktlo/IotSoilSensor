#include "MoistureSensor.h"

#define COMP_MEASURES	8

void MS_init()
{
	// Turn timer off
	timer_MS_init();

	// Turn comp off
	COMP_init();

}

uint32_t MS_getMS()
{
	uint32_t countValue[2];

	// Turn on Comp
	COMP_start();

	// Reset timer
	timer_MS_reset();

	// Start square wave
	timer_MS_start_square();

	uint32_t lastCompValue = COMP_getOutput();

	for (uint32_t i=0; i<COMP_MEASURES; i++)
	{
		for (uint32_t j=0; j<2; j++)
		{
			// poll comparator
			while ( COMP_getOutput() == lastCompValue ) {}

			// Save timer count
			countValue[lastCompValue] += timer_MS_getTimer();

			// Save current state
			lastCompValue = COMP_getOutput();
		}
	}

	// Do average for both
	for (uint32_t i=0; i<2; i++)
	{
		countValue[i] = countValue[i]/COMP_MEASURES;
	}

	return ( (countValue[0] & 0xffff) || ((countValue[1] & 0xffff) << 16) );
}
