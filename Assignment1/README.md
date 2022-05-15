Nume: Sindrilaru Catalina-Maria

Grupa: 312CA


# TEMA 1 - Metode Numerice (In spatele unui motor de cautare)

## AdjacencyMatrix
Functia primeste numele fisierului din care citeste si returneaza o 
matrice si doua valori val1 si val2. Functia parcurge fisierul, citeste
numarul de noduri, iar apoi numarul de vecini ai fiecaruia, respectiv
lista de adiacente a nodului respectiv. Se completeaza matricea de a
diacenta. In continuare se citesc valorile val1 si val2 aflate pe ultimele
doua randuri si se inchide fisierul.


## Iterative
Se apeleaza functia AdjacencyMatrix pentru a creea matricea de adiacenta
aferenta grafului din fisierul dat. Calculez matricea diagonala K.
Elementului de pe linia i din matricea diagonala K ii corespunde 
valoarea 1 impartit la suma elementelor de pe linia i din matricea A.
Calculez matricea M ca fiind inversa produsului dintre matricea K si A,
aceasta fiind folosita in calculul iterativ al vectorului PageRank R.
Vectorul R se initializeaza cu 1 / N, unde N este numarul de pagini web
si se calculeaza iterativ pana cand eroarea devine mai mica decat eps-ul dat.

## Algebraic
Se creeaza matricea M urmand pasii ca la algoritmul Iterative. Apoi,
folosindu-se functia PR_Inv se calculeaza inversa matricei I - d * M,
necesara in calcularea vectorului R PageRank cu formula algebrica.

## SST
Functia implementeaza rezolvarea unui sistem de tip Ax=b unde A este o
matrice superior triunghiulara iar x si b sunt vectori coloana.

## PR_Inv
Functia implementeaza varianta modificata a algoritmului Gram-Schmidt 
pentru o mai buna stabilitate numerica si factorizeaza matricea primita 
in doua matrici Q si R apoi aplica metoda SST folosind matricea identitate
pentru a determina inversa matricei date.

## Apartenenta
Se implementeaza functia membru utilizata in determinarea valorilor 
de importanta si clasificarea paginilor web. Se afla valorile a si b 
in functie de val1 si val2 astfel incat functia sa fie continua.

## PageRank
Se creeaza noul fisier in care urmeaza sa fie scrise datele cerute.
Se scrie in fisierul de output numarul de pagini web, iar apoi se calculeaza
vectorul PageRank mai intai folosind algoritmul iterativ, iar apoi folosindu-l
pe cel algebric. Ambii vectori PageRank sunt scrisi in fisierul de output.
Se sorteaza descrescator vectorul calculat prin metoda algebrica in functie
de importanta si valoarea determinata folosind functia Apartenenta. Apoi se 
afiseaza clasamentul obtinut.