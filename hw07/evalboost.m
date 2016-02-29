function preds=evalboost(BDT,xTe)
% function preds=evalboost(BDT,xTe);
%
% Evaluates a boosted decision tree on a test set xTe.
%
% input:
% BDT | Boosted Decision Trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%
[dt,nt] = size(BDT);
[d,n] = size(xTe);
alla = 0;

preds = 0;

T = BDT{1,1};
[ypredict]=evaltree(T,xTe);
max = max(ypredict);
min = min(ypredict);

tempx=0;
tempn=0;

for j = 1:nt
  T = BDT{1,j};
  a = BDT{2,j};
  alla = alla + a;
  [ypredict]=evaltree(T,xTe);
   tempx=tempx+(ypredict==min)*a;
   tempn=tempn +(ypredict==max)*a;
   
  %ypred = ypredict*a;
  %preds = preds + ypred;  
endfor

  temp = tempx>tempn;
  preds=min*(temp==1)+max*(temp==0);
