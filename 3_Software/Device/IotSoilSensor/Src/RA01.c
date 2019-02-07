#include "RA01.h"
#include "stm32l0xx_hal.h"

extern SPI_HandleTypeDef hspi1;

#define DEVID (2)

void LoRa_init(SX1278_t* module, SX1278_hw_t* hw)
{
	// set module parameters
	const SX1278_hw_t LoRaHW = {  .nss =   { .pin  = LoRa_SS_Pin,
											 .port = LoRa_SS_GPIO_Port},
						  .reset = { .pin  = LoRa_Reset_Pin,
									 .port = LoRa_Reset_GPIO_Port},
						  .dio0 =  {
									 .pin = 1,
									 .port = LoRa_Reset_GPIO_Port},
						  .spi =     &hspi1,
				  };

  *hw = LoRaHW;

  module->hw = hw;

  // Init module config
  SX1278_begin(module, SX1278_433MHZ, SX1278_POWER_17DBM, SX1278_LORA_SF_12,
			SX1278_LORA_BW_125KHZ, PAYLOAD_SIZE);

}

void LoRa_parsePayload(uint8_t* array, uint32_t ntc, uint32_t ms, uint32_t rh, uint16_t message_nb)
{
	// Byte order: (bits)
	// NTC:        12 (pad 4 bits)
	// MS:         16
	// HR202:      24
	// Message Nb: 14
	// Device ID:  10
	// Total:	   76 = 10 bytes

	// Clear array
	for (uint32_t i=0; i < PAYLOAD_SIZE; i++)
	{
		array[i] = 0;
	}

	// NTC [11:4]
	array[0] = ( (ntc & 0xff0) >> 4);

	// NTC [3:0]
	array[1] = (ntc & 0x00f);

	// MS [15:8]
	array[2] = (( ms & 0xff00) >> 8);

	// MS [7:0]
	array[3] = ( ms & 0x00ff);

	// HR202 [23:16]
	array[4] = ((rh & 0xff0000) >> 16 );

	// HR202 [15:8]
	array[5] = ((rh & 0x00ff00) >> 8 );

	// HR202 [7:0]
	array[6] = (rh & 0x0000ff);

	// Message number [14:7]
	array[7] = ((message_nb & 0x3fc0) >> 6);

	// Message number [5:0] + Dev id [9:8]
	array[8] = ( ((message_nb & 0x3f) << 2) + ((DEVID & 0x300) >> 8) );

	// Dev id [7:0]
	array[9] = (DEVID & 0xff);
}


