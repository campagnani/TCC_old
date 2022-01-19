clc
clear

syms s c1 c2 Kp Ki

G = c1/(s+c2);

C = Kp + Ki/s;

Mf = C*G/(1+C*G);

pretty(Mf)

pretty(simplify(Mf))