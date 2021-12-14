from time import sleep
import board
import busio
i2c = busio.I2C(board.SCL, board.SDA)
import adafruit_ads1x15.ads1115 as ADS
from adafruit_ads1x15.analog_in import AnalogIn

ads = ADS.ADS1115(i2c)

while(1):
    chan = AnalogIn(ads, ADS.P0)
    angulo = (chan.value-12981.33333333)/116.44444444
    print(angulo)
    sleep(0.1)
