#include "build/temp/_test_NTC.c"
#include "mock_sysUtils.h"
#include "mock_ADC.h"
#include "mock_GPIO.h"
#include "NTC.h"
#include "unity.h"


void setUp(void)

{

}



void tearDown(void)

{

}

void test_NTC_getTemp(void)

{

 NTC_getTemp();





 UnityAssertEqualNumber((UNITY_INT64)(((void*)GPIO_NTC_on)), (UNITY_INT64)((fff.call_history[0])), (

((void *)0)

), (UNITY_UINT)(19), UNITY_DISPLAY_STYLE_HEX64);





 UnityAssertEqualNumber((UNITY_INT64)(((void*)ADC_start)), (UNITY_INT64)((fff.call_history[1])), (

((void *)0)

), (UNITY_UINT)(22), UNITY_DISPLAY_STYLE_HEX64);





 UnityAssertEqualNumber((UNITY_INT64)(((void*)delay_ms)), (UNITY_INT64)((fff.call_history[2])), (

((void *)0)

), (UNITY_UINT)(25), UNITY_DISPLAY_STYLE_HEX64);

 UnityAssertEqualNumber((UNITY_INT)((1)), (UNITY_INT)((delay_ms_fake.arg0_val)), (

((void *)0)

), (UNITY_UINT)(26), UNITY_DISPLAY_STYLE_INT);

}



void test_NTC_init()

{

 NTC_init();





 UnityAssertEqualNumber((UNITY_INT64)(((void*)GPIO_NTC_off)), (UNITY_INT64)((fff.call_history[0])), (

((void *)0)

), (UNITY_UINT)(34), UNITY_DISPLAY_STYLE_HEX64);





 UnityAssertEqualNumber((UNITY_INT64)(((void*)ADC_selectNTC_Channel)), (UNITY_INT64)((fff.call_history[1])), (

((void *)0)

), (UNITY_UINT)(37), UNITY_DISPLAY_STYLE_HEX64);



}



void test_NTC_getTemp_returnValue(void)

{

 const uint32_t adc_value = 2100;







 ADC_getTemp_fake.return_val = adc_value;





 uint32_t retVal = NTC_getTemp();





 UnityAssertEqualNumber((UNITY_INT)((2100)), (UNITY_INT)((retVal)), (

((void *)0)

), (UNITY_UINT)(53), UNITY_DISPLAY_STYLE_INT);



}
