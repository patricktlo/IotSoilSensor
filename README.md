# IotSoilSensor

## This document is under construction!

This project aims to create a cheap LoRa-connected device to measure soil moisture using an embedded capacitive sensor. It also has a temperature sensor (NTC) and an air humidity sensor (HR202).

This project also contains a small simple gateway for LoRa using a LoRa module, a microcontroller and a Raspberry Pi.

## Soil moisture sensor

For the geometry of the sensor I chose a fringing field capacitive sensor because it is well documented and used in academic papers, it was also easy to design it in KiCAD, and easy to simulate in FEMM.

To measure the capacitance a simple RC circuit is used, where R is chosen to achieve a good resolution and measuring range. A comparator (which is inside the STM32L051 microcontroller) is connected to the output of the RC circuit, a simple resistive divider giving Vcc/2 is connected to the other pin of the comparator. 

A square wave is applied to the RC circuit, once the comparator changes state, the code of the MCU gets the value of the timer (the same one used for the square wave generations), with this value it is possible to measure the RC constant and hence the capacitive value. This circuit works quite well, before testing the capacitive sensor with it I tried it with capacitors and the results were really close to the nominal capacitive values ([data here](1_Simulations/Moisture%20sensor/Calibration/test_caps.ods))

### Soil moisture sensor calibration

The gravimetric analysis was used to calibrate our sensor, data can be found [here](1_Simulations/Moisture%20sensor/Calibration/test_gravi.ods). 

## Temperature sensor
The temperature sensor is an NTC thermistor because it's simple, cheap and doesn't depend on battery voltage (like DHT11 and others). The circuit is a simple resistor divider, where the value of the other resistor was chosen by finding the inflection point (using a double derivative, more information on the [HR202 sensor python notebook](1_Simulations/HR202/RH Simulation.ipynb), where I developed the math), you can find the math and some cool graphs on the [NTC sensor python notebook](1_Simulations/NTC/Simulation.ipynb). 

### Temperature sensor calibration
I used the beta-equation for the NTC, [look here for more info](1_Simulations/NTC/Simulation.ipynb).
      
The value of beta was given in the datasheet but I wanted to get a closer value so I calibrated it, see more details [in this spreadsheet](1_Simulations/NTC/NTC_calibration.ods).

## Air humidity sensor
The air humidity sensor was a tough one, it would've been pretty simple and straightforward to use a DHT11, but it would stop working when battery levels got to 3V (so pretty soon considering I'm using two AA batteries). So, I chose the HR202, there's not much about it but it's basically a resistive sensor, the RH value changes with temperature and you have to apply AC to it.

In order to provide AC voltage, I polarized the output at Vcc/2, using a resistor divider (look into the [LTSpice file](1_Simulations/HR202/hr202.asc) or the [KiCAD schematic](2_PCB/schematic.pdf) for more. The value of the resistor in this resistor divider is crucial because its value (or more precisely, the equivalent value of the two) define the output characteristics. To find the value of the resistors the inflex point was used (more info on the [HR202 sensor python notebook](1_Simulations/HR202/RH%20Simulation.ipynb)).

Also, just a quick note, since the input voltage is a square wave controlled by a timer, and we want to gather data from the ADC in sync with the square wave, it is needed to fire the ADC conversion with a timer as well.

### Air humidity calibration

It is difficult to calibrate this sensor, I found that the values in the datasheet weren't close to my results (although it could be some error in the circuit, I later found in another datasheet a somewhat different circuit which could work better). In order to get a fixed relative air humidity, I put the sensor inside a sealed container with a bottle cap of salt and water, that way after a few hours it gets to 75%.
I had an air humidity sensor so I could also use it as a reference. Even though the HR202 wasn't giving out exactly what was written on the datasheet, one could see the output voltage had a correlation with the humidity, so I got two known points, the 75% from the salt-water solution and the ambient RH from the other sensor, and fitted my sensor values to this line. It's far from perfect but it does give an idea of the RH.

## Battery

## LoRa

## STM32L051

## PCB

## Gateway
### Database



