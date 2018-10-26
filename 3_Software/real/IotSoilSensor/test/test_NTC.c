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

	// NTC GPIO ON
	TEST_ASSERT_EQUAL_PTR((void*)GPIO_NTC_on , fff.call_history[0]);

	// Start ADC
	TEST_ASSERT_EQUAL_PTR((void*)ADC_start , fff.call_history[1]);

	// Delay call
	TEST_ASSERT_EQUAL_PTR((void*)delay_ms , fff.call_history[2]);
	TEST_ASSERT_EQUAL(1, delay_ms_fake.arg0_val);
}

void test_NTC_init()
{
	NTC_init();

	// NTC GPIO OFF
	TEST_ASSERT_EQUAL_PTR((void*)GPIO_NTC_off , fff.call_history[0]);

	// Select NTC channel
	TEST_ASSERT_EQUAL_PTR((void*)ADC_selectNTC_Channel, fff.call_history[1]);

}

void test_NTC_getTemp_returnValue(void)
{
	const uint32_t adc_value = 2100;


	// Given
	ADC_getTemp_fake.return_val = adc_value;

	// When
	uint32_t retVal = NTC_getTemp();

	// Then
	TEST_ASSERT_EQUAL(2100 , retVal);

}


