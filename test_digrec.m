function T = test_digrec(testset, data)
  T = zeros(10, 10);
  
  for i=0:9
    %set path to find all pictures of digit
    path = [testset "/" num2str(i) "/*"];
    
    %get all fiepaths to digit
    files = glob(path);
    
    for j=1:numel(files)
      %get image matrix
      IMG = imread(files{j});
      
      %get represented digit
      dig = digrec(IMG, data);
      
      T(i+1, dig+1) = T(i+1, dig+1) + 1;

      printf("%d %d: %d\n", i, j, dig);      
    endfor
  endfor  
endfunction
