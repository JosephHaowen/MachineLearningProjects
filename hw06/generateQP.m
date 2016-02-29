function [H,q,A,b,lb,ub]=generateQP(K,yTr,C);
% function [H,q,A,b,lb,ub]=generateQP(K,yTr,C);
%
% INPUT:	
% K : nxn kernel matrix
% yTr : 1xn input labels
% C : regularization constant
% 
% Output:
% H,q,A,b,lb,ub as defined in the Octave function 'qp'
%
% A call of qp(alpha0, H, q, A, b, lb, ub); should return the solution of the SVM specified by K,yTr,C
% for any valid alpha0 initialization.
%

[d,n]=size(K);
assert(d==n);
yTr = yTr(:);

temp = K.*repmat(yTr',n,1);
H = temp.*repmat(yTr,1,n);
q = -1*ones(n,1);
A = yTr';
b = 0;
lb = zeros(n,1);
ub = C*ones(n,1);
% YOUR CODE




