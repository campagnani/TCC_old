clc
clear
close

syms k s g h

Ma = k/(s-sqrt(g/h));
Mf = Ma/(1+Ma);

pretty(simplify(Mf))