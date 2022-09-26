function [V_space(m), W_space(m)] = rational_block_lanczos(A, B, C, sigma)
  I = eye(n);
  
  % Set S(0) and R(0)
  S(0) = inv(A - sigma(1) * I) * B;
  R(0) = inv(A - sigma(1) * I)' * C';
  
  % Set S(0) and R(0)
  
  I = eye(p);
  W(1)' * V(1) = I;
  S(0) = V(1) * H(1,0);
  R(0) = W(1) * G(1,0);
  
  % Initialize V and W spaces
  V_space = [V(1)];
  W_space = [W(1)];
  
  for k = 1 : m
    if k < m
      if sigma(k+1) == inf
        S(k) = A * V(k);
        R(k) = A' * W(k);
      else
        I = eye(n);
        S(k) = inv(A - sigma(k+1) * I) * V(k);
        R(k) = inv(A - sigma(k+1) * I)' * W(k);
      endif
      H(k) = W_space(k)' * S(k);
      G(k) = V_space(k)' * R(k);
      S(k) = S(k) - V_space(k) * H(k);
      R(k) = R(k) - W_space(k) * G(k);
      
      % QR factorization
      [V(k+1), H(k+1, k) = qr(S(k));
      
      % Singular Value Decomposition
      M = W(k+1)' * V(k+1);
      [P(k), D(k), Aux] = svd(M);
      Q(k) = Aux';
      
      V(k+1) = V(K+1) * Q(k) * D(K) ^ (-0.5);
      W(K+1) = W(k+1) * P(k) * D(k) ^ (-0.5);
      
      H(k+1, k) = D(k) ^ 0.5 *Q(k)' * H(k+1, k);
      G(K+1, k) = D(k) ^ 0.5 * P(k)' * G(k+1,k);
      
      V_space(k+1) = [V_space(k), V(k+1)];
      W_space(k+1) = [W_space, W(k+1)];
    else
      if sigma(m+1) == inf
        S(m) = A * B;
        R(m) = A' * C;
      else
        S(m) = inv(A) * B;
        R(m) = inv(A)' * C';
      endif
      
      H(m) = W_space(m)' * S(m);
      G(m) = V_space(m)' * R(m);
      
      S(m) = S(m) - V_space(m) * H(m);
      R(m) = R(m) - W_space(m) * G(m);
      
      % QR factorization
      [V(m+1), H(m+1,m)] = qr(S(m));
      [W(m+1),G(m+1,m)] = qr(R(m));
      
      % Singular Value Decomposition
      M = W(m+1)' * V(m+1);
      [P(m), D(m), Aux] = svd(M);
      Q(m) = Aux';
      
      V(m+1) = V(m+1) * Q(m) * D(m) ^ (-0.5);
      W(m+1) = W(m+1) * P(m) * D(m) ^ (-0.5);
      
      H(m+1,m) = D(m) ^ 0.5 * Q(m)' * H(m+1,m);
      G(m+1,m) = D(m) ^ 0.5 * P(m)' * G(m+1,m);
      
      V_space(m+1) = [V_space, V(m+1)];
      W_space(m+1) = [W_space, W(m+1)];
    endif
  endfor
endfunction