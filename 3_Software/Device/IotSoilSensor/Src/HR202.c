#include "HR202.h"
#include "GPIO.h"
#include "ADC.h"
#include "timer.h"
#include "sysUtils.h"
#include "stm32l0xx_hal.h"
#include "stm32l0xx_hal_adc.h"

volatile uint32_t ADCVAL = 0;

#define MAX(x, y) (((x) > (y)) ? (x) : (y))
#define MIN(x, y) (((x) < (y)) ? (x) : (y))

void HR202_init()
{
	// turn off timer pin
	GPIO_HR202_timer_off();
}

uint32_t HR202_getRH(){

	uint32_t adc_rh[4];

	// Select ADC channel and oversampling rate
	ADC_selectSensor(SENSOR_HR202);

	// Power on resistor bridge
	GPIO_HR202_on();

	// Start ADC
	ADC_start_IT();

	// timer init
	timer_HR202_init();

	// Reset timer
	timer_HR202_reset();

	// Start square wave
	timer_HR202_start_square();

	// Wait for adc values to arrive (via interrupt)
	for (uint32_t i=0; i<4; i++){

		while( (ADCVAL&0x10000000) == 0 ) {}

		adc_rh[i] = ADCVAL&0xffff;
		ADCVAL = 0;
	}

	// Power off resistor bridge
	GPIO_HR202_off();

	// turn off timer pin
	GPIO_HR202_timer_off();

	// Stop square wave
	timer_HR202_stop_square();

	// Stop ADC
	ADC_stop_IT();

	// Average terms and put into one 32 bit variable
	uint32_t average_h, average_l;
	average_h = (adc_rh[0] + adc_rh[2])/2;
	average_l = (adc_rh[1] + adc_rh[3])/2;

	uint32_t retval = ( ( average_h << 12 ) + ( average_l ) );

	// return value
	return retval;
}

