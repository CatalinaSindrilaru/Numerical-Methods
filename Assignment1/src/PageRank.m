function [R1 R2] = PageRank(nume, d, eps)
	  % Calculeaza indicii PageRank pentru cele 3 cerinte
	  % Scrie fisierul de iesire nume.out
    
  % Construiesc numele fisierului in care se va face scrierea
  file = strcat(nume, ".out");
  % Deschid fisierul pentru scriere
  file_out = fopen(file, 'w');
   
  % Retin matricea de adiacenta pentru graful din fisier si salvez val1 si val2
  [A, val1, val2] = AdjacencyMatrix(nume);
   
  % Obtin numarul de pagini web folosind dimensiunea matricii de adiacenta
  N = size(A, 1);
   
  % Scriu numarul de pagini web in fisier
  fprintf(file_out, '%d\n\n', N);
   
  % Construiesc vectorul PageRank folosind algortimul iterativ
  R1 = Iterative(nume, d, eps);
   
  % Scriu vectorul R1 in fisier
  fprintf(file_out, '%f\n', R1);
  fprintf(file_out, '\n');
  
  % Construiesc vectorul PageRank folosind algortimul algebraic
  R2 = Algebraic(nume, d);
   
  % Scriu vectorul R1 in fisier
  fprintf(file_out, '%f\n', R2);
  fprintf(file_out, '\n');

  % Construieste ordinea celor mai importante pagini si o scrie in fisier
  [PR1, J] = sort(R2, 'descend');
  for i = 1:N
    fprintf(file_out, '%d %d %f\n', i, J(i), Apartenenta(PR1(i), val1, val2));
  endfor
  fclose(file_out)
endfunction
  