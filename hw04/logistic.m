function [loss,gradient]=logistic(w,xTr,yTr)
% function w=logistic(w,xTr,yTr)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% w weight vector (default w=0)
%
% OUTPUTS:
% 
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);
z = w'*xTr.*yTr;
loss = sum(log(exp(-1*z)+ones(1,n)),2);
y = -1*repmat(yTr,d,1).*xTr;
a = repmat(exp(z)+ones(1,n),d,1);
gradient = sum(y./a,2);
