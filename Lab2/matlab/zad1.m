clear all
close all
clc



%%
% wzorce 4x4

wzorce4x4

mkdir("../wzorce_2_4x4/")
wzorce = {A_1, A_2}
process_wzorce(wzorce, A_1, 3, "../wzorce_2_4x4/A_1.png")
process_wzorce(wzorce, A_2, 3, "../wzorce_2_4x4/A_2.png")

mkdir("../wzorce_4_4x4/")
wzorce = {A_1, A_2, A_4, A_7}
process_wzorce(wzorce, A_1, 3, "../wzorce_4_4x4/A_1.png")
process_wzorce(wzorce, A_2, 3, "../wzorce_4_4x4/A_2.png")
process_wzorce(wzorce, A_4, 3, "../wzorce_4_4x4/A_4.png")
process_wzorce(wzorce, A_7, 3, "../wzorce_4_4x4/A_7.png")

mkdir("../wzorce_6_4x4/")
wzorce = {A_0, A_1, A_2, A_4, A_5, A_7}
process_wzorce(wzorce, A_0, 3, "../wzorce_6_4x4/A_0.png")
process_wzorce(wzorce, A_1, 3, "../wzorce_6_4x4/A_1.png")
process_wzorce(wzorce, A_2, 3, "../wzorce_6_4x4/A_2.png")
process_wzorce(wzorce, A_4, 3, "../wzorce_6_4x4/A_4.png")
process_wzorce(wzorce, A_5, 3, "../wzorce_6_4x4/A_5.png")
process_wzorce(wzorce, A_7, 3, "../wzorce_6_4x4/A_7.png")


%%
% wzorce 6x6

wzorce6x6

mkdir("../wzorce_4_6x6/")
wzorce = {wz1,wz2,wz3,wz4}
process_wzorce(wzorce, wz1, 3, "../wzorce_4_6x6/A_1.png")
process_wzorce(wzorce, wz2, 3, "../wzorce_4_6x6/A_2.png")
process_wzorce(wzorce, wz3, 3, "../wzorce_4_6x6/A_3.png")
process_wzorce(wzorce, wz4, 3, "../wzorce_4_6x6/A_4.png")

mkdir("../wzorce_6_6x6/")
wzorce = {wz1,wz2,wz3,wz4,wz5,wz6}
process_wzorce(wzorce, wz1, 3, "../wzorce_6_6x6/A_1.png")
process_wzorce(wzorce, wz2, 3, "../wzorce_6_6x6/A_2.png")
process_wzorce(wzorce, wz3, 3, "../wzorce_6_6x6/A_3.png")
process_wzorce(wzorce, wz4, 3, "../wzorce_6_6x6/A_4.png")
process_wzorce(wzorce, wz5, 3, "../wzorce_6_6x6/A_5.png")
process_wzorce(wzorce, wz6, 3, "../wzorce_6_6x6/A_6.png")

%%



function  process_wzorce(wzorce, wybrany_element , zaklocenie, plik_docelowy)

    D = wzorce2mat(wzorce)
    D = char2mat(D) %macierz wzorcow

    % macierz Hebba
    W_hebba = D*D' / length(wzorce);
    
    % macierz pseudoinversii
    W_inv = D * (D' * D)^-1 * D';


    
    X = char2mat(wzorce2mat({wybrany_element})) %macierz wzorcow

    X_test = generate_noise(X, zaklocenie);



    % sieć hopfielda 
    % uruchomiona
    Y = X_test;
    for i = 1:200
        Y =  W_inv * Y + X_test;
    end

    Y = sign(Y);
    % end sieć hopfielda



    % wyświetlenie
    tiledlayout(1, 3, "TileSpacing", "tight");

    obraz_convert = @(X_) reshape(X_, size(wybrany_element,1), [])*-1 - .1;

    nexttile
    imshow(obraz_convert(X))
    xlabel("Wzorce "+sqrt(length(D))+"x"+sqrt(length(D)));

    nexttile
    imshow(obraz_convert(X_test))
    xlabel("Zakłócony wzorzec");

    nexttile
    imshow(obraz_convert(Y))
    xlabel("Odtworzony wzorzec");
    
    saveas(gcf,plik_docelowy)


end


function [vector_noised] = generate_noise(wzorzec, zaklocenie)

vector_noised = wzorzec;
n = length(wzorzec);
    for i = 1:zaklocenie
        index = randi(n);
        vector_noised(index) = vector_noised(index) * -1;
    end
end

















