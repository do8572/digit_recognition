function dig_process(src, dest)
    %check if both src and dest strings
    if !isstring(src) || !isstring(dest)
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
    
    %set lernset paths
    upath = [dest "/" "U" num2str(i) ".mat"];
    spath = [dest "/" "S" num2str(i) ".mat"];
      
    %save matrix Ui
    save(upath, "U");
      
    %save matrix Si
    save(spath, "S");        
  endfor
endfunction
