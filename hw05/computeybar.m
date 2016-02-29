function ybar=computeybar(xTe)
% function [ybar]=ybar(xTe);
% 
% computes the expected label 'ybar' for a set of inputs x
% generated from two standard Normal distributions (one offset by OFFSET in
% both dimensions.)
%
% INPUT:
% xTe | a 2xn matrix of column input vectors
% 
% OUTPUT:
% ybar | a 1xn vector of the expected label ybare(x)
%

global OFFSET;

[~,n]=size(xTe);
%ybar=zeros(1,n);
i = [1;1];
i = repmat(i,1,n);
u = [OFFSET;OFFSET];
u = repmat(u,1,n);
pxy1 = normpdf(xTe,0,i);
pxy1 = pxy1(1,:).*pxy1(2,:);
pxy2 = normpdf(xTe,u,i);
pxy2 = pxy2(1,:).*pxy2(2,:);


cur = pxy2 ./ (pxy1+pxy2);
ybar = cur+1;




% Feel free to use the following function to compute p(x|y)
normpdf=@(x,mu,sigma)   exp(-0.5 * ((x - mu)./sigma).^2) ./ (sqrt(2*pi) .* sigma);
%normpdf=@(x,mu,sigma)    exp(-0.5 * (x - mu)'* (x - mu) / (sigma' * sigma)) / (sqrt(2*pi)) / (sigma'*sigma);
