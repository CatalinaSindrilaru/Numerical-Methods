function r = fy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de y a lui f in punctul (x, y).
    % =========================================================================
    
    [m n] = size(f);
    
    % La marginile imaginii se considera derivata 0
    
    if y + 1 > n
      r = 0;
      return;
    endif
    
    if y - 1 < 1
      r = 0;
      return;
    endif
    
    % TODO: calculeaza derivata
    r = (f(x, y + 1) - f(x, y - 1)) / 2;
    
endfunction