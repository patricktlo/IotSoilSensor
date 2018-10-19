#include <string.h>
#include "fff.h"
#include "mock_sysUtils.h"

DEFINE_FAKE_VOID_FUNC1(delay_ms, uint32_t);

void mock_sysUtils_Init(void)
{
    FFF_RESET_HISTORY();
    RESET_FAKE(delay_ms)
}
void mock_sysUtils_Verify(void)
{
}
void mock_sysUtils_Destroy(void)
{
}
