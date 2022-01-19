clc
clear

syms c3 c4 s Kp Kd f

G = c3/(s^2+c4*s);

C = Kp + Kd*s*f/(s+f);

Mf = C*G/(1+C*G);

%Malha Aberta para c4 = Kp*f/(Kp+Kd*f)

Ma = c3*(Kp+Kd*f)/(s^2+s*f);

Mf2 = Ma/(1+Ma);

disp("G =")
pretty(simplify(G))
disp("C =")
pretty(simplify(C))
disp("Ma =")
pretty(simplify(Ma))
disp("Mf2 =")
pretty(simplify(Mf2))