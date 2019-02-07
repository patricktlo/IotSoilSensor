import serial
import sqlite3
import numpy as np
from scipy.interpolate import interp1d

# Relative humidity values list
rh_vals={0:  [100e6, 100e6, 6.4e6, 2.9e6, 1.4e6, 700e3, 370e3, 190e3, 105e3, 62e3, 38e3  ,   23e3, 15.5e3, 10.5e3, 7.1e3],
        5:  [100e6, 10e6,   4.6e6, 2.1e6, 1.0e6, 500e3, 260e3, 140e3, 80e3,  48e3, 30e3  ,   18e3, 12e3  , 8.2e3 , 5.3e3],
        10: [100e6, 7e6,    3.2e6, 1.5e6, 750e3, 380e3, 200e3, 110e3, 62e3,  37e3, 24e3  ,   15e3, 10e3  , 6.8e3 , 4.7e3],
        15: [10e6,   5e6,    2.3e6, 1.1e6, 540e3, 280e3, 150e3, 84e3 , 50e3,  30e3, 19e3  ,   12e3, 8e3   , 5.5e3 , 4.0e3],
        20: [6.7e6,  3.4e6,  1.75e6,850e3, 420e3, 210e3, 115e3, 64e3 , 39e3,  24e3, 15.5e3,   10e3, 7e3   , 4.8e3 , 3.3e3],
        25: [5e6,    2.6e6,  1.3e6, 630e3, 310e3, 160e3, 87e3,  49e3 , 31e3,19.5e3, 13e3  ,  8.4e3, 5.7e3 , 4e3,    2.8e3],
        30: [3.9e6,  1.9e6,  970e3, 460e3, 235e3, 125e3, 69e3,  39e3 , 25e3,  16e3,10.5e3 ,  7.2e3, 5.0e3 , 3.5e3,  2.5e3], 35: [3.0e6,  1.5e6,  740e3, 380e3, 190e3, 100e3, 56e3,  33e3, 20e3,   13e3, 9e3   ,  6.2e3, 4.3e3 , 3.1e3,  2.2e3], 40: [2.4e6,  1.1e6,  570e3, 280e3, 140e3, 78e3,  45e3,  27e3,17.5e3,11.5e3, 8e3   ,  5.6e3, 3.9e3 , 2.8e3,  2e3  ],
        45: [1.75e6, 880e3,  420e3, 210e3, 110e3, 64e3,  38e3,  24e3, 15e3,   10e3, 7e3   ,  4.9e3, 3.4e3 , 2.4e3,  1.8e3]     
       } 

# function for rounding to nearest five (for rounding temperature)
def round_nearest_5(x):
    return int( 5 * round(float(x)/5))

# Starts serial connection
ser = serial.Serial("/dev/ttyS0", 115200)

# Infinite loop. Should change to something more elegant in the future
while True:

    # Get data (10 bytes) from the serial port
    received_data = ser.read(10)
    
    # Print the received data
    print(received_data)

    # decode message data
    temp_b = ((received_data[0] << 4) + ((received_data[1] & 0x0f)))
    MS_b = ((received_data[2] << 8) + received_data[3])
    rh_b = ((received_data[4] << 16) + (received_data[5] << 8) + (received_data[6]))
    rhp_b = rh_b >> 12
    rhm_b = rh_b & 0xfff
    message_nb = ((received_data[7] << 6) + ((received_data[8] & 0xFC) >> 2))
    devid = (((received_data[8] & 0x03) << 8) + received_data[9])
    
    # decode brutes into real values

    # Temperature
    p = np.poly1d([161.36243645, -211.11332061,  177.88707646,  -31.2102803])
    temp = p(temp_b/4095)

    # MS

    ## Get capacitance in pF

    if (devid == 1):
        calib_factor = 30013 #22564
    elif (devid == 2):
        calib_factor = 30134


    MS_pf = (-1e12*(MS_b-calib_factor)/(8e6*np.log(0.5)*240e3))

    ## Translates from capacitance to % humidity. Depends on the sensor, hence the devid separation
    if (devid == 1):
        MS = MS_pf/2
    elif (devid == 2):
        MS = MS_pf*0.05851232

    # Air humidity
    rh_x = np.linspace(20,90,15)

    ## create interpolation function
    f = interp1d(rh_vals[round_nearest_5(temp)][::-1], rh_x[::-1])

    ## Get R_rh given the output
    adc_val = np.absolute(rhp_b-rhm_b)/4095
    R_rh = 47e3*(1-adc_val)/(2*adc_val)

    ## use the interpolation function and the resistor value to find RH
    try:
        if (devid == 1):
            rh = 2*f(R_rh) - 18.12
        elif (devid == 2):
            rh = f(R_rh)
    except:
        rh = 20


    # Connect to database
    conn = sqlite3.connect('sensordata.db')
    
    curs = conn.cursor()

    # Send info to both databases, both brutes and decoded values
    curs.execute("INSERT INTO sensorbrutes(temperature, air_humidity, soil_humidity, msg_nb, devid, currentdate) values({},{},{},{},{},CURRENT_TIMESTAMP)".format(temp_b, (rhp_b-rhm_b), MS_b,message_nb, devid))
    curs.execute("INSERT INTO sensorvals(temperature, air_humidity, soil_humidity, msg_nb, devid, currentdate) values({},{},{},{},{},CURRENT_TIMESTAMP)".format(temp, rh, MS,message_nb, devid ))

    # Commit and close database connection
    conn.commit() 
    conn.close()

    # Print in terminal
    print(MS_b)
    print(temp)
    print(MS)
    print(MS_pf)
    print(rhp_b)
    print(rhm_b)
    print(rh)
    print(message_nb)
    print(devid)



