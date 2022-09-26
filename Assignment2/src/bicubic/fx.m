function r = fx(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de x a lui f in punctul (x, y).
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
    
    % TODO: calculeaza derivata
    r = (f(x + 1, y) - f(x - 1, y)) / 2;

endfunction