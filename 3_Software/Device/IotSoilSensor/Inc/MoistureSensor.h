#ifndef _MOISTURESENSOR_H
#define _MOISTURESENSOR_H

#include "main.h"
#include "GPIO.h"
#include "ADC.h"
#include "timer.h"
#include "sysUtils.h"
#include "COMP.h"

void MS_init();

uint32_t MS_getMS();



#endif // _MOISTURESENSOR_H
