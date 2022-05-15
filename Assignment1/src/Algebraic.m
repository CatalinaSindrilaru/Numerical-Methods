function R = Algebraic(nume, d)
	  % Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	  % Intrari: 
	  %	-> nume: numele fisierului in care se scrie;
	  %	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	  % Iesiri:
	  %	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
    
  % Construiesc matricea de adiacenta a grafului din fisierul dat
  A = AdjacencyMatrix(nume);
  % Obtin numarul de pagini web folosind dimensiunea matricii de adiacenta
  N = size(A, 1);
  % Calculez matricea K, matrice diagonala cu numarul conexiunilor fiecarui nod
  K = zeros(N,N);
  for i = 1 : N
    sum = 0;
    for j = 1 : N
      sum += A(i,j);
    endfor
    K(i,i) = 1 / sum;
  endfor
  % Calculez M
  M = (K * A)';
  
  % Constuiesc un vector de dimensiune N avand 1 pe toate pozitiile
  v_one = zeros(N, 1);
  v_one(1:N) = 1;
  
  % Initializez matricea identitate
  I = eye(N);
  
  % Calculez R in mod algebric
  R = PR_Inv(I - d * M) * ((1 - d) / N) * v_one;
 endfunction