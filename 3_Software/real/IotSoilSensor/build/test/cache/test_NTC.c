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



 UnityAssertEqualNumber((UNITY_INT64)(((void*)GPIO_NTC_On)), (UNITY_INT64)((fff.call_history[0])), (

((void *)0)

), (UNITY_UINT)(19), UNITY_DISPLAY_STYLE_HEX64);







}
