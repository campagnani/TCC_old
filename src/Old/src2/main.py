from subprocess import Popen, PIPE
from time import sleep
import time
import threading
import RPi.GPIO as GPIO

from pyPS4Controller.controller import Controller

def envia_referencia():
    process.stdin.write("10000".encode())
    print(process.stdin.read())
    #process.stdin.close() # done (no more input)
    #process.wait()

class MyController(Controller):

    def __init__(self, **kwargs):
        Controller.__init__(self, **kwargs)

    #Digitais

    def on_x_press(self):
        envia_referencia()

    #def on_square_press(self):
        


""" Chama processo """
process = Popen(['./a.out'], stdin=PIPE, bufsize=-1)

""" Iniciado Sistema de Seleção pelo Controle de PS4"""
controller = MyController(interface="/dev/input/js0", connecting_using_ds4drv=False)
controller.listen()
