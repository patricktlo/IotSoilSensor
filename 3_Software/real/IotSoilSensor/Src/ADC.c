#include "main.h"
#include "ADC.h"
#include "stm32l0xx_hal.h"

extern ADC_HandleTypeDef hadc;
extern uint32_t ADCVAL;

void ADC_start()
{
	HAL_ADC_Start(&hadc);

	while ( (ADC1->ISR & ADC_ISR_ADRDY) == 0 ) {}

	delay_ms(1);
}

void ADC_start_IT()
{
	HAL_ADC_Start_IT(&hadc);

	//while ( (ADC1->ISR & ADC_ISR_ADRDY) == 0 ) {}

	delay_ms(1);
}

void ADC_stop()
{
	HAL_ADC_Stop(&hadc);
}

void ADC_stop_IT()
{
	HAL_ADC_Stop_IT(&hadc);
}

void ADC_selectSensor(sensor_type_t sensor)
{

	if (sensor == SENSOR_NTC)
	{
		// Selecting only NTC channel for conversion
		ADC1->CHSELR = ADC_CHSELR_CHSEL7;

		// Chose sampling time
		ADC1->SMPR = 0b110;

		// Select oversampling 16x and 4-bit right shift
		ADC1->CFGR2 |= ADC_CFGR2_OVSR_0 | ADC_CFGR2_OVSR_1 | ADC_CFGR2_OVSS_2 | ADC_CFGR2_OVSE ;

		// deselect hardware trigger
		// hardware trigger on rising edge
		ADC1->CFGR1 &= ~ ADC_CFGR1_EXTEN_0;
		ADC1->CFGR1 &= ~ ADC_CFGR1_EXTSEL_2;
	}

	if (sensor == SENSOR_HR202)
	{
		// Selecting only NTC channel for conversion
		ADC1->CHSELR = ADC_CHSELR_CHSEL9;

		// Chose sampling time
		ADC1->SMPR = 0b110;

		// Select oversampling 16x and 4-bit right shift
		ADC1->CFGR2 |= ADC_CFGR2_OVSR_0 | ADC_CFGR2_OVSR_1 | ADC_CFGR2_OVSS_2 | ADC_CFGR2_OVSE ;
		//ADC1->CFGR2 |= ADC_CFGR2_OVSR_0 | ADC_CFGR2_OVSS_1 | ADC_CFGR2_OVSE ;

		// hardware trigger on rising edge
		ADC1->CFGR1 |= ADC_CFGR1_EXTEN_0 | ADC_CFGR1_EXTSEL_2;

	}

	if (sensor == SENSOR_MS)
	{
		// TODO
	}

}

uint32_t ADC_getValue()
{
	uint32_t adcval;
	HAL_ADC_PollForConversion(&hadc, 100);
	adcval = HAL_ADC_GetValue(&hadc);
	return adcval;
}

uint32_t ADC_getValue_IT()
{
	return HAL_ADC_GetValue(&hadc);
}

void ADC_calibrate()
{
	// Calibrate ADC
	ADC1->CR |= ADC_CR_ADCAL;
	while ( (ADC1->CR & ADC_CR_ADCAL) != 0 ) {}
}

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc)
{
	UNUSED(hadc);

	ADCVAL = ADC_getValue_IT();

	ADCVAL |= 0x10000000;

//	HAL_GPIO_TogglePin(GPIOA, GPIO_PIN_9);
}
