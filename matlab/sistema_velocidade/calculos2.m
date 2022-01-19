clc
clear
close


c1 = 0.103328517209390;
c2 = 0.522020844094288;




%Tempo de subida minimo para variação 10% do P.O.: 200 ms
%Tempo de acomodacao arbitrado: 1s
ts=0.5  ;

%OverShut - OS:  2%
os = 0.02;

%Calculo da dinamica desejada
zeta = -log(os) / sqrt(pi^2 + log(os)^2);
wn = 4/(zeta*ts);


%Calculo dos ganhos do controlador
Kp = (2*zeta*wn - c2)/c1;
Ki = wn^2/c1;


G = tf(c1,[1 c2]);

C = tf([Kp Ki],[1 0]);

Ma = G*C;

Mf = C*G/(1+C*G);%feedback(Ma,1);

D = tf([c1*Kp wn^2],[1 2*zeta*wn wn^2]);

step(Mf)
hold on
step(D)
