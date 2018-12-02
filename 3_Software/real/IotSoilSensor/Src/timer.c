#include "timer.h"
#include "stm32l0xx_hal.h"


// ------------- HR 202 --------------

void timer_HR202_init()
{
	// Disable timer
	TIM21->CR1 &= ~(TIM_CR1_CEN);

	TIM22->ARR = 32000;

	// Set Capture compare value; Output toggles on this value.
	TIM21->CCR1 = TIM21->ARR/2;

	// Capture compare output enable
	TIM21->CCER |= TIM_CCER_CC2E;
}

void timer_HR202_start_square()
{
	// Clear flag
	TIM21->SR &= ~TIM_SR_CC2IF;

	// Enable timer
	TIM21->CR1 |= TIM_CR1_CEN;
	TIM22->CR1 |= TIM_CR1_CEN;

	// Make timer 22 shift in phase, for it to get ADC measure in the right moment
	TIM22->CNT = 9000;
}

void timer_HR202_stop_square()
{
	// Disable timer
	TIM21->CR1 &= ~(TIM_CR1_CEN);
	TIM22->CR1 &= ~(TIM_CR1_CEN);
}

void timer_HR202_reset()
{
	// tim21
	TIM21->CNT = 0x0;
	TIM21->SR &= ~TIM_SR_CC2IF;

	// tim22
	TIM22->CNT = 0x0;
}

uint16_t timer_HR202_getTimer()
{
	return TIM21->CNT;
}

bool timer_HR202_checkToggle()
{
	if (TIM21->CNT >= TIM21->CCR1)
	{
		return true;
	}

	return false;
}

// ------------- Moisture sensor -------------
void timer_MS_init()
{
	// Disable timer
	TIM2->CR1 &= ~(TIM_CR1_CEN);

	// Set Capture compare value; Output toggles on this value.
	TIM2->CCR1 = TIM2->ARR/2;

	// Capture compare output enable
	TIM2->CCER |= TIM_CCER_CC1E;
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
	// Set counter to zero
	TIM2->CNT = 0x0;

	// Clear timer capture compare flag
	TIM2->SR &= ~TIM_SR_CC1IF;
}

uint16_t timer_MS_getTimer()
{
	// Return timer count
	return TIM2->CNT;
}



