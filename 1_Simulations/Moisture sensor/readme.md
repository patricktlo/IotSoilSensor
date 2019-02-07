# Moisture sensor simulation and calibration

I chose a fringing capacitance sensor because that's what was used in the articles I read and proved itself very efficient!

Here we have all files related to the simulation and calibration of the moisture sensor!

For simulation look at the simulation folder where you'll find LTSpice files for electrical simulations, FEMM files for estimating capacitance of the sensor (summary in the fringe_parameter_study.ods) and some timer-related calculations on the python notebook!

For calibration, test_caps.ods shows our circuit tested with capacitors, and it works extremely well!
On test_gravi.ods there's the gravimetric analysis I conducted in order to find out the equation which relates timer counts to humidity percentage.

