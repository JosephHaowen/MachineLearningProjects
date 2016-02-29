function [loss,gradient]=ridge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% w weight vector (default w=0)
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
%
% OUTPUTS:
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%
[d,n]=size(xTr);
y = (w'*xTr-yTr).^2;
loss = sum(y,2)+lambda*w'*w;
z = 2*(w'*xTr - yTr);
d=repmat(z,d,1).*xTr;
gradient = sum(d,2)+2*lambda*w;
