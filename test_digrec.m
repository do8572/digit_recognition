%function T = test_digrec(testset, recdata)
%creates matrix A whoose column vectors represent
%images in the folder given by path 
%
%input:
%   testset ... path to folder containing test images
%   recdata ... path to folder containing matrices U and S
%
%output:
%   T ... 10x10 matrix that represent sum of the mappings
%         rows:actual image to cols:recognized image
function T = test_digrec(testset, recdata)
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
      dig = digRec(IMG, recdata);
      
      %increment matrix at (representedImg, recognisedImg)
      T(i+1, dig+1) = T(i+1, dig+1) + 1;
      
      %print result of test
      printf("%d %d: %d\n", i, j, dig);      
    endfor
  endfor  
endfunction
