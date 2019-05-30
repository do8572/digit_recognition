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
function format()
  fignum = 1;
  
  for i=0:9
    %set path to find all pictures of digit
    path = ["raw/" num2str(i) "/*"];
    
    %get all fiepaths to digit
    files = glob(path);
    
    A = [];
    
    for j=1:numel(files)
      %get image matrix
      IMG = imread(files{j});
           
      %crop image matrix to square matrix
      img_min = min(size(IMG));
      m = size(IMG)(1);
      n = size(IMG)(2);
      IMG = imcrop(IMG, [(m - img_min)/2 (n - img_min)/2 img_min img_min]);      
      
      %shrink or expand matrix to be of dim 16x16
      IMG = imresize(IMG, [16 16]);
      
      %change formated image to vector   
      v = [];
         
      for k=1:16
        v = [v; IMG(:, k)];
      endfor
      
      %add vector to matrix Ai
      A = [A v];
    endfor
      
    %SVD on matrix Ai
    [U, S, V] = svd(A);
    
    %set lernset paths
    upath = ["learnset/" "U" num2str(i) ".mat"];
    spath = ["learnset/" "S" num2str(i) ".mat"];
    
    %change from uint8 to double
    U = double(U);
    S = double(S);
      
    %save matrix Ui
    save(upath, "U");
      
    %save matrix Si
    save(spath, "S");        
  endfor
endfunction
