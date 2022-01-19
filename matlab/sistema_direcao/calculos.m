close
clear
clc
load('tf_direcao.mat')

%Planta
c3 = 20.8902312455541;
c4 = 11.6618075801749;
G = tf([ c3 ],[ 1 c4 0 ]);


%Tempo de subida minimo para +/-10°: 100 ms
%Tempo de acomodacao arbitrado: 150ms
ts=0.15;

%OverShut - OS:  2%
os = 0.02;

%Calculo da dinamica desejada
zeta = -log(os) / sqrt(pi^2 + log(os)^2);
wn = 4/(zeta*ts);

%Função de transferencia desejada
D = tf([wn^2],[1 2*zeta*wn wn^2])

%Calculo dos paramentros do Controlador
f = 2*zeta*wn;
Kp = (wn*c4)/(2*zeta*c3);
Kd = (2*zeta*wn-c4)/(4*zeta^2*c3);  %Kp/c4 - Kp/f;

%Funcao de transferencia do controlador
C = tf([ (Kp + Kd*f) Kp*f ],[1 f]);

%Calculo da malha fechada resultante
Mf = feedback(C*G,1)

hold on
pzmap(D)
figure
pzmap(Mf)
