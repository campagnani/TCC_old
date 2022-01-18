#!/usr/bin/env python3

import sys
import time
import threading
from subprocess import Popen, PIPE
from pyPS4Controller.controller import Controller

tax_amo = 0.05
ref_velocidade = -1
ref_direcao = 0
processo_controladores = 0
i = 0

def concatena_ref_sinal_direto(ref):
    i= int(ref*1000)
    if(i>1000):
        i=1000
    if(i<-1000):
        i=-1000
    if(i>=0):
        i += 10000
    if(i<0):
        i = -i + 20000
    return i

def concatena_ref_controlador(ref):
    i= int(ref*1000)
    if(i>5000):
        i=5000
    if(i<0):
        i=30000
    return i

def envia_referencia():
    i = concatena_ref_controlador(ref_velocidade)
    processo_controladores.stdin.write(f"{i:#05d}".encode())
    processo_controladores.stdin.flush()
    threading.Timer(tax_amo,envia_referencia).start()



class MyController(Controller):

    def __init__(self, **kwargs):
        Controller.__init__(self, **kwargs)

    #Digitais

    def on_x_press(self):
        envia_referencia()

    def on_x_release(self):
        i

    def on_square_press(self):
        processo_controladores.stdin.write("x0000".encode())
        processo_controladores.stdin.close()
        processo_controladores.wait()
    
    def on_triangle_press(self): #"""Executa Controladores """
        global processo_controladores
        processo_controladores = Popen(['./controladores.bin'], stdin=PIPE, bufsize=5)
    
    #Analogicos
    def on_R3_left(self, value):    #Ref Direção
        global ref_direcao
        ref_direcao = 2*value/3276.7  #Ref em Graus, limitando a 10°

    def on_R3_right(self, value):   #Ref Direção
        global ref_direcao
        ref_direcao = 2*value/3276.7  #Ref em Graus, limitando a -10°

    def on_R3_x_at_rest(self):
        global ref_direcao
        ref_direcao = 0

    def on_R3_up(self, value):
        i

    def on_R3_down(self, value):
        i

    def on_R3_y_at_rest(self):
        i

    def on_R3_press(self):
        i

    def on_L3_left(self, value):
        i

    def on_L3_right(self, value):
        i

    def on_L3_x_at_rest(self):
        i
    
    def on_L3_up(self, value):
        global ref_velocidade
        ref_velocidade = -value/32767*3

    def on_L3_down(self, value):
        global ref_velocidade
        ref_velocidade = -1#-value/32767

    def on_L3_y_at_rest(self):
        global ref_velocidade
        ref_velocidade = 0

    def on_L3_press(self):
        i
    
    def on_left_arrow_press(self):
        global ref_velocidade
        ref_velocidade = -1
    def on_right_arrow_press(self):
        global ref_velocidade
        ref_velocidade = 2.35
    def on_up_arrow_press(self):
        global ref_velocidade
        ref_velocidade = 2.5
    def on_down_arrow_press(self):
        global ref_velocidade
        ref_velocidade = 2
        


""" Compila Controladores """
compila_controladores = Popen(['g++','controladores.cpp','-lpigpio','-o','controladores.bin'])
compila_controladores.wait()


""" Iniciado Sistema de Seleção pelo Controle de PS4"""
controller = MyController(interface="/dev/input/js0", connecting_using_ds4drv=False)
controller.listen()
