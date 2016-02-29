function K = computeK(ktype, X, Z, param)
% function K = computeK(kernel_type, X, Z)
% computes a matrix K such that Kij=g(x,z);
% for three different function linear, rbf or polynomial.
%
% Input:
% kernel_type: either 'linear','polynomial','rbf'
% X: n input vectors of dimension d (dxn);
% Z: m input vectors of dimension d (dxn);
% param: kernel parameter (inverse kernel width gamma in case of RBF, degree in case of polynomial)
%
% OUTPUT:
% K : nxm kernel matrix
%
%
if nargin<2,
	Z=X;
end;

if strncmp(ktype,'linear',1) == 1
  K = X'*Z;
elseif strncmp(ktype,'rbf',1) == 1
  dist = l2distance(X,Z);
  K = exp(-1*param*(dist.^2));
elseif strncmp(ktype,'poly',1) == 1
  K = (X'*Z + 1).^param;
endif

