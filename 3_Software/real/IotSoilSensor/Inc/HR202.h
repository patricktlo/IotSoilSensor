#ifndef _HR202_H
#define _HR202_H

#include <inttypes.h>

typedef struct {
	uint16_t average;
	uint16_t variance;
} hr202_values_t ;



hr202_values_t HR202_getRH();

hr202_values_t HR202_getADC();


#endif // _HR202_H
