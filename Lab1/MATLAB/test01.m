close all
clear all

% wy?wietlenie aproksymowanej funkcji
X=-1.5*pi:pi/100:1.5*pi;
D=funkcja(X);
figure(1); plot(X,D,'k'); hold on
legend('Prawdziwa funkcja');
pause

%zbi?r ucz?cy
Xlearn=-pi:pi/5:pi;
Dlearn=funkcja_z_szumem(Xlearn);
plot(Xlearn,Dlearn,'k*');
legend('Prawdziwa funkcja','Zbior uczacy');
pause


% stworzenie sieci
net=newff([-pi,pi],[8 1],{'tansig','purelin'},'trainlm');
net.trainParam.epochs = 200;
net.trainParam.showWindow = false;

% uczenie sieci
net=train(net,Xlearn,Dlearn);

% obliczenie i wy?wietlenie funcji realizowanej przez sie?
Y = sim(net,X);
plot(X,Y,'b')
legend('Prawdziwa funkcja','Zbior uczacy','Model neuronowy');
pause

% obliczenie b??du dla zb. ucz?cego
Ylearn = sim(net,Xlearn);
Elearn=mse(Dlearn - Ylearn)
pause

%zbi?r testowy
Xtest=Xlearn+pi/10;
Dtest=funkcja_z_szumem(Xtest);
plot(Xtest,Dtest,'r*');
legend('Prawdziwa funkcja','Zbior uczacy','Model neuronowy','Zbior testowy');
pause

% obliczenie b??du dla zb. testowego
Ytest = sim(net,Xtest);
Etest=mse(Dtest - Ytest)




 