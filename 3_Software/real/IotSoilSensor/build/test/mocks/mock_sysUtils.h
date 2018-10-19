#ifndef mock_sysUtils_H
#define mock_sysUtils_H

#include "fff.h"
#include "fff_unity_helper.h"
#include "sysUtils.h"


DECLARE_FAKE_VOID_FUNC1(delay_ms, uint32_t);

void mock_sysUtils_Init(void);
void mock_sysUtils_Verify(void);
void mock_sysUtils_Destroy(void);

#endif // mock_sysUtils_H
