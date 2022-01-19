clear
clc
load('tf_sistema_direcao.mat')
load('D_direcao.mat')

%Tal desejado
t=10;

%gravidade: 10 m/s
g=10;

%distancia entre eixos: 0.140 m
de = 0.14;

%distancia do centro de gravidade: 0.030 m 
dc = 0.03;

%altura do centro de gravidade: 0.130 m 
h = 0.13;

%velocidade (referência): 2.35 m/s
v=2.35;

%Calculo do Controlador
k=t + sqrt(g/h);

%função de transferencia arbitrária modelada: I(s) = (v/de)*(dc*s+v)/(h*s^2-g) = (v*dc*s/de+v^2/de)/(h*s^2-g)
I = tf([   (v*dc)/(de*h)   v^2/(de*h)   ],[    1      0    -g/h    ]);



%%%%%%%%%%%%%


ts=0.5;

%OverShut - OS:  2%
os = 0.02;

%Calculo da dinamica desejada
zeta = -log(os) / sqrt(pi^2 + log(os)^2);
wn = 4/(zeta*ts);

%Função de transferencia desejada
Desejado = tf([wn^2],[1 2*zeta*wn wn^2]);

polos = pole(Desejado);

polos = [polos' -80 -81];


%%%%%%%%%%%%%%%%


Gss = ss(D*I);

k = place(Gss.A, Gss.B, polos);

