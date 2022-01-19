clear;
close all;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% Sistema Direção %%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resumo
% Gd: Planta direção
% Cd: Controlador direção
% Dd: Desejado direção
% Dd = feedback(Gd*Cd)

% Planta (servo motor) em malha aberta
c3 = 20.8902312455541;
c4 = 11.6618075801749;
Gd = tf(c3, [1 c4 0]);

% Tempo de subida minimo para +/-10°: 100 ms
% Tempo de acomodacao arbitrado: 150ms
ts = 0.15;

% OverShut - OS:  2%
os = 0.02;

% Calculo da dinamica desejada
zeta = -log(os) / sqrt(pi^2 + log(os)^2);
wn = 4 / (zeta * ts);

% Função de transferencia com dinamica desejada
Dd = tf(wn^2, [1 2 * zeta * wn wn^2]);

% Calculo dos paramentros do Controlador PDF
f = 2 * zeta * wn;
Kp = (wn * c4) / (2 * zeta * c3);
Kd = (2 * zeta * wn - c4) / (4 * zeta^2 * c3);  % Kp/c4 - Kp/f;

% Funcao de transferencia do controlador
Cd = tf([(Kp + Kd * f) Kp * f], [1 f]);

% Calculo da malha fechada resultante
Mfd = feedback(Cd * Gd, 1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Sistema de Inclinação %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resumo
% I: sistema de inclinação em malha aberta
% Gss: Sistema de inclinação no espaço de estados COM a dinamica do atuador

% Tau desejado
t = 10;

% gravidade: 10 m/s
g = 10;

% distancia entre eixos: 0.140 m
de = 0.14;

% distancia do centro de gravidade: 0.030 m
dc = 0.03;

% altura do centro de gravidade: 0.130 m
h = 0.13;

% velocidade (referência): 2.35 m/s
v = 2.35;

% função de transferencia arbitrária modelada:
% I(s) = (v/de)*(dc*s+v)/(h*s^2-g) = (v*dc*s/de+v^2/de)/(h*s^2-g)
I = tf([(v * dc) / (de * h)   v^2 / (de * h)], [1      0    -g / h]);

%%%%%%%%% Observador

Gss = ss(Dd * I);
polos = linspace(-300, -90, 4);
L = place(Gss.A', Gss.C', polos)';

%%%%%%%%% Dinamica desejada

ts = 0.25;

% OverShoot - OS:  2%
os = 0.02;

% Calculo da dinamica desejada
zeta = -log(os) / sqrt(pi^2 + log(os)^2);
wn = 4 / (zeta * ts);

% Função de transferencia desejada do sistema de inclinacao
Di = tf(wn^2, [1 2 * zeta * wn wn^2]);
polos = pole(Di);
polos = [polos' -90 -100 -110];

%%%%%%%%%% Projeto do controlador espaço de estados

% Aumenta o sistema com um integrador
A = [Gss.A zeros(size(Gss.A, 1), 1); -Gss.C 0];
B = [Gss.B; 0];
K = place(A, B, polos);
