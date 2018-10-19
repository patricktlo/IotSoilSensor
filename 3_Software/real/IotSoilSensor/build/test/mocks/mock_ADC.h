#ifndef mock_ADC_H
#define mock_ADC_H

#include "fff.h"
#include "fff_unity_helper.h"
#include "ADC.h"


DECLARE_FAKE_VOID_FUNC0(ADC_start);
DECLARE_FAKE_VOID_FUNC0(ADC_stop);
DECLARE_FAKE_VALUE_FUNC0(uint32_t, ADC_getTemp);

void mock_ADC_Init(void);
void mock_ADC_Verify(void);
void mock_ADC_Destroy(void);

#endif // mock_ADC_H
