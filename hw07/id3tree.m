function T=id3tree(xTr,yTr,maxdepth,weights)
% function T=id3tree(xTr,yTr,maxdepth,weights)
%
% The maximum tree depth is defined by "maxdepth" (maxdepth=2 means one split).
% Each example can be weighted with "weights".
%
% Builds an id3 tree
%
% Input:
% xTr | dxn input matrix with n column-vectors of dimensionality d
% yTr | 1xn input matrix
% maxdepth = maximum tree depth
% weights = 1xn vector where weights(i) is the weight of example i
%
% Output:
% T = decision tree
%
[d,n] = size(xTr);
if nargin<3,
    maxdepth = Inf;
    weights=ones(1,n)./n;
end;

if nargin<4,
    weights=ones(1,n)./n;
end;
%q = 
x = xTr;
y = yTr;
T = zeros(6,1);


%while(any(y~=y(1))==1)&& sum(sum(x~=repmat(x(:,1),1,n)))>0)
%  T = zeros(6,q);
%%  temp = 
  
  
%while maxdepth ~= 0
%  [feat,cut,hbest] = entropysplit(x,y,weights);
%  if any(y~=y(1))==0 || feat == 0
%      %this node can be regarded as a leaf since all labels are the same or all x have the same value.
      %can set this node index lefttree and right as 0
%      break
 % end;
  %maxdepth = maxdepth - 1;
  %xr = x(:,x(feat,:)>=cut);
 % xl = x(:,x(feat,:)<=cut); % so it could be some elements in both the left and right subtree?????
 % yr = y(:,x(feat,:)>=cut);
 % yl = y(:,x(feat,:)<=cut);
  
 % if(
  
  
%while maxdepth ~= 0
[feat,cut,hbest] = entropysplit(x,y,weights);
T(1,1) = mode(y);
T(2,1) = feat;
T(3,1) = cut;
T(6,1) = 0;

if any(y~=y(1))==0 || feat == 0 || maxdepth == 1
      %this node can be regarded as a leaf since all labels are the same or all x have the same value.
      %can set this node index lefttree and right as 0
  T(4,1) = 0;
  T(5,1) = 0;
else 
  maxdepth = maxdepth - 1;
  xr = x(:,x(feat,:)>cut);
  xl = x(:,x(feat,:)<=cut); % so it could be some elements in both the left and right subtree?????
  yr = y(:,x(feat,:)>cut);
  yl = y(:,x(feat,:)<=cut);
  weightl = weights(:,x(feat,:)<=cut);
  weightr = weights(:,x(feat,:)>cut);
  
  T = recurtree(xl,yl,weightl,T,1,maxdepth);
  T = recurtree(xr,yr,weightr,T,1,maxdepth);
endif 
    

    
    
    
    
function t = recurtree(x,y,weights,T,par,max)



% judge whether we have reached the maximum depth or not.!!!!
% if it is the maximun, then we should not split the tree again.

[feat,cut,hbest] = entropysplit(x,y,weights);
temp = zeros(6,1);

temp(1,1) = mode(y);
temp(2,1) = feat;
temp(3,1) = cut;
temp(6,1) = par;
%T = [T temp];

[d1,n1] = size(T);
if n1 == par
  T(4,par) = n1 + 1;
else
  T(5,par) = n1 + 1;
end;
  

if any(y~=y(1))==0 || feat == 0 || max == 1
      %this node can be regarded as a leaf since all labels are the same or all x have the same value.
      %can set this node index lefttree and right as 0
  temp(4,1) = 0;
  temp(5,1) = 0;
  t = [T temp];
else
  max = max - 1;
  xr = x(:,x(feat,:)>cut);
  xl = x(:,x(feat,:)<=cut);
  yr = y(:,x(feat,:)>cut);
  yl = y(:,x(feat,:)<=cut);
  weightl = weights(:,x(feat,:)<=cut);
  weightr = weights(:,x(feat,:)>cut);
  
  T = [T temp];
  T = recurtree(xl,yl,weightl,T,n1+1,max);
  T = recurtree(xr,yr,weightr,T,n1+1,max);
  t = T;
endif




