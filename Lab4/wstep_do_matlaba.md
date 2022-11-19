
# Tutorial

1) wczytać dane do matlaba
``` 
load('Data_PTC_vs_FTC.mat')
```

2) do pierwszego wolnego wiersza macierzy `X` dodać wektor `D`
    - `X` - geny pacjentów
        - 1000 genów, 86 pacjentów
    - `D` - czy pacjent ma raka
        - 1, nowotwór
        - -1, brak nowotworu


``` 
X = Data.X;
D = Data.D;
DX = [D;X]; 
```


3) uruchomić narzędzie:
```
classificationLearner
```

4) wybrać opcję **New Session**, następnie **From Workspace**

5) Step 1 -wybrać zbiór `X` i wybrać opcję:
 - [ ] Column as variables
 - [x] Rows as variables


6) wybrać predictor i response.
zaznaczyć wiersze `2:end` 
    - predictor - dane do zbudowania klasyfikatora
    - response - dane z wiedzy eksperckiej

7) walidacja klasyfikatora - `Cross-Validation`,
Cross-validation folds = 10


8) wybrać geny do analizy (**X-axis** i **Y-axis**)


9) wybrać klasyfikator `Simple Tree` albo `Coarse Tree` (to chyba inna nazwa tego samego)

10) kliknąć Train



# Zad1

- [ ] podać nazwy genów i określić ich funkcje

- [ ] Zamieścić wykres ScatterPlot dla wbranych genów i określić czy dane są separowalne liniowo

- [ ] Zamieścić tablicę pomyłek (confusion matrix). Napisać gdzie znajduje się TP, TN,
FP, FN. Podać wartości czułości, specyficzności i skuteczności. Dodatkowo
obliczyć błąd i dokładność, wyniki dla błędu i dokładności porównać z wynikami
z aplikacji Classification Learner. 

- [ ] Napisać co określają TPR, FNR, PPV oraz FDR

- [ ] Czym charakteryzują się błędy pierwszego i drugiego rodzaju. Kiedy ważniejsza
jest czułość, a kiedy specyficzność w kontekście zdrowych i chorych pacjentów. 
 

- [ ] Podać wartości AUC. Napisać co ilustruje krzywa ROC, jakie informacje można
z niej odczytać. Czy AUC jest dobrym wyznacznikiem. Jaka wartość AUC jest
wystarczająco dobra dla klasyfikatora. Czy porównywanie samych wartości AUC
jest dobrym podejściem. 


- [ ] W wykresie ROC zmienić klasę pozytywną na przeciwną, dlaczego wyniki AUC
są inne? Dlaczego krzywa ROC się zmienia? 

- [ ] Wygenerować kod Matlaba















