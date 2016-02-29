function [ypredict]=evaltree(T,xTe)
% function [ypredict]=evaltree(T,xTe);
%
% input:
% T0  | tree structure
% xTe | Test data (dxn matrix)
%
% output:
%
% ypredict : predictions of labels for xTe
%

[dt,nt] = size(T);
[d,n] = size(xTe);

%if isempty(T)
 % ypredict = zeros(1,n);
%else
  for i = 1:n
    x = xTe(:,i);
    tn = T(:,1);
    while tn(4,1) ~= 0 || tn(5,1) ~= 0 
      f = tn(2,1);
      v = tn(3,1);
      if x(f,1) > v
        index = tn(5,1);
      else 
        index = tn(4,1);
      endif
      if index == 0
        break
      endif
      tn = T(:,index);
    endwhile
    pred = tn(1,1);
    if i == 1
      ypredict = pred;
    else
      ypredict = [ypredict pred];
    endif
  endfor
%endif

    


%% fill in code here

