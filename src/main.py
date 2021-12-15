#!/usr/bin/env python3

from subprocess import Popen, PIPE
from time import sleep
import time
import threading
import sys
#import RPi.GPIO as GPIO

from pyPS4Controller.controller import Controller


i = 0
def envia_referencia():
    global i
    proc_pendulo.stdin.write(f"{i:#05d}".encode())
    i += 100
    if(i>=2000):
        i=0

def fechar():
    proc_pendulo.stdin.write("x0000".encode())
    proc_velocidade.stdin.write("x0000".encode())
    proc_pendulo.stdin.close()
    proc_velocidade.stdin.close()
    proc_pendulo.wait()
    proc_velocidade.wait()
    sys.exit()


class MyController(Controller):

    def __init__(self, **kwargs):
        Controller.__init__(self, **kwargs)

    #Digitais

    def on_x_press(self):
        envia_referencia()

    def on_square_press(self):
        fechar()
        


""" Compila Controladores """
comp_velocidade = Popen(['g++','velocidade.cpp','-lpigpio','-o','velocidade.bin'], stdin=PIPE, bufsize=5)
comp_velocidade.wait()
comp_pendulo = Popen(['g++','pendulo.cpp','-lpigpio','-o','pendulo.bin'], stdin=PIPE, bufsize=5)
comp_pendulo.wait()

"""Executa Controladores """
proc_velocidade = Popen(['./velocidade.bin'], stdin=PIPE, bufsize=5)
proc_pendulo = Popen(['./pendulo.bin'], stdin=PIPE, bufsize=5)

""" Iniciado Sistema de Seleção pelo Controle de PS4"""
controller = MyController(interface="/dev/input/js0", connecting_using_ds4drv=False)
controller.listen()
