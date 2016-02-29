function [r,ok,s]=test()

rand('seed',31415926535);
% initial outputs
r=0;
ok=0;
s={};
load boston;
wst=[1 12 size(xTr,1)];
w=initweights(wst);

% test forward pass
xTr = magic(10);
yTr = [0,0,1,0,1,1,0,0,1,1];
[trans_func, trans_func_der] = get_transition_func('ReLU');
try
    [xTr,~,~,~]=preprocess(xTr,xTr);
    [as,zs] = forward_pass(W_test, xTr, trans_func);
    addon='';
    failtest_as = false;
    for i=1:size(as, 2)
        failtest_as = (failtest_as || (norm(as{i} - as_sol{i}) / numel(as{i})) > 1e-1);
    end
    failtest_zs = false;
    for i=1:size(zs, 2)
        failtest_zs = (failtest_zs || ((norm(zs{i} - zs_sol{i}) / numel(zs{i}))) > 1e-1);
    end
catch
    failtest_as = true;
    failtest_zs = true;
    addon=lasterr();
end
if failtest_as,
    r=r+1;
    s{length(s)+1}=['Incorrect forward pass as computed'; addon];
else
    ok=ok+1;
end;
if failtest_zs,
    r=r+1;
    s{length(s)+1}=['Incorrect forward pass zs computed'; addon];
else
    ok=ok+1;
end;