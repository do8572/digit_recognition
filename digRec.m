%function dig=digRec(b, n)
%%%
%%function description
%%%
%Input:
%   b ... 256x1 vector representing gray picture
%   n ... number of most significant singular values used
%Output:
%   dig ... digit that most resembles digit represented by vector b
function dig=digRec(b)
  %shrink or expand matrix to be of dim 16x16
  b = imresize(b, [16 16]);
  %imshow(b);
  
  %change formated image to vector   
  v = [];
         
  for k=1:16
    v = [v; b(:, k)];
  endfor
  
  b = double(v);
  
  %learnset path
  path = "learnset";
  
  %assume the digit is 1
  dig = 0;
  
  %import lernset
  load("learnset/U0");
  load("learnset/S0");  
  
  %solve for y1, U1*S1*y1 = b
  y = (U * S)\b;
  
  %get ||U1'*b - S1*y1|| and set as minimum value
  min = norm(U' * b - S * y); 
  
  for i=1:9
    %set lernset paths
    upath = [path "/" "U" num2str(i) ".mat"];
    spath = [path "/" "S" num2str(i) ".mat"];
    
    %import lernset
    load(upath);
    load(spath);
    
    %solve for yi, Ui*Si*yi = b
    y = (U * S)\b;
    
    %get ||U1'*b - S1*y1|| and set as compare value
    tmp = norm(U' * b - S * y);
    
    %if distance between b and Ai*xi smaller than min
    if tmp < min
      %set as min
      min = tmp;
      
      %set closest digit to digit represented by b
      dig = i;
    endif
  endfor
endfunction
