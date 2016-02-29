function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%	
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% l2distance(X)=l2distance(X,X)
%

[d,n]=size(X);
% YOUR CODE (you can copy it from previous projects)

if (nargin==1) % case when there is only one input (X)
	%% fill in code here
   D = l2distance(X,X);

else  % case when there are two inputs (X,Z)
	%% fil in code here
   A = diag(X'*X);
   B = diag(Z'*Z); 
   A = repmat(A,1,columns(Z));
   B = repmat(B',columns(X),1);
   C = (A + B - 2*X'*Z);
   D = sqrt(C); 
end;

