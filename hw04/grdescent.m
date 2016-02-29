function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%

if nargin<5,tolerance=1e-02;end;
[loss,gradient] = func(w0);
w1 = w0;
while (norm(gradient)>=tolerance)&&maxiter!=0
  wn = w1 - stepsize*gradient;
  loss1 = loss;
  [loss,gradient] = func(wn);
  %w2 = wn - stepsize*gradient;
  %[loss2,grad2] = func(w2);
  %if(norm(grad2)>=tolerance)
    if (loss1>loss)
      stepsize = stepsize*1.01;
    elseif (loss1<loss)
      stepsize = stepsize*0.5;
    endif
  %endif
  w1 = wn;
  maxiter--;
endwhile
w=wn;