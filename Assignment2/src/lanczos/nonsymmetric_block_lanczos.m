function [Vi, Wi] = nonsymmetric_block_lanczos(A, V, W, m)
  
  % Compute the QR decomposition of W' * V
  M = W' * V;
  [sigma, beta] = qr(M);
  
  V(1) = V * inv(beta);
  W(1) = W * sigma;
  V_mod(2) = A * v(1);
  W_mod(2) = A' * W(1);
  
  for j = 1 : m
    alfa(j) = W(j)' * V_mod(j+1);
    V_mod(j+1) = V_mod(j+1) - V(j) * alfa(j);
    W_mod(j+1) = W_mod(j+1) - W(j) * alfa(j)';
    
    % Compute the QR decomposition of V_mod(j+1) and W_mod(j+1)
    [V(j+1), beta(j+1)] = qr(V_mod(j+1));
    [W(j+1), aux] = qr(W_mod(j+1));
    sigma(j+1) = aux';
    
    % Compute the singular value decomposition of W(j+1)' * V(j+1)
    % [U(j),S(j),Z(j)] = svd(A) performs a singular value decomposition
    % of matrix A, such that A = U(j)*S(j)*Z(j)' where A = W(j+1)' * v(j+1)
    
    Aux = W(j+1)' * V(j+1);
    [U(j),S(j),Z(j)] = svd(Aux);
    
    sigma(j+1) = sigma(j+1) * U(j) * S(j) ^ 0.5;
    beta(j+1) = S(j) ^ 0.5 * Z(j)' * B(j+1);
    V(j+1) = V(j+1) * Z(j) * S(j) ^ (-0.5);
    W(j+1) = W(j+1) * U(j) * S(j) ^ (-0.5);
    V_mod(j+2) = A * V(j+1) - V(j) * sigma(j+1);
    W_mod(j+2) = A' * W(j+1) - W(j) * beta(j+1)';
  endfor
endfunction