#include "NTC.h"
#include "sysUtils.h"
#include "GPIO.h"
#include "ADC.h"


void NTC_init()
{
	// Make sure the NTC is off
	GPIO_NTC_off();

	// Select only NTC on ADC
	ADC_selectNTC_Channel();
}


uint32_t NTC_getTemp()
{
	// Turn NTC power on
	GPIO_NTC_on();

	// Start ADC
	ADC_start();

	// Delay 1 ms
	delay_ms(1);

	// Getting adc value.
	// Obs: Oversampling done by hardware
	uint32_t adc_temp = 0;

	adc_temp = ADC_getTemp();

	// Turn NTC power off
	GPIO_NTC_off();

	// Stop ADC (?)
	ADC_stop();

	// Return value
	return adc_temp;
}





