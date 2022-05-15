function R = Iterative(nume, d, eps)
	    % Functia care calculeaza matricea R folosind algoritmul iterativ.
	    % Intrari:
	    %	-> nume: numele fisierului din care se citeste;
	    %	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	    %	-> eps: eruarea care apare in algoritm.
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
  
  % Construiesc vectorul initial R pe care il initializez cu valoarea 1/N
  R_prev = zeros(N, 1);
  R_prev(1:N) = 1 / N;
  
  % Calculez noul R pana cand eroarea devine mai mica decat eps dat
  R = (d .* M * R_prev) + ((1 - d) / N) * v_one;

  while (norm(R - R_prev) > eps)
    R_prev = R;
    R = (d * M * R_prev) + ((1 - d) / N) * v_one;
  endwhile
  R = R_prev;

endfunction
  
