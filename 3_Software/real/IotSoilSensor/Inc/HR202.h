#ifndef _HR202_H
#define _HR202_H

#include <inttypes.h>

typedef struct {
	uint16_t average;
	uint16_t errorCode;
} hr202_values_t ;

hr202_values_t HR202_getRH();

#endif // _HR202_H
