%function A = digmat(path)
%creates matrix A whoose column vectors represent
%images in the folder given by path 
%
%input:
%   path ... path to folder containing images
%
%output:
%   A ... 256xn image matrix
function A = digmat(path)  
  %get all fiepaths to digit
  path = [path "/*"];  
  files = glob(path);
  
  %create matrix A
  A = [];
    
  for j=1:numel(files)
    %get image matrix
    IMG = imread(files{j});
           
    %format IMG
    s = format(IMG);
      
    %add vector to matrix Ai
    A = [A s];
  endfor
endfunction
