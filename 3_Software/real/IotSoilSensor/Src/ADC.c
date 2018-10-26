#include "ADC.h"
#include "stm32l0xx_hal.h"

extern ADC_HandleTypeDef hadc;

void ADC_start()
{
	HAL_ADC_Start(&hadc);

	while ( (ADC1->ISR & ADC_ISR_ADRDY) == 0 ) {}

}

void ADC_stop()
{
	HAL_ADC_Stop(&hadc);
}

void ADC_selectNTC_Channel()
{

	// Selecting only NTC channel for conversion
	ADC1->CHSELR = ADC_CHSELR_CHSEL7;

	// Select oversampling 16x
	ADC1->CFGR2 |= ADC_CFGR2_OVSR_0 | ADC_CFGR2_OVSR_1 | ADC_CFGR2_OVSS_2 | ADC_CFGR2_OVSE ;


}

void ADC_selectHR202_Channel()
{
	// Selecting only HR202 channel for conversion
	ADC1->CHSELR = ADC_CHSELR_CHSEL9;
}

uint16_t ADC_getTemp()
{
	HAL_ADC_PollForConversion(&hadc, 10);
	return HAL_ADC_GetValue(&hadc);
}

void ADC_calibrate()
{
	// Calibrate ADC
	ADC1->CR |= ADC_CR_ADCAL;
	while ( (ADC1->CR & ADC_CR_ADCAL) != 0 ) {}
}
