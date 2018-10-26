#include <string.h>
#include "fff.h"
#include "mock_GPIO.h"

DEFINE_FAKE_VOID_FUNC0(GPIO_NTC_on);
DEFINE_FAKE_VOID_FUNC0(GPIO_NTC_off);
DEFINE_FAKE_VOID_FUNC0(GPIO_HR202_bridge_on);
DEFINE_FAKE_VOID_FUNC0(GPIO_HR202_bridge_off);

void mock_GPIO_Init(void)
{
    FFF_RESET_HISTORY();
    RESET_FAKE(GPIO_NTC_on)
    RESET_FAKE(GPIO_NTC_off)
    RESET_FAKE(GPIO_HR202_bridge_on)
    RESET_FAKE(GPIO_HR202_bridge_off)
}
void mock_GPIO_Verify(void)
{
}
void mock_GPIO_Destroy(void)
{
}
