function [a, b] = dummyfunc(input)

poolcheck = gcp('nocreate'); % If no pool, do not create new one.
if isempty(poolcheck)
    fprintf('No Current Pools Open')
elseif isempty(poolcheck.AttachedFiles)
    addAttachedFiles(poolobj,{'matlab_bgl_sp_mex.c'});
    fprintf('File attached to pool...')
else
    fprintf('There is already an attached file')
end

tic;
A = 5e3;
a = zeros(1,input);
for i = 1:input
    a(i) = max(abs(eig(rand(A))));
end
toc
b='hi';

%run the following in the command window
% parfor i=1:1e3      
%    dummyfunc(2e3);
%    fprintf('worker %d done.\n',i);
% end