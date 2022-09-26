function R = proximal_rotate(I, rotation_angle)
    % =========================================================================
    % Roteste imaginea alb-negru I de dimensiune m x n cu unghiul rotation_angle,
    % aplicând Interpolare Proximala.
    % rotation_angle este exprimat în radiani.
    % =========================================================================
    [m n nr_colors] = size(I);
    
    % Se converteste imaginea de intrare la alb-negru, daca este cazul.
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci când se aplica o scalare, punctul (0, 0) al imaginii nu se va deplasa.
    % În Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza în indici de la 1 la n si se inmultesc x si y cu s_x respectiv s_y,
    % atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici în intervalul [0, n - 1].

    % TODO: Calculeaza cosinus si sinus de rotation_angle.
    c = cos(rotation_angle);
    s = sin(rotation_angle);
    
    % TODO: Initializeaza matricea finala.
    R = zeros(m, n);
    
    % TODO: Calculeaza matricea de transformare.
    T_rot = [c, -s; s c];
    
    % TODO: Inverseaza matricea de transformare, FOLOSIND doar functii predefinite!
    T_rot = inv(T_rot);
    
    % Se parcurge fiecare pixel din imagine.
    for y = 0 : m - 1
        for x = 0 : n - 1
            % TODO: Aplica transformarea inversa asupra (x, y) si calculeaza x_p si y_p
            % din spatiul imaginii initiale.
            vect = T_rot * [x y]';
            vect = vect';

            x_p = vect(1);
            y_p = vect(2);
            
            % TODO: Trece (xp, yp) din sistemul de coordonate [0, n - 1] în
            % sistemul de coordonate [1, n] pentru a aplica interpolarea.
            x_p += 1;
            y_p += 1;
            
            % TODO: Daca xp sau yp se afla în exteriorul imaginii,
            % se pune un pixel negru si se trece mai departe.
            if (x_p > n || y_p > m || x_p < 1 || y_p < 1)
              R(y + 1, x + 1) = 0;
              continue;
            endif
            
            % TODO: Afla punctele ce înconjoara(xp, yp).
            x1 = floor(x_p);
            y1 = floor(y_p);
            x2 = floor(x_p) + 1;
            y2 = floor(y_p) + 1;
            
            if (y1 == m)
              y2 = m;
              y1 = m - 1;
            endif
            
            if (x1 == n)
              x2 = n;
              x1 = n - 1;
             endif
            % TODO: Calculeaza coeficientii de interpolare notati cu a
            % Obs: Se poate folosi o functie auxiliara în care sau se calculeze coeficientii,
            % conform formulei.
            a = proximal_coef(I, x1, y1, x2, y2);
            % TODO: Calculeaza valoarea interpolata a pixelului (x, y).
            R(y + 1, x + 1) = a(1, 1) + a(2, 1) * x_p + a(3, 1) * y_p + a(4, 1) * x_p * y_p;
            
        endfor
    endfor

    % TODO: Transforma matricea rezultata în uint8 pentru a fi o imagine valida.
    R = cast(R, "uint8");
endfunction
