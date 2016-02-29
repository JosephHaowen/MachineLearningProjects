function preds=competition(xTr,yTr,xTe);
% function preds=competition(xTr,yTr,xTe);
%
% A classifier that outputs predictions for the data set xTe based on 
% what it has learned from xTr,yTr
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%

% The random classifier is awesome!!! Could you possibly do better?
[d,n]=size(xTe);
[d,ntr]=size(xTr);
k=3;
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