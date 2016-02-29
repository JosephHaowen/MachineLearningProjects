function [indices,dists]=findknn(xTr,xTe,k);
% function [indices,dists]=findknn(xTr,xTe,k);
%
% Finds the k nearest neighbors of xTe in xTr.
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
% 
% Output:
% indices = kxm matrix, where indices(i,j) is the i^th nearest neighbor of xTe(:,j)
% dists = Euclidean distances to the respective nearest neighbors
%

% output random results, please erase this code
[d,ntr]=size(xTr);
[d,nte]=size(xTe);
D=l2distance(xTr,xTe);
[B,I]=sort(D);
if k>ntr
  k=ntr;
end
indices=I(1:k,:);
dists=B(1:k,:);


%% fill in code here
  
	
	
%%	%
	
