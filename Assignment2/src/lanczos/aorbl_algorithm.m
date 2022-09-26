function [A(m), B(m), C(m)] = aorbl_algorithm(A, B, C, sigma1, sigma2)
  tol = 0.001;
  H(0) = eye(p);
  
  e = 1;
  m = 1;
  
  while e > tol
    [V_space(m), W_space(m)] = rational_block_lanczos(A, B, C, sigma1, sigma2);
    
    A(m) = W_space(m)' * A * V_space(m);
    B(m) = W_space(m)' * B;
    C(m) = C * V_space(m);
    
    H(m) = C(m) * inv(m * eye(n) - A) * B;
    
    e = norm(H(m) - H(m-1);
    m++;
  endwhile
endfunction