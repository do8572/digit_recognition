%function s = Format(IMG)
%converts picture IMG of digit to image vector s
%
%input:
%   IMG ... grayscale image matrix
%
%output:
%   s ... 256x1 image vector
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
