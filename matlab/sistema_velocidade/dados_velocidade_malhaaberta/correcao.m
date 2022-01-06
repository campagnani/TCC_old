clear
clc

load('dadosV_original.mat')

%Correção temporal: ms para s
teste1(:,4) = (teste1(:,4)-teste1(1,4))/1000;
teste2(:,4) = (teste2(:,4)-teste2(1,4))/1000;
teste3(:,4) = (teste3(:,4)-teste3(1,4))/1000;
teste4(:,4) = (teste4(:,4)-teste4(1,4))/1000;
teste5(:,4) = (teste5(:,4)-teste5(1,4))/1000;
teste6(:,4) = (teste6(:,4)-teste6(1,4))/1000;
teste7(:,4) = (teste7(:,4)-teste7(1,4))/1000;
teste8(:,4) = (teste8(:,4)-teste8(1,4))/1000;
teste9(:,4) = (teste9(:,4)-teste9(1,4))/1000;
teste10(:,4) = (teste10(:,4)-teste10(1,4))/1000;
teste11(:,4) = (teste11(:,4)-teste11(1,4))/1000;
teste12(:,4) = (teste12(:,4)-teste12(1,4))/1000;
teste13(:,4) = (teste13(:,4)-teste13(1,4))/1000;
teste14(:,4) = (teste14(:,4)-teste14(1,4))/1000;
teste15(:,4) = (teste15(:,4)-teste15(1,4))/1000;
teste16(:,4) = (teste16(:,4)-teste16(1,4))/1000;

save('dados_velocidade.mat')