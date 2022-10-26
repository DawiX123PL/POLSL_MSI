clear all
close all
clc

%%
% wygenerowanie zbioru uczącego


X_learn = -pi/2 : pi/20 : 3.5*pi;
Y_learn = sin(0.9 * X_learn).*cos(2*X_learn) + 0.1 * rand(1,length(X_learn));



%%



net=newff([-pi/2, 3.5*pi], [8 16 1], {'tansig','tansig','purelin'}, 'trainlm');
net.trainParam.epochs = 2000;
net.trainParam.showWindow = true;

net=train(net,X_learn,Y_learn);

X_test = -pi/2 : pi/100 : 3.5*pi;
Y_test = sin(0.9*X_test) .* cos(2*X_test) + 0.1 * rand(1,length(X_test));

Y_out = sim(net,X_test);


plot(X_learn, Y_learn); hold on
plot(X_test, Y_test);
plot(X_test, Y_out);

legend("Uczacy", "Testowy", "Wyjscie")


Etest1 = mse(Y_test - Y_out);
Etest2 = mse(net, Y_test, Y_out);






