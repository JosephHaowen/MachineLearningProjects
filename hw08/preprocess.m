function [xTr,xTe,u,m]=preprocess(xTr,xTe);
% function [xTr,xTe,u,m]=preprocess(xTr,xTe);
%
% Preproces the data to make the training features have zero-mean and
% standard-deviation 1
%
% output:
% xTr - pre-processed training data 
% xTe - pre-processed testing data
% 
% u,m - any other data should be pre-processed by x-> u*(x-m)
%

[dr,nr] = size(xTr);
[de,ne] = size(xTe);

m = mean(xTr,2);
xtemp = xTr;
x = xTr - repmat(m,1,nr);
st = std(xTr,1,2);

xTr = x./repmat(st,1,nr);

u = xtemp*pinv(x);
xTe = u * (xTe - repmat(m,1,ne));







