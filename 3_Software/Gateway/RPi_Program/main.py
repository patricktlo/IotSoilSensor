
import serial

ser = serial.Serial('/dev/ttyUSB0', 115200, timeout=1)
print(ser.name)

# Read 6 bytes
input = ser.read(6);

print(input)

ser.close()


