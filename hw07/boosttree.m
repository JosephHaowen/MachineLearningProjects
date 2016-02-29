function BDT=boosttree(x,y,nt,maxdepth)
% function BDT=boosttree(x,y,nt,maxdepth)
%

if nargin<4,
    maxdepth = 3;
end;

if nargin<3,
    nt = 100;
end;


[d,n] = size(x);
weights = 1/n*ones(1,n);
BDT = cell(2,nt);
for i = 1:nt
  T=id3tree(x,y,maxdepth,weights);
  [ypred]=evaltree(T,x);
  %err = sum(weights(find(ypred~=y)));
  err = sum(ypred~=y)/n;
  if err>0.5
    break
  endif
  alpha = 0.5*log((1-err)/err);
  BDT(1,i) = T;
  BDT(2,i) = alpha;
  
  weights = weights.*exp(alpha*(2*(ypred~=y)-1));
  %weights = weights/sum(weights);
endfor
  






%% fill in code here


