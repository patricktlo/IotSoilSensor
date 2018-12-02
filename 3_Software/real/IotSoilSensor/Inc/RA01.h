#ifndef _RA01_H
#define _RA01_H

#include "main.h"
#include "SX1278.h"

void LoRa_init(SX1278_t* module, SX1278_hw_t* hw);

void LoRa_parsePayload(uint8_t* array, uint32_t ntc, uint32_t ms, uint32_t rh, uint16_t message_nb);

#endif // _RA01_H
