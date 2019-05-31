function A = digmat(path)
  %check all files in path
  path = [path "/*"];
  
  %get all fiepaths to digit
  files = glob(path);
  
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
