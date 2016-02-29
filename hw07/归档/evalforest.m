function preds=evalforest(F,xTe)
% function preds=evalforest(F,xTe);
%
% Evaluates a random forest on a test set xTe.
%
% input:
% F   | Forest of decision trees
% xTe | matrix of m input vectors (matrix size dxm)
%
% output:
%
% preds | predictions of labels for xTe
%

[d,n] = size(F);
pred = [];
for i = 1:n
  T = F{1,i};
  [predict]=evaltree(T,xTe);
  pred = [pred;predict];
endfor
preds = mode(pred,1);



%% fill in code here

