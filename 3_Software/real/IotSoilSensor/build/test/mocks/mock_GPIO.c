#include <string.h>
#include "fff.h"
#include "mock_GPIO.h"

DEFINE_FAKE_VOID_FUNC0(GPIO_NTC_On);

void mock_GPIO_Init(void)
{
    FFF_RESET_HISTORY();
    RESET_FAKE(GPIO_NTC_On)
}
void mock_GPIO_Verify(void)
{
}
void mock_GPIO_Destroy(void)
{
}
