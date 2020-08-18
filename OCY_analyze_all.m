clear
close

%Before beginning, make sure source images are 8bit depth files and not RGB
uiwait(msgbox('Select Folder Containing Images'));
[pathname] = uigetdir;


path{1}=pathname;

%% Call Functions

%define pool object first for parallel processing
%poolobj = parpool('local',6); %can't exceed number of cores available

% must pass additional functions to the parallel pool so it can access
% them, for example 'matlab_bgl_sp_mex.c' is needed and not passed
% automatically bc it is a "C" program file

%addAttachedFiles(poolobj,{'matlab_bgl_sp_mex.c'});

% call pool to execute
% 'parfor' opens a thread for each image within the pool object 
for i=1:length(path)      %originally 'parfor' loop, 'for' loop for debug only, may take considerable time
    OCY_main(path{i},'*.tif');
    fprintf('worker %d done.\n',i);
end

cd(pathname);

% when done or before rerunning must delete or close the active pool
