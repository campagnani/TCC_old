# -*- coding: utf-8 -*-
#! /usr/bin/python

from time import sleep
import time
import threading
import RPi.GPIO as GPIO
import sweep

#Controle PS4
from pyPS4Controller.controller import Controller

#Potenciometro
import board
import busio
i2c = busio.I2C(board.SCL, board.SDA)
import adafruit_ads1x15.ads1115 as ADS
from adafruit_ads1x15.analog_in import AnalogIn

#Matar processo
import sys

#MPU
from MPU6050 import MPU6050

#PWM
from rpi_hardware_pwm import HardwarePWM





""" Global """
ok=0#Faça Nada
Sc_Mt=0         #Sinal de Controle - Motor Traseiro
Sc_Sm=0         #Sinal de Controle - Servo Motor
Sc_Md=0         #Sinal de Controle - Motor Dianteiro
velocidade=0    #Velocidade - Encoder
inclincacao=0   #Inclinação - MPU
direcao=0       #Direção    - Portenciometro
ref_direcao=0   #Referência de direção    oriunda do controle de PS4
ref_velocidade=0  #Referência de velocidade oriunda do controle de PS4
inclincacao=0
aceleracao=0
direcao = 0
pin_encoder = 10#22
pulse_counter = 0
tempo_amostragem = 0.01
tempo_amostragem2 = 0.009
tempo_amostragem_tabela = 0.01
iErro = 0
erroAnterior = 0
anti_windup = 0
ScA=0
iErro_vel = 0
erroAnterior_vel = 0

kp=0
kd=0
zm=0
reset = False

arquivo = open("./tabela", "w")


""" Funcoes """

def conte(pin): #Interrupção encoder
    global pulse_counter
    pulse_counter = pulse_counter+1


def PHD(duty):
    global pwm0
    global pwm1
    global zm
    if(duty != 0):                          #Se o duty é diferente de 0, soma a Zona Morta e Verifica Saturacao
        #zm = 10
        if (duty > 0):
            duty +=  zm
        elif (duty < 0):
            duty += -zm
        if   (duty >  100):
            duty =  100
        elif (duty < -100):
            duty = -100
    if (duty>0):
        pwm0.change_duty_cycle(duty)
        pwm1.change_duty_cycle(0)
    else:
        pwm0.change_duty_cycle(0)
        pwm1.change_duty_cycle(-duty)
    return duty






def PHT(duty):
    global pwm2
    global pwm3
    if(duty != 0):                          #Se o duty é diferente de 0, soma a Zona Morta e Verifica Saturacao
        zm = 0
        if (duty > 0):
            duty +=  zm
        elif (duty < 0):
            duty += -zm
        if   (duty >  100):
            duty =  100
        elif (duty < -100):
            duty = -100

    if (duty>0):
        pwm2.ChangeDutyCycle(duty)
        pwm3.ChangeDutyCycle(0)
    else:
        pwm2.ChangeDutyCycle(0)
        pwm3.ChangeDutyCycle(-duty)
    return duty





def mede_velocidade(time):
    global pulse_counter
    velocidade  = float(pulse_counter) * 0.00145 / time
    pulse_counter  = 0
    return velocidade

def mede_volante():
    chan = AnalogIn(ads, ADS.P0)
    angulo = (chan.value-12981)/116
    return angulo

def mede_inclinacao():
    global inclincacao
    FIFO_count = mpu.get_FIFO_count()
    mpu_int_status = mpu.get_int_status()
    if (FIFO_count == 1024) or (mpu_int_status & 0x10):
	    mpu.reset_FIFO()
        #return "X"
    elif (mpu_int_status & 0x02):
        while FIFO_count < packet_size:
            FIFO_count = mpu.get_FIFO_count()
        FIFO_buffer = mpu.get_FIFO_bytes(packet_size)
        accel = mpu.DMP_get_acceleration_int16(FIFO_buffer)
        quat = mpu.DMP_get_quaternion_int16(FIFO_buffer)
        grav = mpu.DMP_get_gravity(quat)
        roll_pitch_yaw = mpu.DMP_get_euler_roll_pitch_yaw(quat, grav)
        #print('roll: ' + str(roll_pitch_yaw.x))
        #print('pitch: ' + str(roll_pitch_yaw.y))
        #print('yaw: ' + str(roll_pitch_yaw.z))
        return roll_pitch_yaw.z
    return inclincacao






def controlador_velocidade():
    global iErro_vel
    global dErro
    global erroAnterior_vel
    coisa = threading.Timer(tempo_amostragem,controlador_velocidade)
    if not reset:
        coisa.start()
    velocidade = mede_velocidade(tempo_amostragem)
    kp=500
    kd=0
    ki=0
    kw=0
    erroAtual = (0.25 + 0.75*ref_velocidade/32767) - velocidade

    #Integral do erro
    iErro_vel += erroAtual

    #Derivativo do Erro
    dErro = (erroAtual - erroAnterior_vel) / tempo_amostragem2 #Não pode passar erroP para o derivativo
    erroAnterior_vel = erroAtual

    #PID    
    Sc = kp*erroAtual #+ kd*dErro# + ki*iErro 
    PHT(Sc)
    #print(str(Sc)+"\t"+str(velocidade))
    






def controlador_volante():
    global Sc_Sm    #Sinal de Controle - Servo Motor
    global Sc_Md    #Sinal de Controle - Motor Dianteiro
    global direcao 
    global ref_direcao
    
    global iErro
    global erroAnterior
    global anti_windup
    global ScA
    global kp #kp=10
    global kd #kd=0

    ki=0
    kw=0

    #erro
    direcao = mede_volante()
    erroAtual = ref_direcao - direcao
    

    #Erro permissível
    if ((erroAtual<0.25) and (erroAtual>-0.25)):
        erroP = 0 
    else:
        erroP = erroAtual

    #Integral do erro
    #iErro += erroP #- anti_windup*kw

    #Derivativo do Erro
    dErro = (erroAtual - erroAnterior) / tempo_amostragem2 #Não pode passar erroP para o derivativo
    erroAnterior = erroAtual

    #PID    
    Sc = kp*erroP + kd*dErro + ki*iErro 
    

    #anti_windup
    #anti_windup = ScA - Sc
    Sc_Md = PHD(Sc)
    #print(time.time())
    coisa = threading.Timer(tempo_amostragem2,controlador_volante)
    if not reset:
        coisa.start()
    





def controlador_pendulo():
    inclincacao = mede_inclinacao()
    print(inclincacao)
    threading.Timer(tempo_amostragem2,controlador_pendulo).start()




def imprime_tabela():
    global arquivo
    arquivo.write(str(round(ref_direcao,1)) + "\t" + str(round(direcao,1)) + "\t" + str(round(Sc_Md,1)) + "\t" + str(round(kp,0)) + "\t" + str(round(kd,2)) + "\t" + str(round(zm,0)) + "\n")
    print(str(round(ref_direcao,1)) + "\t" + str(round(direcao,1)) + "\t" + str(round(Sc_Md,1)) + "\t" + str(round(kp,0)) + "\t" + str(round(kd,2)) + "\t" + str(round(zm,0)))
    threading.Timer(tempo_amostragem_tabela,imprime_tabela).start()




w=0
tinicial=0
def motord_manual():
    global arquivo
    direcao = mede_volante()
    w=w+1
    ref_direcao = sweep[w]
    PHD(ref_direcao*10)
    arquivo.write(str(ref_direcao*0.7)+"\t"+str(direcao)+"\t"+str(time.time()-tinicial)+";\n")
    threading.Timer(0.007,motord_manual).start()






""" Configurações de Controle """

class MyController(Controller):

    def __init__(self, **kwargs):
        Controller.__init__(self, **kwargs)

    #Digitais

    def on_x_press(self):
        reset = False
        controlador_velocidade()

    def on_square_press(self):
        reset = False
        controlador_volante()

    def on_triangle_press(self):
        reset = False
        controlador_pendulo()

    def on_playstation_button_press(self):
        global pwm0 
        global pwm1
        global pwm2 
        global pwm3
        global reset
        reset = True
        pwm0.stop()
        pwm1.stop()
        pwm2.stop()
        pwm3.stop()


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
        ok

    def on_R3_down(self, value):
        ok

    def on_R3_y_at_rest(self):
        ok

    def on_R3_press(self):
        global tinicial
        tinicial = time.time()
        motord_manual()

    def on_L3_left(self, value):
        ok

    def on_L3_right(self, value):
        ok

    def on_L3_x_at_rest(self):
        ok
    
    def on_L3_up(self, value):
        global ref_velocidade
        ref_velocidade = -value

    def on_L3_down(self, value):
        global ref_velocidade
        ref_velocidade = -value/4

    def on_L3_y_at_rest(self):
        global ref_velocidade
        ref_velocidade = 0

    def on_L3_press(self):
        ok

    def on_options_press(self):
        imprime_tabela()

    def on_up_arrow_press(self):
        global kp
        kp += 1
    def on_down_arrow_press(self):
        global kp
        kp -= 1
        '''
    def on_left_arrow_press(self):
        global kd
        kd -= 0.1
    def on_right_arrow_press(self):
        global kd
        kd += 0.01
        '''
    def on_left_arrow_press(self):
        global ref_direcao
        ref_direcao = 10
    def on_right_arrow_press(self):
        global ref_direcao
        ref_direcao = -10
    def on_left_right_arrow_release(self):
        global ref_direcao
        ref_direcao = 0
    
    def on_R1_press(self):
        global zm
        zm += 1
    def on_L1_press(self):
        global zm
        zm -= 1




""" Configurando GPIO """
ads = ADS.ADS1115(i2c)
GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)
GPIO.setup(pin_encoder, GPIO.IN, GPIO.PUD_UP)
GPIO.add_event_detect(pin_encoder, GPIO.BOTH, callback = conte)





""" Inicializando Hardware PWM """
pwm0 = HardwarePWM(pwm_channel=0, hz=5000)
pwm1 = HardwarePWM(pwm_channel=1, hz=5000)
pwm0.start(0) # 0 duty cycle
pwm1.start(0) # 0 duty cycle


""" Iniciando o Software PWM """
GPIO.setup(23,GPIO.OUT)
GPIO.setup(24,GPIO.OUT)
pwm2 = GPIO.PWM(23, 1000)#16
pwm3 = GPIO.PWM(24, 1000)#18
pwm2.start(0)
pwm3.start(0)




"""MPU"""
i2c_bus = 1
device_address = 0x68
x_accel_offset = -5489
y_accel_offset = -1441
z_accel_offset = 1305
x_gyro_offset = -2
y_gyro_offset = -72
z_gyro_offset = -5
enable_debug_output = True

mpu = MPU6050(i2c_bus, device_address, x_accel_offset, y_accel_offset,
              z_accel_offset, x_gyro_offset, y_gyro_offset, z_gyro_offset,
              enable_debug_output)

mpu.dmp_initialize()
mpu.set_DMP_enabled(True)
mpu_int_status = mpu.get_int_status()
packet_size = mpu.DMP_get_FIFO_packet_size()
FIFO_count = mpu.get_FIFO_count()
FIFO_buffer = [0]*64
FIFO_count_list = list()







""" Iniciado Sistema de Seleção pelo Controle de PS4"""
controller = MyController(interface="/dev/input/js0", connecting_using_ds4drv=False)
controller.listen()

