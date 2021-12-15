from subprocess import Popen, PIPE
from time import sleep
import time
import threading
import RPi.GPIO as GPIO
import socket
import sys

from pyPS4Controller.controller import Controller

def envia_referencia():
    data="001000 " #data="r 001000 "
    sock.send(data.encode())

def fecha_programa():
    data="x"
    sock.send(data.encode())

class MyController(Controller):

    def __init__(self, **kwargs):
        Controller.__init__(self, **kwargs)

    #Digitais

    def on_x_press(self):
        envia_referencia()

    def on_square_press(self):
        fecha_programa()
        sys.exit()
        


#""" Chama processo """
#process = Popen(['./a.out'], stdin=PIPE, bufsize=-1)

""" Cria Soket """
# Create a TCP/IP socket
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.connect(('localhost', 54000))

""" Iniciado Sistema de Seleção pelo Controle de PS4 """
controller = MyController(interface="/dev/input/js0", connecting_using_ds4drv=False)
controller.listen()
