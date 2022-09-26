function out = proximal_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica Interpolarea Proximala pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % TODO: Extrage canalul rosu al imaginii.
    Red_initial = img(:, :, 1);
    
    % TODO: Extrage canalul verde al imaginii.
    Green_initial = img(:, :, 2); 
    
    % TODO: Extrage canalul albastru al imaginii.
    Blue_initial = img(:, :, 3); 
    
    % TODO: Aplica rotatia pe fiecare canal al imaginii.
    Red = proximal_rotate(Red_initial, rotation_angle);    
    Green = proximal_rotate(Green_initial, rotation_angle);  
    Blue = proximal_rotate(Blue_initial, rotation_angle);  
    
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
     out = cat(3, Red, Green, Blue);
   
endfunction