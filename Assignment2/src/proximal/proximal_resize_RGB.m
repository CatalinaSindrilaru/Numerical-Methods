function out = proximal_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img astfel încât aceasta save fie de dimensiune p x q.
    % Imaginea img este colorata.
    % =========================================================================

    % TODO: Extrage canalul rosu al imaginii.
    Red_initial = img(:,:,1);
    
    % TODO: Extrage canalul verde al imaginii.
    Green_initial = img(:,:,2);
    
    % TODO: Extrage canalul albastru al imaginii.
    Blue_initial = img(:,:,3);
    
    % TODO: Aplica functia proximal pe cele 3 canale ale imaginii.
    Red = proximal_resize(Red_initial, p, q);
    Green = proximal_resize(Green_initial, p, q);
    Blue = proximal_resize(Blue_initial, p, q);
    
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out = cat(3, Red, Green, Blue);
    
endfunction
