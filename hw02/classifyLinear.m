function preds = classifyLinear(x,w,b);
% function preds=classifyLinear(x,w,b);
%
% Make predictions with a linear classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% w : weight vector (dx1)
% b : bias (scalar)
%
% Output:
% preds: predictions (1xn)
%

% if no bias is given, set it to zero
if nargin<3,
	b=0;
end;

g=w'*x+b;
preds=(g>0)+(-1)*(g<0);
%% fill in code here


