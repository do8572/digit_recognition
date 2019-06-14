%function dig_process(src, dest, alfa)
%processes images in src folder and 
%saves them to dest folder in the
%form of Ui and Si, where i is the
%represented digit
%
%input:
%   src ... path to folder containing images
%   dest ... path to folder containing matrices U and S
%   alfa ... compresion factor
function dig_process(src, dest, alfa)
    %if alfa incorrect
    if alfa > 1 || alfa < 0
      printf("Setting alfa to 1.\n");
    endif
  
    %check if both src and dest strings
    if !ischar(src) || !ischar(dest)
      printf("Both inputs have to be strings!\n");
      return;
    endif
    
    for i=0:9
    %set path to find all pictures of digit
    path = [src "/" num2str(i)];
    
    %get digit matrix
    A = digmat(path);
      
    %SVD on matrix Ai
    [U, S, V] = svd(A);
    
    %use only n largest eingenvectors
    d = diag(S);
    n = round(alfa * length(d));
    if n > length(d) || n < 0
      n = length(d);
    endif
    
    for j=n+1:length(d)
      S(j, j) = 0;
    endfor
    
    %set lernset paths
    upath = [dest "/" "U" num2str(i) ".mat"];
    spath = [dest "/" "S" num2str(i) ".mat"];
      
    %save matrix Ui
    save(upath, "U");
      
    %save matrix Si
    save(spath, "S");        
  endfor
endfunction
