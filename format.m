%function Format()
%converts pictures of digits in the raw folder to the matrix Ai
%wehere i represents the digit.
%Then it splits Ai=Ui * Si * Vi' and saves Ui and Si into the lernset.
%
%raw contents:
%   i/* ... image directory of digit i
%
%learnset contents:
%   Ui.mat ...  Ui matrix where i represents the digit
%   Si.mat ...  Si matrix where i represents the digit
function s = format(IMG)           
      %crop image matrix to square matrix
      img_min = min(size(IMG));
      m = size(IMG)(1);
      n = size(IMG)(2);
      IMG = imcrop(IMG, [(m - img_min)/2 (n - img_min)/2 img_min img_min]);      
      
      %shrink or expand matrix to be of dim 16x16
      IMG = imresize(IMG, [16 16]);
      
      %change formated image to vector   
      s = [];
         
      for k=1:16
       s = [s; IMG(:, k)];
      endfor
      
      s = double(s);
endfunction
