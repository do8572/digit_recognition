function dig=digrec(test, data)  
  %format test image
  b = format(test);
  
  %assume the digit is 0
  dig = 0;
  
  %set U and S path
  upath = [data "/U0.mat"];
  spath = [data "/S0.mat"];
  
  %import lernset
  load(upath);
  load(spath);  
  
  %solve for y1, U1*S1*y1 = b
  y = (U * S)\b;
  
  %get ||U1'*b - S1*y1|| and set as minimum value
  min = norm(U' * b - S * y); 
  
  for i=1:9
    %set U and S path
    upath = [data "/U" num2str(i) ".mat"];
    spath = [data "/S" num2str(i) ".mat"];
    
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
