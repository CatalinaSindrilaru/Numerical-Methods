function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Folosesc factorizarea Gram-Schimdt pentru a obtine Q si R
  % Dupa calculare, acestea sunt folosite pentru a determina inversa matricii date
  
  % Calculez dimensiunea matricii patratice A
  N = size(A, 1);
  
  % Initializez cu 0 matricile R, Q si B
  R = zeros(N, N);
  Q = zeros(N, N);
  B = zeros(N, N);
  
  % Construiesc matricea indentitate I
  I = eye(N);
  
  % Aplic algoritmul Gram-Schimdt modificat (pentru o mai buna stabilitate numerica)
  
  for i = 1 : N
    R(i,i) = norm(A(:,i));
    Q(:,i) = A(:,i) / R(i,i);
    for j = (i+1) : N
      R(i,j) = Q(:,i)' * A(:,j);
      A(:,j) = A(:,j) - Q(:,i) * R(i,j);
    endfor
  endfor
  
  % Folosim algortimul de tip SST pentru a determina fiecare coloana din inversa
  for i = 1 : N
    B(:,i) = SST(R, Q' * I(:,i));
  endfor
 endfunction
