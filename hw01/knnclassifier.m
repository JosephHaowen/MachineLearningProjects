function preds=knnclassifier(xTr,yTr,xTe,k);
% function preds=knnclassifier(xTr,yTr,xTe,k);
%
% k-nn classifier 
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%


% output random result as default (you can erase this code)
[d,n]=size(xTe);
[d,ntr]=size(xTr);
if k>ntr
  k=ntr;
end;

[I,D]=findknn(xTr,xTe,k);
 
yTr=yTr(I);
[m,f,c]=mode(yTr);

if k>2 && n>1
  while (cellfun('length',c)~=ones(1,size(c,2)) && k>2)
    k=k-1;
    [i,d]=findknn(xTr,xTe,k);
    [m,f,c]=mode(yTr(i));
  endwhile
  preds=m;
elseif k>2 && n==1
  [m,f,c]=mode(yTr);
  if(cellfun('length',c)>1)
    m=yTr(1,1);
  endif;
  preds=m;
else
  preds=yTr(1,:);
end;


