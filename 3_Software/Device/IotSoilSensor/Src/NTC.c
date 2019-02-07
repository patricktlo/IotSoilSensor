#include "NTC.h"
#include "sysUtils.h"
#include "GPIO.h"
#include "ADC.h"


void NTC_init()
{
	// Make sure the NTC is off
	GPIO_NTC_off();
}


uint32_t NTC_getTemp()
{
	// Select only NTC on ADC
	ADC_selectSensor(SENSOR_NTC);

	// Turn NTC power on
	GPIO_NTC_on();

	delay_ms(1);

	// Start ADC
	ADC_start();

	// Getting adc value.
	// Obs: Oversampling done by hardware
	uint32_t adc_temp = 0;

	adc_temp = ADC_getValue();

	// Turn NTC power off
	GPIO_NTC_off();

	// Stop ADC (?)
	ADC_stop();

	// Return value
	return adc_temp;
}





