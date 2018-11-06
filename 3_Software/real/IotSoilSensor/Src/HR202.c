#include "HR202.h"
#include "GPIO.h"
#include "ADC.h"
#include "timer.h"
#include "sysUtils.h"

static const uint16_t HR202_PERIOD_WAIT_GETMEASURE = 4000;  // TODO: 0.25 ms

#define MAX(x, y) (((x) > (y)) ? (x) : (y))
#define MIN(x, y) (((x) < (y)) ? (x) : (y))

hr202_values_t HR202_getRH(){

	uint32_t adc_rh[2];

	// Select ADC channel and oversampling rate
	ADC_selectSensor(SENSOR_HR202);

	// Start ADC
	ADC_start();

	// Power on resistor bridge
	GPIO_HR202_on();

	// Reset timer
	timer_HR202_reset();

	// Start square wave
	timer_HR202_start_square();

	for (uint32_t i=0; i<2; i++){

		// Wait for signal change
		while ( timer_HR202_checkToggle() == false ) {}

		// Wait 0.25 ms to get measurements
		while ( (timer_HR202_getTimer() < HR202_PERIOD_WAIT_GETMEASURE) &&
				(timer_HR202_getTimer() > HR202_PERIOD_WAIT_GETMEASURE + 1000) ) {}

		// measurements must take < 0.25 ms
		adc_rh[i] = ADC_getValue();
	}

	// Stop ADC
	ADC_stop();

	// Stop square wave
	timer_HR202_stop_square();

	// Power off resistor bridge
	GPIO_HR202_off();

	// Do signal processing.
	int32_t M1, M2;

	// M1: value of adc when square wave is 1, M2: value of adc when square wave is 0
	M1 = MAX(adc_rh[0], adc_rh[1]);
	M2 = MIN(adc_rh[0], adc_rh[1]);

	M1 = M1 - (2^16);
	M2 = M2 - (2^16);

	adc_rh[0] = (M1 - M2)/2;

	hr202_values_t retVal;
	retVal.errorCode = NO_ERROR;

	if ( M2 > 0 ) // Error! it should be negative
	{
		// todo error handling
		retVal.errorCode = HR202_M2POSITIVE;
	}

	retVal.average = adc_rh[0];

	// return value
	return retVal;
}
