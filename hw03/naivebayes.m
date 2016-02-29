function [poscond, negcond] = naivebayes(x,y,x1)
% function possi = naivebayes(x,y);
%
% Computation of log P(Y|X=x1) using Bayes Rule
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
% x1: input vector of d dimensions (dx1)
%
% Output:
% poscond: log conditional probability log P(Y = 1|X=x1)
% negcond: log conditional probability log P(Y = -1|X=x1)
%

[d,n] = size(x);
[pyp,pyn]=naivebayesPY(x,y);
[posp,negp] = naivebayesPXY(x,y);
x=[x ones(d,2)];
y=[y -1 1];
countx1 = sum(ismember(x',x1','rows'));
px1 = countx1/n;

z1 = 1-(~x1.*posp);
c1 = x1.*posp;
c1(c1==0)=1;
prod1 = prod(z1)*prod(c1);
z2 = 1-(~x1.*negp);
c2 = x1.*negp;
c2(c2==0)=1;
prod2 = prod(z2)*prod(c2);
poscond = log(prod1*pyp/px1);
negcond = log(prod2*pyn/px1);

%% fill in code here

