#include "main.h"

typedef enum _sensor_type_t{
	SENSOR_NTC=0,
	SENSOR_HR202=1,
	SENSOR_MS=2
} sensor_type_t ;

void ADC_start();
void ADC_start_IT();
void ADC_stop();
void ADC_stop_IT();

void ADC_selectSensor(sensor_type_t sensor);

uint32_t ADC_getValue();
uint32_t ADC_getValue_IT();

void ADC_calibrate();

