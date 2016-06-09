import serial,time

ser = serial.Serial('COM3',115200)

rx=0
while 1:
    rx=ser.readline(1);
    print ord(rx)# convertir a numero
    print rx# mantiene en ascii
    time.sleep(0.2)
