function r = fxy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x si y a lui f in punctul (x, y).
    % =========================================================================
    
    [m n] = size(f);
    
    % La marginile imaginii se considera derivata 0
    
    if x + 1 > m
      r = 0;
      return;
    endif
    
    if x - 1 < 1
      r = 0;
      return;
    endif
    
    if y + 1 > n
      r = 0;
      return;
    endif
    
    if y - 1 < 1
      r = 0;
      return;
    endif
    
    % TODO: calculeaza derivata
    r = (f(x - 1, y - 1) + f(x + 1, y + 1) - f(x + 1, y - 1) - f(x - 1, y + 1)) / 4;
    
endfunction