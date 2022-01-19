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

%velocidade (referência): 5 m/s
v=2.35;

%Calculo do Controlador
k=t + sqrt(g/h);

%função de transferencia arbitrária modelada: I(s) = (v/de)*(dc*s+v)/(h*s^2-g) = (v*dc*s/de+v^2/de)/(h*s^2-g)

I = tf([   (v*dc)/(de*h)   v^2/(de*h)   ],[    1      0    -g/h    ]);

Co = tf([1 sqrt(g/h)],[ (v*dc)/(h*de)    v^2/(de*h) ]); 

C = k;

Ma = I*Co*C

Mf = feedback(Ma,1)

Mfd = tf([k],[1 t])

figure
hold on
pzmap(I)
pzmap(D)
%figure
%pzmap(Co)
%figure
%pzmap(Mf)