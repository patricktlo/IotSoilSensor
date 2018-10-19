#include <string.h>
#include "fff.h"
#include "mock_ADC.h"

DEFINE_FAKE_VOID_FUNC0(ADC_start);
DEFINE_FAKE_VOID_FUNC0(ADC_stop);
DEFINE_FAKE_VALUE_FUNC0(uint32_t, ADC_getTemp);

void mock_ADC_Init(void)
{
    FFF_RESET_HISTORY();
    RESET_FAKE(ADC_start)
    RESET_FAKE(ADC_stop)
    RESET_FAKE(ADC_getTemp)
}
void mock_ADC_Verify(void)
{
}
void mock_ADC_Destroy(void)
{
}
