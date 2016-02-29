function [posprob,negprob] = naivebayesPXY(x,y)
% function [posprob,negprob] = naivebayesPXY(x,y);
%
% Computation of P(X|Y)
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1) (1xn)
%
% Output:
% posprob: probability vector of p(x|y=1) (dx1)
% negprob: probability vector of p(x|y=-1) (dx1)
%

% add one all-ones positive and negative example
[d,n]=size(x);
x=[x ones(d,2)];
y=[y -1 1];

[d,n] = size(x);
xpos = x(:,find(y==1));
xneg = x(:,find(y==-1));

pyap = sum(sum(xpos));
pyan = sum(sum(xneg));

pyp = sum(xpos,2);
pyn = sum(xneg,2);

posprob = pyp/pyap;
negprob = pyn/pyan;


%% fill in code here
