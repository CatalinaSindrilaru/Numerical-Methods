function [x] = SST(A, b)
  % Verific daca A este superior triunghiulara
  if istriu(A) == 0
     x = NaN;
     return;
  endif
  
  % Calculez dimensiunea matricii patratice A
  N = size(A, 1);
  % Initializez vectorul x
  x = zeros(N, 1);
  
  % Calculez ultimul element
  x(N) = b(N) / A(N,N);
  
  % Calculez urmatoarele elemente in functie de cele calculate anterior
  for i = (N - 1):-1:1
    sum = A(i, (i+1) : N) * x((i + 1) : N, 1);
    x(i) = (b(i) - sum) / A(i,i);
  endfor
endfunction
