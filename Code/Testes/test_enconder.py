# -*- coding: utf-8 -*-
#! /usr/bin/python

from time import sleep
import time
import threading
import RPi.GPIO as GPIO

""" Global """
pin_encoder = 22
pulse_counter = 0
velocidade = 0
tempo_amostragem = 0.1

""" Funcoes """
def conte(pin):
    global pulse_counter
    pulse_counter = pulse_counter+1

def mede_velocidade(time):
    global pulse_counter
    distancia  = pulse_counter;# * 0.00145 / (time * 0.001)
    pulse_counter  = 0
    return distancia

def resgata_velocidade_linear_instantanea ():
    global velocidade
    velocidade = mede_velocidade(tempo_amostragem)
    print(velocidade)
    threading.Timer(tempo_amostragem,resgata_velocidade_linear_instantanea).start()
    


""" Configurando GPIO """
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(pin_encoder, GPIO.IN, GPIO.PUD_UP)
GPIO.add_event_detect(pin_encoder, GPIO.BOTH, callback = conte)

resgata_velocidade_linear_instantanea ()



#while(1):
    #print("Count: " + str(pulse_counter))
    #sleep(0.01)

#GPIO.cleanup()