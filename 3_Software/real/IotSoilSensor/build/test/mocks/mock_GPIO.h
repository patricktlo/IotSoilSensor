#ifndef mock_GPIO_H
#define mock_GPIO_H

#include "fff.h"
#include "fff_unity_helper.h"
#include "GPIO.h"


DECLARE_FAKE_VOID_FUNC0(GPIO_NTC_On);

void mock_GPIO_Init(void);
void mock_GPIO_Verify(void);
void mock_GPIO_Destroy(void);

#endif // mock_GPIO_H
