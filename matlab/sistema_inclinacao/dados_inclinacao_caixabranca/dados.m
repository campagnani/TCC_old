clear
clc

%gravidade: 10 m/s
g=10;

%distancia entre eixos: 0.140 m
d_e = 0.14;

%distancia do centro de gravidade: 0.030 m 
d_c = 0.03;

%altura do centro de gravidade: 0.130 m 
h = 0.13;

%velocidade (referência): 1 m/s
v=1;

%função de transferencia arbitrária modelada: I(s) = (v/d_e)*(d_c*s+v)/(h*s^2-g) = (v*d_c*s/d_e+v^2/d_e)/(h*s^2-g)

I = tf([   v*d_c/(d_e*h)   v^2/(d_e*h)   ],[    1      0    -g/h    ]);

save('ft_inclinacao.mat','I')
clear
load('ft_inclinacao.mat')