%function q = test_digrec(test)
%
%uporabi digrec(), da dobi najblizjo stevko
%in jo primerja z dejansko vrednostjo te stevke
%in izpise stevilo pravilno prepoznanih stevk
function T = test_digrec(test)
  T = zeros(10, 10);
  
  for i=0:9
    %set path to find all pictures of digit
    path = [test "/" num2str(i) "/*"];
    
    %get all fiepaths to digit
    files = glob(path);
    
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
      
      %test
      dig = digRec(IMG);
      
      T(i+1, dig+1) = T(i+1, dig+1) + 1;

      printf("%d %d: %d\n", i, j, dig);      
    endfor
  endfor  
endfunction
