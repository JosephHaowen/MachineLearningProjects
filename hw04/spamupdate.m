function w=spamupdate(w,email,truth);
%	function w=spamupdate(w,email,truth);
%
% Input:
% w 	weight vector
% email instance vector
% truth label
%
% Output:
%
% updated weight vector

% INSERT CODE HERE:
%if w'*(email.*truth) <0
%  w = w + 2.1*email.*truth;
%endif

[d,n]=size(email);

while(true)
  m=0;
  g=randperm(n);
  email=email(:,g);
  truth=truth(g);
  for ii=1:n
    c=email(:,ii);
    d=truth(1,ii);
    h=d*(w')*c;
    if h<=0
      w=w+10*d*c;
      m=m+1;
    endif
  endfor
  if(m==0||m>=100)
     break;
  endif
endwhile