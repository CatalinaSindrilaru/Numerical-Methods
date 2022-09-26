function out = proximal_2x2_RGB(img, STEP = 0.1)
    % ==============================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 definita img cu puncte intermediare echidistante.
    % img este o imagine colorata RGB -Red, Green, Blue.
    % =============================================================================================

    % TODO: Extrage canalul rosu al imaginii.
    Red_initial = img(:,:,1);
   
    % TODO: Extrage canalul verde al imaginii.
    Green_initial = img(:,:,2);
   
    % TODO: Extrage canalul albastru al imaginii.
    Blue_initial = img(:,:,3);
   
    % TODO: Aplica functia proximal pe cele 3 canale ale imaginii.
    Red = proximal_2x2(Red_initial, STEP);
    Green = proximal_2x2(Green_initial, STEP);
    Blue = proximal_2x2(Blue_initial, STEP);
    
    % TODO: Formeaza imaginea finala concatenând cele 3 canale de culori.
    out = cat(3, Red, Green, Blue);
    
endfunction
