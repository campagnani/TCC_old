clear
clc

load('dados_original.mat')

%Correção temporal
teste1(:,4) = (teste1(:,4)-teste1(1,4))/1000;
teste2(:,4) = (teste2(:,4)-teste2(1,4))/1000;
teste3(:,4) = (teste3(:,4)-teste3(1,4))/1000;
teste4(:,4) = (teste4(:,4)-teste4(1,4))/1000;
teste5(:,4) = (teste5(:,4)-teste5(1,4))/1000;
teste6(:,4) = (teste6(:,4)-teste6(1,4))/1000;
teste7(:,4) = (teste7(:,4)-teste7(1,4))/1000;

%Correção de tensão
tensao_prog=12;
tensao_real=23.7;

teste1(:,3) = teste1(:,3)*tensao_real/tensao_prog;
teste2(:,3) = teste2(:,3)*tensao_real/tensao_prog;
teste3(:,3) = teste3(:,3)*tensao_real/tensao_prog;
teste4(:,3) = teste4(:,3)*tensao_real/tensao_prog;
teste5(:,3) = teste5(:,3)*tensao_real/tensao_prog;
teste6(:,3) = teste6(:,3)*tensao_real/tensao_prog;
teste7(:,3) = teste7(:,3)*tensao_real/tensao_prog;

%Correção de tensão
velocidade_prog=0.0145;
velocidade_real=0.046666;

teste1(:,2) = teste1(:,2)*velocidade_real/velocidade_prog;
teste2(:,2) = teste2(:,2)*velocidade_real/velocidade_prog;
teste3(:,2) = teste3(:,2)*velocidade_real/velocidade_prog;
teste4(:,2) = teste4(:,2)*velocidade_real/velocidade_prog;
teste5(:,2) = teste5(:,2)*velocidade_real/velocidade_prog;
teste6(:,2) = teste6(:,2)*velocidade_real/velocidade_prog;
teste7(:,2) = teste7(:,2)*velocidade_real/velocidade_prog;



figure
grid on
hold on
plot(teste3(:,4),teste3(:,3))
plot(teste3(:,4),teste3(:,2)*5)
 
