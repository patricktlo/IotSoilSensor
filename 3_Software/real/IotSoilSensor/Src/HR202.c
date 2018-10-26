#if 0
#include "HR202.h"
#include "GPIO.h"
#include "ADC.h"
#include "timer.h"
#include "sysUtils.h"

static const uint16_t HR202_PERIOD_WAIT_GETMEASURE = 100;  // TODO: 0.25 ms
static const uint16_t HR202_AVERAGE_ADC = 16;
static const uint16_t HR202_NUMBER_MEASURES = 4;


uint32_t HR202_getRH(){

	// Power on resistor bridge
	GPIO_HR202_bridge_on();

	// Start ADC
	ADC_start();

	// Start square wave
	timer_HR202_start_square();

	hr202_value_t measured_values;
	for (uint32_t i=0; i < HR202_NUMBER_MEASURES; i++)
	{
		measured_values = HR202_getADC();

	}

	// Stop ADC
	ADC_stop();

	// Stop square wave
	timer_HR202_stop_square();

	// Power off resistor bridge
	GPIO_HR202_bridge_off();

	// Do average
	adc_rh = adc_rh / HR202_AVERAGE_ADC;

	hr202_values_t retVal;

	retVal.average = adc_rh;
	// estimate variance

	// return value
	return retVal;
}

hr202_values_t HR202_getADC()
{
	// while not interrupt
	/// wait

	// Wait for
	while ( timer_HR202_getTimer() < HR202_SQUAREW_PERIOD ) {}

	// measurements must take < 0.25 ms
	uint32_t adc_rh = 0;
	for (uint32_t i=0; i < HR202_AVERAGE_ADC; i++)
	{
		adc_rh += ADC_getHR202();

		// TODO: estimate variance
	}

}

#endif
