function [loss,gradient]=hinge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0)
%
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);
z = (w'*xTr).*yTr;
y = ones(1,n) - z;
y(y<0)=0;
loss = lambda*w'*w + sum(y);
c = (y>0).*yTr*(-1);
a = repmat(c,d,1).*xTr;
gradient = sum(a,2) + 2*lambda*w;

