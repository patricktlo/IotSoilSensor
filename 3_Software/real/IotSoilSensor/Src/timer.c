#include "timer.h"
#include "stm32l0xx_hal.h"

// ------------- HR 202 --------------

void timer_HR202_init()
{
	// Disable timer
	TIM21->CR1 &= ~(TIM_CR1_CEN);
}

void timer_HR202_start_square()
{
	// Clear flag
	TIM21->SR &= ~TIM_SR_CC2IF;

	// Enable timer
	TIM21->CR1 |= TIM_CR1_CEN;
}

void timer_HR202_stop_square()
{
	// Disable timer
	TIM21->CR1 &= ~(TIM_CR1_CEN);
}

void timer_HR202_reset()
{
	TIM21->CNT = 0x0;
	TIM21->SR &= ~TIM_SR_CC2IF;
}

uint16_t timer_HR202_getTimer()
{
	return TIM21->CNT;
}

bool timer_HR202_checkToggle()
{
	if ( (TIM21->SR & TIM_SR_CC2IF) != 0 )
	{
		// Clear bit
		TIM21->SR &= ~TIM_SR_CC2IF;
		return true;
	}

	return false;
}

// ------------- Moisture sensor -------------
void timer_MS_init()
{
	// Disable timer
	TIM2->CR1 &= ~(TIM_CR1_CEN);
}

void timer_MS_start_square()
{
	// Clear flag
	TIM2->SR &= ~TIM_SR_CC1IF;

	// Enable timer
	TIM2->CR1 |= TIM_CR1_CEN;
}

void timer_MS_stop_square()
{
	// Disable timer
	TIM2->CR1 &= ~(TIM_CR1_CEN);
}

bool timer_MS_checkToggle()
{
	if ( (TIM2->SR & TIM_SR_CC1IF) != 0 )
	{
		// Clear bit
		TIM2->SR &= ~TIM_SR_CC1IF;
		return true;
	}

	return false;
}

void timer_MS_reset()
{
	TIM2->CNT = 0x0;
	TIM2->SR &= ~TIM_SR_CC1IF;
}

uint16_t timer_MS_getTimer()
{
	return TIM2->CNT;
}



