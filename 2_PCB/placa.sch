EESchema Schematic File Version 4
LIBS:placa-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "IoT Soil Sensor"
Date "2018-11-21"
Rev "1.2"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_ST_STM32L0:STM32L051C8Tx U1
U 1 1 5B7D65B3
P 2850 3600
F 0 "U1" H 3300 5150 50  0000 C CNN
F 1 "STM32L051C8Tx" H 2300 5200 50  0000 C CNN
F 2 "Package_QFP:LQFP-48_7x7mm_P0.5mm" H 2350 2100 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00108219.pdf" H 2850 3600 50  0001 C CNN
	1    2850 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Variable C12
U 1 1 5B7D6846
P 9800 1300
F 0 "C12" H 9915 1346 50  0000 L CNN
F 1 "C_Variable" H 9915 1255 50  0000 L CNN
F 2 "TCC:Moisture Sensor" H 9800 1300 50  0001 C CNN
F 3 "~" H 9800 1300 50  0001 C CNN
	1    9800 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5B7D6B4F
P 9350 1050
F 0 "R7" V 9143 1050 50  0000 C CNN
F 1 "240k" V 9234 1050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9280 1050 50  0001 C CNN
F 3 "~" H 9350 1050 50  0001 C CNN
	1    9350 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	9500 1050 9800 1050
Wire Wire Line
	9800 1050 9800 1150
Wire Wire Line
	9800 1450 9800 1650
$Comp
L power:GND #PWR0101
U 1 1 5B7D6BE1
P 9800 1650
F 0 "#PWR0101" H 9800 1400 50  0001 C CNN
F 1 "GND" H 9805 1477 50  0000 C CNN
F 2 "" H 9800 1650 50  0001 C CNN
F 3 "" H 9800 1650 50  0001 C CNN
	1    9800 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 1050 9100 1050
Text Notes 8650 900  0    50   ~ 0
Square wave In
Text Notes 9850 950  0    50   ~ 0
Comparator In\n
Wire Wire Line
	2750 2000 2750 1950
Wire Wire Line
	2750 1950 2850 1950
Wire Wire Line
	2850 1950 2850 2000
Wire Wire Line
	2850 1950 2900 1950
Wire Wire Line
	2950 1950 2950 2000
Connection ~ 2850 1950
Wire Wire Line
	2900 1950 2900 1900
Connection ~ 2900 1950
Wire Wire Line
	2900 1950 2950 1950
$Comp
L power:VCC #PWR0102
U 1 1 5B80503B
P 2900 1900
F 0 "#PWR0102" H 2900 1750 50  0001 C CNN
F 1 "VCC" H 2917 2073 50  0000 C CNN
F 2 "" H 2900 1900 50  0001 C CNN
F 3 "" H 2900 1900 50  0001 C CNN
	1    2900 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 5200 2750 5250
Wire Wire Line
	2750 5250 2850 5250
Wire Wire Line
	2850 5250 2850 5200
Wire Wire Line
	2850 5250 2900 5250
Wire Wire Line
	2950 5250 2950 5200
Connection ~ 2850 5250
Wire Wire Line
	2950 5250 3050 5250
Wire Wire Line
	3050 5250 3050 5200
Connection ~ 2950 5250
Wire Wire Line
	2900 5250 2900 5300
Connection ~ 2900 5250
Wire Wire Line
	2900 5250 2950 5250
$Comp
L power:GND #PWR0103
U 1 1 5B8056C7
P 2900 5300
F 0 "#PWR0103" H 2900 5050 50  0001 C CNN
F 1 "GND" H 2905 5127 50  0000 C CNN
F 2 "" H 2900 5300 50  0001 C CNN
F 3 "" H 2900 5300 50  0001 C CNN
	1    2900 5300
	1    0    0    -1  
$EndComp
Text Notes 8500 600  0    50   ~ 0
Soil moisture sensor
Text Notes 8500 2050 0    50   ~ 0
Temperature sensor
$Comp
L Device:R R9
U 1 1 5B89756A
P 9500 2600
F 0 "R9" H 9570 2646 50  0000 L CNN
F 1 "10k" H 9570 2555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9430 2600 50  0001 C CNN
F 3 "~" H 9500 2600 50  0001 C CNN
	1    9500 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:Thermistor TH1
U 1 1 5B8976C9
P 9200 2400
F 0 "TH1" V 8958 2400 50  0000 C CNN
F 1 "Thermistor" V 9049 2400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" H 9200 2400 50  0001 C CNN
F 3 "~" H 9200 2400 50  0001 C CNN
	1    9200 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	9400 2400 9500 2400
Wire Wire Line
	9500 2400 9500 2450
Wire Wire Line
	9500 2750 9500 2800
Wire Wire Line
	9000 2400 8850 2400
Wire Wire Line
	9500 2400 9850 2400
Connection ~ 9500 2400
$Comp
L power:GND #PWR0104
U 1 1 5B8981E0
P 9500 2900
F 0 "#PWR0104" H 9500 2650 50  0001 C CNN
F 1 "GND" H 9505 2727 50  0000 C CNN
F 2 "" H 9500 2900 50  0001 C CNN
F 3 "" H 9500 2900 50  0001 C CNN
	1    9500 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 2400 8850 2350
Wire Notes Line
	8450 3100 11200 3100
Text Notes 8500 3250 0    50   ~ 0
RH sensor
Text Notes 8650 3450 0    50   ~ 0
Square wave In
Wire Wire Line
	9000 3600 9450 3600
Wire Wire Line
	9450 3600 9450 3700
$Comp
L Device:R_Variable R8
U 1 1 5B89BE11
P 9450 3850
F 0 "R8" H 9578 3896 50  0000 L CNN
F 1 "HR202" H 9578 3805 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P1.90mm_Vertical" V 9380 3850 50  0001 C CNN
F 3 "~" H 9450 3850 50  0001 C CNN
	1    9450 3850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5B89C91A
P 9750 4250
F 0 "R10" V 9543 4250 50  0000 C CNN
F 1 "47k" V 9634 4250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9680 4250 50  0001 C CNN
F 3 "~" H 9750 4250 50  0001 C CNN
	1    9750 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5B89C99D
P 9100 4250
F 0 "R6" V 8893 4250 50  0000 C CNN
F 1 "47k" V 8984 4250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9030 4250 50  0001 C CNN
F 3 "~" H 9100 4250 50  0001 C CNN
	1    9100 4250
	0    1    1    0   
$EndComp
Wire Wire Line
	9450 4250 9250 4250
Wire Wire Line
	9450 4000 9450 4250
Connection ~ 9450 4250
Wire Wire Line
	9900 4250 10050 4250
Wire Wire Line
	8950 4250 8850 4250
Wire Wire Line
	8850 4250 8850 4300
$Comp
L power:GND #PWR0105
U 1 1 5B89E125
P 8850 4300
F 0 "#PWR0105" H 8850 4050 50  0001 C CNN
F 1 "GND" H 8855 4127 50  0000 C CNN
F 2 "" H 8850 4300 50  0001 C CNN
F 3 "" H 8850 4300 50  0001 C CNN
	1    8850 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 4250 10050 4200
Text Notes 9900 2250 0    50   ~ 0
To ADC\n
Text Notes 10550 4150 0    50   ~ 0
To ADC\n
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 5B89FFC8
P 6850 1100
F 0 "J3" V 6950 1050 50  0000 C CNN
F 1 "Screw_Terminal_01x02" V 7050 1100 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6850 1100 50  0001 C CNN
F 3 "~" H 6850 1100 50  0001 C CNN
	1    6850 1100
	-1   0    0    1   
$EndComp
$Comp
L power:VCC #PWR0107
U 1 1 5B8A0062
P 7450 750
F 0 "#PWR0107" H 7450 600 50  0001 C CNN
F 1 "VCC" H 7467 923 50  0000 C CNN
F 2 "" H 7450 750 50  0001 C CNN
F 3 "" H 7450 750 50  0001 C CNN
	1    7450 750 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5B8A2231
P 7450 1450
F 0 "#PWR0108" H 7450 1200 50  0001 C CNN
F 1 "GND" H 7455 1277 50  0000 C CNN
F 2 "" H 7450 1450 50  0001 C CNN
F 3 "" H 7450 1450 50  0001 C CNN
	1    7450 1450
	1    0    0    -1  
$EndComp
Text Notes 5650 650  0    50   ~ 0
Power Supply
Text Notes 550  6450 0    50   ~ 0
ST-Link connection
$Comp
L power:GND #PWR0109
U 1 1 5B8D5FED
P 1700 7400
F 0 "#PWR0109" H 1700 7150 50  0001 C CNN
F 1 "GND" H 1705 7227 50  0000 C CNN
F 2 "" H 1700 7400 50  0001 C CNN
F 3 "" H 1700 7400 50  0001 C CNN
	1    1700 7400
	1    0    0    -1  
$EndComp
Text Label 2100 2200 2    50   ~ 0
NRST
Wire Wire Line
	2100 2200 2250 2200
Text Label 3650 4900 0    50   ~ 0
SWCLK
Wire Wire Line
	3450 4900 3650 4900
Text Label 3650 4800 0    50   ~ 0
SWDIO
Wire Wire Line
	3650 4800 3450 4800
Text Label 1150 6750 0    50   ~ 0
SWCLK
Text Label 1150 7050 0    50   ~ 0
SWDIO
Text Label 1250 7300 0    50   ~ 0
NRST
$Comp
L power:VCC #PWR0110
U 1 1 5B8DD502
P 1700 6950
F 0 "#PWR0110" H 1700 6800 50  0001 C CNN
F 1 "VCC" H 1717 7123 50  0000 C CNN
F 2 "" H 1700 6950 50  0001 C CNN
F 3 "" H 1700 6950 50  0001 C CNN
	1    1700 6950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5B8E21D1
P 1700 7200
F 0 "C1" H 1815 7246 50  0000 L CNN
F 1 "100n" H 1815 7155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 1738 7050 50  0001 C CNN
F 3 "~" H 1700 7200 50  0001 C CNN
	1    1700 7200
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0111
U 1 1 5B8E43A8
P 3000 6550
F 0 "#PWR0111" H 3000 6400 50  0001 C CNN
F 1 "VCC" H 3017 6723 50  0000 C CNN
F 2 "" H 3000 6550 50  0001 C CNN
F 3 "" H 3000 6550 50  0001 C CNN
	1    3000 6550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5B8E4463
P 3000 6750
F 0 "R1" H 3070 6796 50  0000 L CNN
F 1 "10k" H 3070 6705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2930 6750 50  0001 C CNN
F 3 "~" H 3000 6750 50  0001 C CNN
	1    3000 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 6600 3000 6550
$Comp
L Device:C C2
U 1 1 5B8E56BE
P 3000 7200
F 0 "C2" H 3115 7246 50  0000 L CNN
F 1 "100n" H 3115 7155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3038 7050 50  0001 C CNN
F 3 "~" H 3000 7200 50  0001 C CNN
	1    3000 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 6900 3000 6950
Wire Wire Line
	3000 6950 3250 6950
Connection ~ 3000 6950
$Comp
L power:GND #PWR0112
U 1 1 5B8F1213
P 3000 7600
F 0 "#PWR0112" H 3000 7350 50  0001 C CNN
F 1 "GND" H 3005 7427 50  0000 C CNN
F 2 "" H 3000 7600 50  0001 C CNN
F 3 "" H 3000 7600 50  0001 C CNN
	1    3000 7600
	1    0    0    -1  
$EndComp
Text Label 3250 6950 0    50   ~ 0
NRST
Text Notes 2250 6450 0    50   ~ 0
Reset button
Text Notes 3600 6450 0    50   ~ 0
User LEDs
$Comp
L power:VCC #PWR0113
U 1 1 5B8F1B1A
P 3850 6750
F 0 "#PWR0113" H 3850 6600 50  0001 C CNN
F 1 "VCC" H 3867 6923 50  0000 C CNN
F 2 "" H 3850 6750 50  0001 C CNN
F 3 "" H 3850 6750 50  0001 C CNN
	1    3850 6750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5B8F1B41
P 4750 6850
F 0 "R2" V 4543 6850 50  0000 C CNN
F 1 "330" V 4634 6850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4680 6850 50  0001 C CNN
F 3 "~" H 4750 6850 50  0001 C CNN
	1    4750 6850
	0    1    1    0   
$EndComp
$Comp
L Device:LED D1
U 1 1 5B8F3100
P 4250 6850
F 0 "D1" H 4242 6595 50  0000 C CNN
F 1 "LED" H 4242 6686 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4250 6850 50  0001 C CNN
F 3 "~" H 4250 6850 50  0001 C CNN
	1    4250 6850
	-1   0    0    1   
$EndComp
Wire Wire Line
	4400 6850 4600 6850
Wire Wire Line
	4100 6850 3850 6850
Wire Wire Line
	3850 6850 3850 6750
Wire Wire Line
	4900 6850 5100 6850
Wire Wire Line
	3850 6850 3850 7250
Wire Wire Line
	3850 7250 4100 7250
Connection ~ 3850 6850
$Comp
L Device:LED D2
U 1 1 5B8F8E91
P 4250 7250
F 0 "D2" H 4242 6995 50  0000 C CNN
F 1 "LED" H 4242 7086 50  0000 C CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4250 7250 50  0001 C CNN
F 3 "~" H 4250 7250 50  0001 C CNN
	1    4250 7250
	-1   0    0    1   
$EndComp
$Comp
L Device:R R3
U 1 1 5B8F8ED5
P 4750 7250
F 0 "R3" V 4543 7250 50  0000 C CNN
F 1 "330" V 4634 7250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 4680 7250 50  0001 C CNN
F 3 "~" H 4750 7250 50  0001 C CNN
	1    4750 7250
	0    1    1    0   
$EndComp
Wire Wire Line
	4400 7250 4600 7250
Wire Wire Line
	4900 7250 5100 7250
$Comp
L power:GND #PWR0114
U 1 1 5B8FDAAD
P 5100 7300
F 0 "#PWR0114" H 5100 7050 50  0001 C CNN
F 1 "GND" H 5105 7127 50  0000 C CNN
F 2 "" H 5100 7300 50  0001 C CNN
F 3 "" H 5100 7300 50  0001 C CNN
	1    5100 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 7300 5100 7250
$Comp
L RF_Module:Ai-Thinker-Ra-01 U2
U 1 1 5B900117
P 6750 3300
F 0 "U2" H 7000 4050 50  0000 C CNN
F 1 "Ai-Thinker-Ra-01" H 6300 4050 50  0000 C CNN
F 2 "TCC:Ai-Thinker-Ra-01-LoRa" H 7750 2900 50  0001 C CNN
F 3 "https://mikroelectron.com/Product/10KM-433M-LORA-LONG-RANGE-WIRELESS-MODULE-RA-01" H 6850 4000 50  0001 C CNN
	1    6750 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 4000 6750 4050
$Comp
L power:GND #PWR0115
U 1 1 5B901FC3
P 6750 4050
F 0 "#PWR0115" H 6750 3800 50  0001 C CNN
F 1 "GND" H 6755 3877 50  0000 C CNN
F 2 "" H 6750 4050 50  0001 C CNN
F 3 "" H 6750 4050 50  0001 C CNN
	1    6750 4050
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0116
U 1 1 5B9040B0
P 6750 2400
F 0 "#PWR0116" H 6750 2250 50  0001 C CNN
F 1 "VCC" H 6767 2573 50  0000 C CNN
F 2 "" H 6750 2400 50  0001 C CNN
F 3 "" H 6750 2400 50  0001 C CNN
	1    6750 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 2500 6750 2450
Wire Notes Line
	2150 6250 2150 7800
Wire Notes Line
	5450 6250 5450 7750
NoConn ~ 7250 2900
NoConn ~ 7250 3000
NoConn ~ 7250 3100
NoConn ~ 7250 3200
NoConn ~ 7250 3300
NoConn ~ 7250 3400
NoConn ~ 6250 2800
Text Label 2150 3800 2    50   ~ 0
SPI_SCK
Text Label 2150 3900 2    50   ~ 0
SPI_MISO
Text Label 2150 4000 2    50   ~ 0
SPI_MOSI
Text Label 6100 3300 2    50   ~ 0
SPI_SCK
Text Label 6100 3400 2    50   ~ 0
SPI_MISO
Text Label 6100 3500 2    50   ~ 0
SPI_MOSI
Text Label 6100 3200 2    50   ~ 0
SPI_CS
Text Label 2150 4100 2    50   ~ 0
SPI_CS
Text Label 2150 3100 2    50   ~ 0
LoRa_Reset
Text Label 6100 3000 2    50   ~ 0
LoRa_Reset
Wire Wire Line
	6100 3000 6250 3000
Text Label 3650 4300 0    50   ~ 0
userLED
Text Label 5100 6850 0    50   ~ 0
userLED
$Comp
L Device:C C7
U 1 1 5B90954A
P 10150 4550
F 0 "C7" H 10265 4596 50  0000 L CNN
F 1 "4,7n" H 10265 4505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10188 4400 50  0001 C CNN
F 3 "~" H 10150 4550 50  0001 C CNN
	1    10150 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 3600 3450 3600
Wire Wire Line
	6750 2450 7450 2450
Wire Wire Line
	7450 2450 7450 2550
Connection ~ 6750 2450
Wire Wire Line
	6750 2450 6750 2400
Wire Wire Line
	7450 2850 7450 2900
$Comp
L power:GND #PWR0118
U 1 1 5B917E7B
P 7450 2950
F 0 "#PWR0118" H 7450 2700 50  0001 C CNN
F 1 "GND" H 7455 2777 50  0000 C CNN
F 2 "" H 7450 2950 50  0001 C CNN
F 3 "" H 7450 2950 50  0001 C CNN
	1    7450 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3500 3650 3500
Text Label 2150 3600 2    50   ~ 0
ADC_RH
Wire Wire Line
	3450 3700 3650 3700
Text Label 3650 4200 0    50   ~ 0
ADC_TEMP
Text Label 10500 4350 0    50   ~ 0
ADC_RH
Text Label 10050 2400 0    50   ~ 0
ADC_TEMP
Wire Wire Line
	10500 4350 10150 4350
$Comp
L power:GND #PWR0119
U 1 1 5B921BAC
P 10150 4750
F 0 "#PWR0119" H 10150 4500 50  0001 C CNN
F 1 "GND" H 10155 4577 50  0000 C CNN
F 2 "" H 10150 4750 50  0001 C CNN
F 3 "" H 10150 4750 50  0001 C CNN
	1    10150 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 4750 10150 4700
Wire Wire Line
	10150 4400 10150 4350
Connection ~ 10150 4350
Wire Wire Line
	9850 2800 9500 2800
Connection ~ 9500 2800
Wire Wire Line
	9500 2800 9500 2900
Wire Wire Line
	9850 2500 9850 2400
Wire Wire Line
	9850 2400 10050 2400
Connection ~ 9850 2400
$Comp
L Device:Crystal_Small Y2
U 1 1 5B93629F
P 10300 5900
F 0 "Y2" V 10300 5750 50  0000 L CNN
F 1 "32.768 kHz" H 10500 5900 50  0000 L CNN
F 2 "Crystal:Crystal_Round_D1.0mm_Vertical" H 10300 5900 50  0001 C CNN
F 3 "~" H 10300 5900 50  0001 C CNN
	1    10300 5900
	-1   0    0    1   
$EndComp
$Comp
L Device:Crystal_Small Y1
U 1 1 5B93633A
P 8500 5900
F 0 "Y1" V 8454 5988 50  0000 L CNN
F 1 "8 MHz" H 8050 5900 50  0000 L CNN
F 2 "Crystal:Crystal_HC49-U_Vertical" H 8500 5900 50  0001 C CNN
F 3 "~" H 8500 5900 50  0001 C CNN
	1    8500 5900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5B93CABA
P 8650 5650
F 0 "R5" V 8443 5650 50  0000 C CNN
F 1 "390" V 8534 5650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8580 5650 50  0001 C CNN
F 3 "~" H 8650 5650 50  0001 C CNN
	1    8650 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 5900 8350 5900
Wire Wire Line
	8600 5900 8650 5900
Wire Wire Line
	8650 5900 8650 5800
$Comp
L Device:C_Small C6
U 1 1 5B952678
P 8350 6050
F 0 "C6" H 8150 5950 50  0000 C CNN
F 1 "20p" H 8150 6050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8350 6050 50  0001 C CNN
F 3 "~" H 8350 6050 50  0001 C CNN
	1    8350 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C9
U 1 1 5B9526FC
P 8650 6050
F 0 "C9" H 8850 5950 50  0000 C CNN
F 1 "20p" H 8850 6050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 8650 6050 50  0001 C CNN
F 3 "~" H 8650 6050 50  0001 C CNN
	1    8650 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 6150 8650 6200
Wire Wire Line
	8650 6200 8500 6200
Wire Wire Line
	8350 6200 8350 6150
Wire Wire Line
	8500 6200 8500 6300
Connection ~ 8500 6200
Wire Wire Line
	8500 6200 8350 6200
$Comp
L power:GND #PWR0120
U 1 1 5B96303A
P 8500 6300
F 0 "#PWR0120" H 8500 6050 50  0001 C CNN
F 1 "GND" H 8505 6127 50  0000 C CNN
F 2 "" H 8500 6300 50  0001 C CNN
F 3 "" H 8500 6300 50  0001 C CNN
	1    8500 6300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 5B9632C9
P 3700 2800
F 0 "#PWR0121" H 3700 2550 50  0001 C CNN
F 1 "GND" H 3705 2627 50  0000 C CNN
F 2 "" H 3700 2800 50  0001 C CNN
F 3 "" H 3700 2800 50  0001 C CNN
	1    3700 2800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0122
U 1 1 5B963B24
P 3700 2300
F 0 "#PWR0122" H 3700 2150 50  0001 C CNN
F 1 "VCC" H 3717 2473 50  0000 C CNN
F 2 "" H 3700 2300 50  0001 C CNN
F 3 "" H 3700 2300 50  0001 C CNN
	1    3700 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5B9646E9
P 4050 2550
F 0 "C3" H 4165 2596 50  0000 L CNN
F 1 "100n" H 4165 2505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4088 2400 50  0001 C CNN
F 3 "~" H 4050 2550 50  0001 C CNN
	1    4050 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2300 3700 2350
Wire Wire Line
	3700 2800 3700 2750
$Comp
L Device:CP1 C4
U 1 1 5B97312D
P 4450 2550
F 0 "C4" H 4565 2596 50  0000 L CNN
F 1 "10u" H 4565 2505 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4450 2550 50  0001 C CNN
F 3 "~" H 4450 2550 50  0001 C CNN
	1    4450 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2400 4450 2350
Wire Wire Line
	4450 2700 4450 2750
Wire Wire Line
	8350 5900 8350 5450
Wire Wire Line
	8650 5500 8650 5450
Wire Wire Line
	2250 2800 2100 2800
Wire Wire Line
	2250 2900 2100 2900
Text Label 2100 2800 2    50   ~ 0
RCC_OSC_IN
Text Label 2100 2900 2    50   ~ 0
RCC_OSC_OUT
Text Label 8350 5450 2    50   ~ 0
RCC_OSC_IN
Text Label 8650 5450 0    50   ~ 0
RCC_OSC_OUT
Text Notes 7000 5150 0    50   ~ 0
Oscillators
Wire Notes Line
	6750 7800 6800 7800
Wire Wire Line
	10200 5900 10150 5900
Wire Wire Line
	10150 5900 10150 5650
Wire Wire Line
	10400 5900 10450 5900
Wire Wire Line
	10450 5900 10450 5650
Wire Wire Line
	10450 5900 10450 6000
Connection ~ 10450 5900
Wire Wire Line
	10150 5900 10150 6000
Connection ~ 10150 5900
$Comp
L Device:C_Small C11
U 1 1 5B9C4C68
P 10150 6100
F 0 "C11" H 9900 6000 50  0000 C CNN
F 1 "10p" H 9900 6100 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10150 6100 50  0001 C CNN
F 3 "~" H 10150 6100 50  0001 C CNN
	1    10150 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C14
U 1 1 5B9C4CFE
P 10450 6100
F 0 "C14" H 10650 6000 50  0000 C CNN
F 1 "10p" H 10650 6100 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 10450 6100 50  0001 C CNN
F 3 "~" H 10450 6100 50  0001 C CNN
	1    10450 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 6200 10150 6250
Wire Wire Line
	10150 6250 10300 6250
Wire Wire Line
	10450 6250 10450 6200
Wire Wire Line
	10300 6250 10300 6300
Connection ~ 10300 6250
Wire Wire Line
	10300 6250 10450 6250
$Comp
L power:GND #PWR0123
U 1 1 5B9CF7B7
P 10300 6300
F 0 "#PWR0123" H 10300 6050 50  0001 C CNN
F 1 "GND" H 10305 6127 50  0000 C CNN
F 2 "" H 10300 6300 50  0001 C CNN
F 3 "" H 10300 6300 50  0001 C CNN
	1    10300 6300
	1    0    0    -1  
$EndComp
Text Label 10150 5650 2    50   ~ 0
RCC_OSC32_IN
Text Label 10450 5650 0    50   ~ 0
RCC_OSC32_OUT
Text Label 2150 3200 2    50   ~ 0
RCC_OSC32_IN
Text Label 2150 3300 2    50   ~ 0
RCC_OSC32_OUT
Wire Wire Line
	2150 3200 2250 3200
Wire Wire Line
	2250 3300 2150 3300
Text Notes 7500 5250 0    50   ~ 0
High speed external
Wire Wire Line
	8350 5950 8350 5900
Connection ~ 8350 5900
Wire Wire Line
	8650 5950 8650 5900
Connection ~ 8650 5900
Text Notes 9250 5250 0    50   ~ 0
Low speed external
$Comp
L Device:CP1 C10
U 1 1 5BA12791
P 7850 2700
F 0 "C10" H 7965 2746 50  0000 L CNN
F 1 "660n" H 7965 2655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7850 2700 50  0001 C CNN
F 3 "~" H 7850 2700 50  0001 C CNN
	1    7850 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 2900 7850 2900
Wire Wire Line
	7850 2900 7850 2850
Connection ~ 7450 2900
Wire Wire Line
	7450 2900 7450 2950
Wire Wire Line
	7850 2550 7850 2450
Wire Wire Line
	7850 2450 7450 2450
Connection ~ 7450 2450
$Comp
L Device:CP1 C5
U 1 1 5BA1E023
P 7450 1100
F 0 "C5" H 7565 1146 50  0000 L CNN
F 1 "1u" H 7565 1055 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 7450 1100 50  0001 C CNN
F 3 "~" H 7450 1100 50  0001 C CNN
	1    7450 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 950  7450 850 
Wire Wire Line
	7050 1100 7100 1100
Wire Wire Line
	7200 1100 7200 1300
Wire Wire Line
	7200 1300 7450 1300
Connection ~ 7450 1300
Wire Wire Line
	7450 1300 7450 1250
Wire Wire Line
	7050 1000 7100 1000
Wire Wire Line
	7200 1000 7200 850 
Wire Wire Line
	7200 850  7450 850 
Connection ~ 7450 850 
$Comp
L Device:C C8
U 1 1 5BA415FD
P 7850 1100
F 0 "C8" H 7965 1146 50  0000 L CNN
F 1 "100n" H 7965 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7888 950 50  0001 C CNN
F 3 "~" H 7850 1100 50  0001 C CNN
	1    7850 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 750  7450 850 
Wire Wire Line
	7450 850  7850 850 
Wire Wire Line
	7850 850  7850 950 
Wire Wire Line
	7450 1300 7450 1450
Wire Wire Line
	7450 1300 7850 1300
Wire Wire Line
	7850 1250 7850 1300
Wire Wire Line
	9450 4250 9600 4250
Wire Wire Line
	9450 4350 9450 4250
Wire Wire Line
	9450 4350 10150 4350
Wire Wire Line
	3000 6950 3000 7050
Text Label 3650 4400 0    50   ~ 0
UART_TX
Text Label 3650 4500 0    50   ~ 0
UART_RX
$Comp
L Connector:Screw_Terminal_01x02 J1
U 1 1 5B9096F3
P 5850 7050
F 0 "J1" H 5850 6850 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5700 7150 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5850 7050 50  0001 C CNN
F 3 "~" H 5850 7050 50  0001 C CNN
	1    5850 7050
	-1   0    0    1   
$EndComp
Text Label 6200 7050 0    50   ~ 0
UART_TX
Text Label 6200 6950 0    50   ~ 0
UART_RX
Wire Wire Line
	6200 7050 6050 7050
Wire Wire Line
	6050 6950 6200 6950
Text Notes 5550 6450 0    50   ~ 0
UART Connection
Text Label 8850 2350 2    50   ~ 0
PWR_TEMP
Text Label 9000 3600 2    50   ~ 0
PWR_RH
Text Label 2150 4900 2    50   ~ 0
PWR_RH
Text Label 3650 4000 0    50   ~ 0
PWR_TEMP
Text Label 3650 3500 0    50   ~ 0
PWR_MS
Wire Wire Line
	3450 3900 3650 3900
Text Notes 5650 2100 0    50   ~ 0
LoRa RA-01
Wire Wire Line
	2950 1950 3050 1950
Wire Wire Line
	3050 1950 3050 2000
Connection ~ 2950 1950
Text Notes 1100 1500 0    50   ~ 0
Microcontroller
Wire Wire Line
	3650 4500 3450 4500
Wire Wire Line
	3450 4400 3650 4400
$Comp
L power:GND #PWR0125
U 1 1 5B99E910
P 1450 2700
F 0 "#PWR0125" H 1450 2450 50  0001 C CNN
F 1 "GND" H 1455 2527 50  0000 C CNN
F 2 "" H 1450 2700 50  0001 C CNN
F 3 "" H 1450 2700 50  0001 C CNN
	1    1450 2700
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5B9B99F8
P 7100 950
F 0 "#FLG0101" H 7100 1025 50  0001 C CNN
F 1 "PWR_FLAG" H 7100 1124 50  0000 C CNN
F 2 "" H 7100 950 50  0001 C CNN
F 3 "~" H 7100 950 50  0001 C CNN
	1    7100 950 
	1    0    0    -1  
$EndComp
Connection ~ 7100 1000
Wire Wire Line
	7100 1000 7200 1000
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5B9BA567
P 7100 1150
F 0 "#FLG0102" H 7100 1225 50  0001 C CNN
F 1 "PWR_FLAG" H 7100 1323 50  0000 C CNN
F 2 "" H 7100 1150 50  0001 C CNN
F 3 "~" H 7100 1150 50  0001 C CNN
	1    7100 1150
	-1   0    0    1   
$EndComp
Wire Wire Line
	7100 1150 7100 1100
Connection ~ 7100 1100
Wire Wire Line
	7100 1100 7200 1100
Wire Wire Line
	7100 1000 7100 950 
NoConn ~ 3450 4700
NoConn ~ 3450 5000
NoConn ~ 2250 5000
NoConn ~ 2250 4800
NoConn ~ 2250 4400
$Comp
L Device:C C16
U 1 1 5BA91F5E
P 4800 2550
F 0 "C16" H 4915 2596 50  0000 L CNN
F 1 "470n" H 4915 2505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4838 2400 50  0001 C CNN
F 3 "~" H 4800 2550 50  0001 C CNN
	1    4800 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2350 4800 2350
Wire Wire Line
	4800 2350 4800 2400
Connection ~ 4450 2350
Wire Wire Line
	4800 2700 4800 2750
Wire Wire Line
	4800 2750 4450 2750
Connection ~ 4450 2750
$Comp
L power:VCC #PWR0126
U 1 1 5BAA4892
P 2100 2600
F 0 "#PWR0126" H 2100 2450 50  0001 C CNN
F 1 "VCC" H 2117 2773 50  0000 C CNN
F 2 "" H 2100 2600 50  0001 C CNN
F 3 "" H 2100 2600 50  0001 C CNN
	1    2100 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2600 2250 2600
Wire Notes Line
	3500 6250 3500 7800
Wire Notes Line
	450  6250 6950 6250
$Comp
L Device:C C13
U 1 1 5B981C4C
P 9850 2650
F 0 "C13" H 9965 2696 50  0000 L CNN
F 1 "10n" H 9965 2605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 9888 2500 50  0001 C CNN
F 3 "~" H 9850 2650 50  0001 C CNN
	1    9850 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C15
U 1 1 5B9868F3
P 7450 2700
F 0 "C15" H 7565 2746 50  0000 L CNN
F 1 "100n" H 7565 2655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 7488 2550 50  0001 C CNN
F 3 "~" H 7450 2700 50  0001 C CNN
	1    7450 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 3800 2250 3800
Wire Wire Line
	2250 3900 2150 3900
Wire Wire Line
	2150 4000 2250 4000
NoConn ~ 3450 4100
NoConn ~ 2250 4200
NoConn ~ 2250 3500
Wire Wire Line
	2150 4100 2250 4100
Wire Notes Line
	5200 1900 11200 1900
$Comp
L Connector:Conn_01x04_Female J4
U 1 1 5BA72F71
P 5400 4550
F 0 "J4" H 5294 4835 50  0000 C CNN
F 1 "TestPoints" H 5294 4744 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 5400 4550 50  0001 C CNN
F 3 "~" H 5400 4550 50  0001 C CNN
	1    5400 4550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6100 3500 6250 3500
Text Label 5750 4550 0    50   ~ 0
SPI_MOSI
Wire Wire Line
	2150 3100 2250 3100
Wire Wire Line
	6100 3300 6250 3300
Wire Wire Line
	6250 3200 6100 3200
Text Label 5750 4450 0    50   ~ 0
SPI_CS
Text Label 5750 4650 0    50   ~ 0
SPI_MISO
Text Label 5750 4750 0    50   ~ 0
SPI_SCK
Wire Wire Line
	5600 4750 5750 4750
Wire Wire Line
	5600 4650 5750 4650
Wire Wire Line
	5750 4550 5600 4550
Wire Wire Line
	5600 4450 5750 4450
Wire Wire Line
	3450 4000 3650 4000
NoConn ~ 2250 3700
NoConn ~ 3450 4600
$Comp
L Device:R R11
U 1 1 5BB41864
P 1850 2400
F 0 "R11" H 1920 2446 50  0000 L CNN
F 1 "10k" H 1920 2355 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1780 2400 50  0001 C CNN
F 3 "~" H 1850 2400 50  0001 C CNN
	1    1850 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	2000 2400 2250 2400
Wire Wire Line
	1450 2400 1450 2700
Wire Wire Line
	1450 2400 1700 2400
$Comp
L Connector:Conn_01x04_Male J2
U 1 1 5BB700CF
P 900 6850
F 0 "J2" H 1006 7128 50  0000 C CNN
F 1 "Conn_01x04_Male" H 1006 7037 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 900 6850 50  0001 C CNN
F 3 "~" H 900 6850 50  0001 C CNN
	1    900  6850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5BB95E51
P 1200 6850
F 0 "#PWR0106" H 1200 6600 50  0001 C CNN
F 1 "GND" H 1205 6677 50  0000 C CNN
F 2 "" H 1200 6850 50  0001 C CNN
F 3 "" H 1200 6850 50  0001 C CNN
	1    1200 6850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1150 7050 1100 7050
Wire Wire Line
	1150 6750 1100 6750
Wire Wire Line
	1700 7400 1700 7350
Wire Wire Line
	3000 7350 3000 7600
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 5BBE81FC
P 850 7300
F 0 "J5" H 956 7478 50  0000 C CNN
F 1 "Conn_01x02_Male" H 956 7387 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 850 7300 50  0001 C CNN
F 3 "~" H 850 7300 50  0001 C CNN
	1    850  7300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 5BBF1F50
P 1150 7450
F 0 "#PWR0124" H 1150 7200 50  0001 C CNN
F 1 "GND" H 1155 7277 50  0000 C CNN
F 2 "" H 1150 7450 50  0001 C CNN
F 3 "" H 1150 7450 50  0001 C CNN
	1    1150 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 7300 1250 7300
Wire Wire Line
	1050 7400 1150 7400
Wire Wire Line
	1150 7400 1150 7450
Wire Wire Line
	1700 6950 1700 7050
Wire Wire Line
	1100 6950 1700 6950
Connection ~ 1700 6950
Wire Wire Line
	1200 6850 1100 6850
Wire Wire Line
	6100 3400 6250 3400
Text Label 2150 4500 2    50   ~ 0
PWR_RH_COMP
Text Label 3650 3600 0    50   ~ 0
COMP_P
Text Label 3650 3900 0    50   ~ 0
COMP_M
Text Label 3650 3700 0    50   ~ 0
PWR_MS_COMP
Text Label 10050 4200 1    50   ~ 0
PWR_RH_COMP
Text Label 9100 1050 2    50   ~ 0
PWR_MS
Text Label 9950 1050 0    50   ~ 0
COMP_P
Text Label 10850 1250 0    50   ~ 0
COMP_M
Text Label 10650 800  0    50   ~ 0
PWR_MS_COMP
Wire Wire Line
	9800 1050 9950 1050
Connection ~ 9800 1050
$Comp
L Device:R R4
U 1 1 5BC9D642
P 10650 1050
F 0 "R4" V 10443 1050 50  0000 C CNN
F 1 "22k" V 10534 1050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10580 1050 50  0001 C CNN
F 3 "~" H 10650 1050 50  0001 C CNN
	1    10650 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5BC9D759
P 10650 1450
F 0 "R12" V 10443 1450 50  0000 C CNN
F 1 "22k" V 10534 1450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 10580 1450 50  0001 C CNN
F 3 "~" H 10650 1450 50  0001 C CNN
	1    10650 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10650 1600 10650 1650
Wire Wire Line
	10650 1300 10650 1250
Wire Wire Line
	10650 1250 10850 1250
Connection ~ 10650 1250
Wire Wire Line
	10650 1250 10650 1200
Wire Wire Line
	10650 900  10650 800 
$Comp
L power:GND #PWR0117
U 1 1 5BCC028E
P 10650 1650
F 0 "#PWR0117" H 10650 1400 50  0001 C CNN
F 1 "GND" H 10655 1477 50  0000 C CNN
F 2 "" H 10650 1650 50  0001 C CNN
F 3 "" H 10650 1650 50  0001 C CNN
	1    10650 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 3600 2150 3600
Wire Wire Line
	3450 4200 3650 4200
NoConn ~ 3450 3800
$Comp
L Device:C C17
U 1 1 5BD107FB
P 3700 2550
F 0 "C17" H 3815 2596 50  0000 L CNN
F 1 "100n" H 3815 2505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3738 2400 50  0001 C CNN
F 3 "~" H 3700 2550 50  0001 C CNN
	1    3700 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2750 4050 2750
Wire Wire Line
	3700 2350 4050 2350
Wire Wire Line
	4050 2400 4050 2350
Connection ~ 4050 2350
Wire Wire Line
	4050 2350 4450 2350
Wire Wire Line
	3700 2400 3700 2350
Connection ~ 3700 2350
Wire Wire Line
	3700 2700 3700 2750
Connection ~ 3700 2750
Wire Wire Line
	4050 2700 4050 2750
Connection ~ 4050 2750
Wire Wire Line
	4050 2750 4450 2750
Wire Wire Line
	2250 4900 2150 4900
NoConn ~ 2250 4600
Wire Wire Line
	3450 4300 3650 4300
NoConn ~ 2250 4300
Wire Wire Line
	2150 4500 2250 4500
NoConn ~ 2250 4700
Text Notes 3900 2100 0    50   ~ 0
Decoupling caps
Text Notes 5300 4200 0    31   ~ 0
Test points for the SPI LoRa connection
Wire Notes Line
	5200 500  5200 5000
Wire Notes Line
	6950 6550 6950 5000
Wire Notes Line
	5200 5000 11250 5000
Wire Notes Line
	8450 450  8450 5000
$EndSCHEMATC
