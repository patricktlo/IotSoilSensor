#include "unity.h"
#include "NTC.h"
#include "mock_GPIO.h"
#include "mock_ADC.h"
#include "mock_sysUtils.h"

void setUp(void)
{
}

void tearDown(void)
{
}

void test_NTC_getTemp(void)
{
	NTC_getTemp();

	TEST_ASSERT_EQUAL_PTR((void*)GPIO_NTC_On , fff.call_history[0]);
	//TEST_ASSERT_CALLED(GPIO_NTC_On);


}
