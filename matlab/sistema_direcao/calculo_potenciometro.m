close all
clear
clc

x = [-90 0 90];
y = [2576 12832 23536];
%plot(x,y)
funcao = polyfit(x,y,1)

resultado = -90*funcao(1) + funcao(2)

inv = (23536-funcao(2))/funcao(1)