# Software

Two sub-folders are present here, one for the device itself, and one for the Gateway.

## Device

Code for the STM32L051 microcontroller is here, I used Atollic as my IDE (its free!) but you can use anything you like.

## Gateway

The gateway is separated into two components, a LoRa module connected to a STM32F103 MCU, and this one connected via UART to a rapsberry pi.

The sole purpose of the STM32 is to get LoRa messages, decode them and send them to the Raspberry Pi via UART, the RPi will then convert the ADC values into "real" values, and store them into an SQLite database. The RPi also has PHPLiteAdmin into it!

For future versions one might take the STM32 out of the gateway completely, but I was short in time!

