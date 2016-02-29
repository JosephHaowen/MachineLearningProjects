function F=forest(x,y,nt)
% function F=forest(x,y,nt)
%
% INPUT:
% x | input vectors dxn
% y | input labels 1xn
%
% OUTPUT:
% F | Forest
%

[d,n] = size(x);
F = cell(1,nt);
sam = 1:n;
for i = 1:nt
  index = randsample(sam,n,replacement = true);
  xTe = x(:,index);
  yTe = y(:,index);
  T=id3tree(xTe,yTe);
  F{i} = T;
endfor
  






%% fill in code here

