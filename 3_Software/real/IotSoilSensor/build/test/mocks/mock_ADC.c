#include <string.h>
#include "fff.h"
#include "mock_ADC.h"

DEFINE_FAKE_VOID_FUNC0(ADC_start);
DEFINE_FAKE_VOID_FUNC0(ADC_stop);
DEFINE_FAKE_VOID_FUNC0(ADC_selectNTC_Channel);
DEFINE_FAKE_VALUE_FUNC0(uint16_t, ADC_getTemp);
DEFINE_FAKE_VALUE_FUNC0(uint16_t, ADC_getHR202);
DEFINE_FAKE_VOID_FUNC0(ADC_calibrate);

void mock_ADC_Init(void)
{
    FFF_RESET_HISTORY();
    RESET_FAKE(ADC_start)
    RESET_FAKE(ADC_stop)
    RESET_FAKE(ADC_selectNTC_Channel)
    RESET_FAKE(ADC_getTemp)
    RESET_FAKE(ADC_getHR202)
    RESET_FAKE(ADC_calibrate)
}
void mock_ADC_Verify(void)
{
}
void mock_ADC_Destroy(void)
{
}
