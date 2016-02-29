function w=perceptron(x,y);
% function w=perceptron(x,y);
%
% Implementation of a Perceptron classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
%

[d,n]=size(x);
w=zeros(d,1);

while(true)
  m=0;
  g=randperm(n);
  x=x(:,g);
  y=y(g);
  for ii=1:n
    c=x(:,ii);
    d=y(1,ii);
    h=d*(w')*c;
    if h<=0
      w=perceptronUpdate(c,d,w);
      m=m+1;
    end;
   endfor
   if(m==0||m>=100)
      break;
   end;
endwhile

%% fill in code here


