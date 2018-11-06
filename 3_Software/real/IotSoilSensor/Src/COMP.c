/*
 * COMP.c
 *
 *  Created on: 5 de nov de 2018
 *      Author: patrick
 */

#include "stm32l0xx_hal.h"

void COMP_start()
{
	// enable comp
	COMP1->CSR |= COMP_CSR_COMP1EN;
}

void COMP_stop()
{
	// disable comp
	COMP1->CSR &= ~(COMP_CSR_COMP1EN);
}

void COMP_init()
{
	// disable comp
	COMP1->CSR &= ~(COMP_CSR_COMP1EN);
}

uint32_t COMP_getOutput()
{
	return ( (COMP1->CSR & COMP_CSR_COMP1VALUE) >> COMP_CSR_COMP1VALUE_Pos );
}

