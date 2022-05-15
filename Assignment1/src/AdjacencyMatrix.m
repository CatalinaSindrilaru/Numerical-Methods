function [A, val1, val2] = AdjacencyMatrix(nume)
  % Functia construieste si returneaza matricea de adiacenta a grafului
  % din fisierul cu numele dat, precum si valorile val1 si val2
  
  % Deschid fisierul din care voi citi
  file = fopen(nume, 'r');
  
  % Citesc numarul de noduri ale grafului
  N = fscanf(file, '%d', [1, 1]);
  
  % Creez matricea de adiacenta A plina cu 0-uri
  A = zeros(N, N);
  
  % Formez matricea de adicenta
  for i = 1 : N
    % Citesc indexul nodului caruia vreau sa ii creez vecini
    node = fscanf(file, '%d', [1, 1]);
    % Citesc numarul de vecini pe care ii are nodul curent (citit anterior)
    nr_neigh = fscanf(file, '%d', [1, 1]);
    % Citesc lista de vecini ai nodului
    neighbors = fscanf(file, '%d', [1, nr_neigh]);
    
    % Populez matricea cu 1 unde exista vecini
    A(node, neighbors) = 1;
    A(node, node) = 0;
  endfor

   % Citesc valorile ramase si inchid fisierul
  val1 = fscanf(file, '%f', [1, 1]);
  val2 = fscanf(file, '%f', [1, 1]);
  fclose(file);
  
endfunction
