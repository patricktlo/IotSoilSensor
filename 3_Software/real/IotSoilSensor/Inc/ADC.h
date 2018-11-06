#include "main.h"


typedef enum _sensor_type_t{
	SENSOR_NTC=0,
	SENSOR_HR202=1,
	SENSOR_MS=2
} sensor_type_t ;

void ADC_start();
void ADC_stop();

void ADC_selectSensor(sensor_type_t sensor);

uint16_t ADC_getValue();

void ADC_calibrate();

