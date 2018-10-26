#ifndef mock_GPIO_H
#define mock_GPIO_H

#include "fff.h"
#include "fff_unity_helper.h"
#include "GPIO.h"


DECLARE_FAKE_VOID_FUNC0(GPIO_NTC_on);
DECLARE_FAKE_VOID_FUNC0(GPIO_NTC_off);
DECLARE_FAKE_VOID_FUNC0(GPIO_HR202_bridge_on);
DECLARE_FAKE_VOID_FUNC0(GPIO_HR202_bridge_off);

void mock_GPIO_Init(void);
void mock_GPIO_Verify(void);
void mock_GPIO_Destroy(void);

#endif // mock_GPIO_H
