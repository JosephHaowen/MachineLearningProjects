function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
% function [bestC,bestP,bestval,allvalerrs]=crossvalidate(xTr,yTr,ktype,Cs,paras)
%
% INPUT:	
% xTr : dxn input vectors
% yTr : 1xn input labels
% ktype : (linear, rbf, polynomial)
% Cs   : interval of regularization constant that should be tried out
% paras: interval of kernel parameters that should be tried out
% 
% Output:
% bestC: best performing constant C
% bestP: best performing kernel parameter
% bestval: best performing validation error
% allvalerrs: a matrix where allvalerrs(i,j) is the validation error with parameters Cs(i) and paras(j)
%
% Trains an SVM classifier for all possible parameter settings in Cs and paras and identifies the best setting on a
% validation split. 
%
[d,n] = size(yTr);
cut = floor(n/5);
yTv = yTr(:,1:cut);
nyTr = yTr(:,cut+1:n);
xTv = xTr(:,1:cut);
nxTr = xTr(:,cut+1:n);

%% Split off validation data set
% YOUR CODE


%% Evaluate all parameter settings
% YOUR CODE
[dc,nc] = size(Cs);
[dp,np] = size(paras);
allerrs = zeros(nc,np);
for i = 1:nc
  for j = 1:np
    C = Cs(i);
    kpar = paras(j);
    svmclassify=trainsvm(nxTr,nyTr,C,ktype,kpar);
    verr=sum(sign(svmclassify(xTv))~=yTv(:))/length(yTv);
    allerrs(i,j) = verr;
  endfor
endfor

allvalerrs = allerrs;
bestval = min(min(allvalerrs));
[dv,nv] = find(allvalerrs==bestval);
bestC = Cs(dv(1));
bestP = paras(nv(1));


 


%% Identify best setting
% YOUR CODE


