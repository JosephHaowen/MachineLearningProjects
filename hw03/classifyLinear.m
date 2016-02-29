function preds = classifyLinear(x,w,b);
% function preds=classifyLinear(x,w,b);
%
% Make predictions with a linear classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% w : weight vector
% b : bias
%
% Output:
% preds: predictions
%
y=w'*x+b;
y(y>0)=1;
y(y<0)=-1;
preds = y;
%% fill in code here


