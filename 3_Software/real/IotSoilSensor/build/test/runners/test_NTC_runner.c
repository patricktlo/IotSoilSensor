/* AUTOGENERATED FILE. DO NOT EDIT. */

/*=======Test Runner Used To Run Each Test Below=====*/
#define RUN_TEST(TestFunc, TestLineNum) \
{ \
  Unity.CurrentTestName = #TestFunc; \
  Unity.CurrentTestLineNumber = TestLineNum; \
  Unity.NumberOfTests++; \
  CMock_Init(); \
  UNITY_CLR_DETAILS(); \
  if (TEST_PROTECT()) \
  { \
      setUp(); \
      TestFunc(); \
  } \
  if (TEST_PROTECT()) \
  { \
    tearDown(); \
    CMock_Verify(); \
  } \
  CMock_Destroy(); \
  UnityConcludeTest(); \
}

/*=======Automagically Detected Files To Include=====*/
#ifdef __WIN32__
#define UNITY_INCLUDE_SETUP_STUBS
#endif
#include "unity.h"
#include "cmock.h"
#ifndef UNITY_EXCLUDE_SETJMP_H
#include <setjmp.h>
#endif
#include <stdio.h>
#include "mock_GPIO.h"
#include "mock_ADC.h"
#include "mock_sysUtils.h"

int GlobalExpectCount;
int GlobalVerifyOrder;
char* GlobalOrderError;

/*=======External Functions This Runner Calls=====*/
extern void setUp(void);
extern void tearDown(void);
extern void test_NTC_getTemp(void);
extern void test_NTC_init();
extern void test_NTC_getTemp_returnValue(void);


/*=======Mock Management=====*/
static void CMock_Init(void)
{
  GlobalExpectCount = 0;
  GlobalVerifyOrder = 0;
  GlobalOrderError = NULL;
  mock_GPIO_Init();
  mock_ADC_Init();
  mock_sysUtils_Init();
}
static void CMock_Verify(void)
{
  mock_GPIO_Verify();
  mock_ADC_Verify();
  mock_sysUtils_Verify();
}
static void CMock_Destroy(void)
{
  mock_GPIO_Destroy();
  mock_ADC_Destroy();
  mock_sysUtils_Destroy();
}

/*=======Suite Setup=====*/
static void suite_setup(void)
{
#if defined(UNITY_WEAK_ATTRIBUTE) || defined(UNITY_WEAK_PRAGMA)
  suiteSetUp();
#endif
}

/*=======Suite Teardown=====*/
static int suite_teardown(int num_failures)
{
#if defined(UNITY_WEAK_ATTRIBUTE) || defined(UNITY_WEAK_PRAGMA)
  return suiteTearDown(num_failures);
#else
  return num_failures;
#endif
}

/*=======Test Reset Option=====*/
void resetTest(void);
void resetTest(void)
{
  CMock_Verify();
  CMock_Destroy();
  tearDown();
  CMock_Init();
  setUp();
}


/*=======MAIN=====*/
int main(void)
{
  suite_setup();
  UnityBegin("test_NTC.c");
  RUN_TEST(test_NTC_getTemp, 14);
  RUN_TEST(test_NTC_init, 29);
  RUN_TEST(test_NTC_getTemp_returnValue, 41);

  CMock_Guts_MemFreeFinal();
  return suite_teardown(UnityEnd());
}

//=======Defintions of FFF variables=====
#include "fff.h"
DEFINE_FFF_GLOBALS;
