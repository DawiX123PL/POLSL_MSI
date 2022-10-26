clear all
close all
clc

%%
% wygenerowanie zbioru uczącego
disp("wygenerowano nowy zbior uczacy");

X_learn = -pi/2 : pi/20 : 3.5*pi;
Y_learn = sin(0.9 * X_learn).*cos(2*X_learn) + 0.1 * rand(1,length(X_learn));

plot(X_learn, Y_learn, '*')
grid on

%% 
% wygenerowanie zbioru testowego

X_test = -pi/2 : pi/100 : 3.5*pi;
Y_test = sin(0.9*X_test) .* cos(2*X_test) + 0.1 * rand(1,length(X_test));

hold on
plot(X_test, Y_test, '.')
grid on
legend("Zbiór Uczący", "Zbiór Testowy")

saveas(gcf,'Zbiory.png')

%%
% zadanie 5b

L = [1:1:25, 50, 100] % liczba neuronow

i = 1;
for liczba_neuronow = L

    disp("Petla nr: " + string(liczba_neuronow));
    
    clear net
    net=newff([-pi/2, 3.5*pi], [liczba_neuronow 1], {'tansig','purelin'}, 'trainlm');
    net.trainParam.epochs = 20;
    net.trainParam.showWindow = false;
    net=train(net,X_learn,Y_learn);

    Y_out_learn = sim(net,X_learn);
    Y_out_test = sim(net,X_test);

    b_mse_learn(i) = mse( Y_learn - Y_out_learn);
    b_mse_test(i) = mse( Y_test - Y_out_test);
    i = i + 1;

end


figure
plot(L, b_mse_learn, 'o-'); hold on
plot(L, b_mse_test, '*-')
grid on

legend("MSE uczącego", "MSE testowego");
xlabel("Liczba neuronów")
ylabel("MSE")
saveas(gcf,'zad5b.png')

%%
% zadanie 5c


wiele_funkcje_aktywacji = ["tansig", "logsig" ,"purelin", "hardlim", "softmax"]

clear c_mse_learn
clear c_mse_test

i = 1;
for funkcja_aktywacji = wiele_funkcje_aktywacji

    disp("Funkcja aktywacji - " + string(funkcja_aktywacji));

    clear net
    net=newff([-pi/2, 3.5*pi], [8 1], {funkcja_aktywacji,'purelin'}, 'trainlm');
    net.trainParam.epochs = 20;
    net.trainParam.showWindow = true;
    net=train(net,X_learn,Y_learn);


    Y_out_learn = sim(net,X_learn);
    Y_out_test = sim(net,X_test);

    c_mse_learn(i) = mse( Y_learn - Y_out_learn);
    c_mse_test(i) = mse( Y_test - Y_out_test);
    i = i + 1;

end

figure
plot(c_mse_learn, 'o'); hold on
plot(c_mse_test, '*')
grid on

legend("MSE uczącego", "MSE testowego");
xticks(1:length(wiele_funkcje_aktywacji))
xticklabels(wiele_funkcje_aktywacji)
xlim([.5, (length(wiele_funkcje_aktywacji) +.5) ])

xlabel("Funkcja aktywacji")
ylabel("MSE")

saveas(gcf,'zad5c.png')
