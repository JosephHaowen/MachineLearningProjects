function T=prunetree(T,xTe,y)
% function T=prunetree(T,xTe,y)
%
% Prunes a tree to minimal size such that performance on data xTe,y does not
% suffer.
%
% Input:
% T = tree
% xTe = validation data x (dxn matrix)
% y = labels (1xn matrix)
%
% Output:
% T = pruned tree
%

[dt,nt] = size(T);
[d,n] = size(xTe);

[ypredict] = evaltree(T,xTe);
error = sum(y~=ypredict)/n;
leaf = find(T(4,:)==0);

while sum(leaf ~= 0) >= 1
  [dl,nl] = size(leaf);
  newleaf = [];
  for i = 1:nl
    nindex = leaf(:,i);
    if nindex == 1
      continue
    endif
    node = T(:,nindex);
    newleaf = [newleaf node(6,1)];
    Temp = T;
    par = Temp(:,node(6,1));
    if par(4,1) == nindex
      Temp(4,node(6,1)) = 0;
    else
      Temp(5,node(6,1)) = 0;
    end
    [ypredict] = evaltree(Temp,xTe);
    error1 = sum(y~=ypredict)/n;
    if error1 < error
      T = Temp;
    endif
  endfor
  leaf = newleaf;
endwhile
  
    
    


  








%% fill in code here

