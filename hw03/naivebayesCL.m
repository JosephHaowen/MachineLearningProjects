function [w,b]=naivebayesCL(x,y);
% function [w,b]=naivebayesCL(x,y);
%
% Implementation of a Naive Bayes classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
% b : bias (scalar)
%

[d,n]=size(x);
[posy,negy]=naivebayesPY(x,y);
[posp,negp] = naivebayesPXY(x,y);
w = log(posp)-log(negp);
b = log(posy)-log(negy);
%% fill in code here




