function output=analyze(kind,truth,preds)	
% function output=analyze(kind,truth,preds)		
%
% Analyses the accuracy of a prediction
% Input:
% kind='acc' classification error
% kind='abs' absolute loss
% (other values of 'kind' will follow later)
% 

switch kind
	case 'abs'
		% compute the absolute difference between truth and predictions
		%fill in the code here
		c = abs(truth-preds);
    output = sum(c)/size(truth,2);
	case 'acc' 
		%% fill in code here
    a = sum((truth==preds));
    s = size(truth,1)*size(truth,2);
    output = a/s;
		 	
end;

