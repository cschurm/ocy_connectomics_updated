%% 3d proj plot of cc
close all
clear all

%navigate to file containing data
uiwait(msgbox('Select Folder Containing Images'));
[pathname] = uigetdir;
cd(pathname)
 
load('node.mat')
load('n.mat')
load('skel_ini.mat')

comx=[node.comx].';
comy=[node.comy].';
comz=[node.comz].';
cc=n.cc;

%% Plot All
% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

%plots skeleton data
grey = [.68,.68,.68];
[x, y, z] = ind2sub(size(skel_ini), find(skel_ini));
markersize = 2;
scatter3(x, y, z,markersize,'.','MarkerEdgeColor',grey);
axis([0 max(x) 0 max(y)]);
set(gca,'XTick',[],'YTick',[])

hold on
%plots cc value for paths
markerSize = 20;
scatter3(comx,comy,comz,markerSize,cc,'filled')
title('Node Betweeness Centrality Map')
colorbar
%view(2)

% next work on not plotting cc below a certain threshold, they fill up the
% space and you cant see the model


%Custom Color Bar
set(axes1,'CLim',[0.00355 1],'Colormap',...
    [0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0.0833333358168602 1 0.0833333358168602;0.16666667163372 1 0.16666667163372;0.25 1 0.25;0.333333343267441 1 0.333333343267441;0.416666656732559 1 0.416666656732559;0.5 1 0.5;0.583333313465118 1 0.583333313465118;0.666666686534882 1 0.666666686534882;0.75 1 0.75;0.833333313465118 1 0.833333313465118;0.916666686534882 1 0.916666686534882;1 1 1;1 1 1;1 1 1;1 1 1;1 0.933333337306976 1;1 0.866666674613953 1;1 0.800000011920929 1;1 0.733333349227905 1;1 0.666666686534882 1;1 0.600000023841858 1;1 0.533333361148834 1;1 0.466666668653488 1;1 0.400000005960464 1;1 0.333333343267441 1;1 0.266666680574417 1;1 0.200000002980232 1;1 0.133333340287209 1;1 0.0666666701436043 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1],...
    'XColor','none','XTick',[],'YColor','none','YTick',[],'ZColor','none');
% Create colorbar
colorbar(axes1);

%% Option for plotting only half to cut down on clutter

% Create figure
figure2 = figure;

% Create axes
axes1 = axes('Parent',figure2);
hold(axes1,'on');
x_2=x(round(length(x))/2:end); %flip which half is graphed  (round(length(y))/2:end)
y_2=y(round(length(y))/2:end);
z_2=z(round(length(z))/2:end);

%plots skeleton data
markersize = 2;
grey = [.68,.68,.68];
scatter3(x_2, y_2, z_2, markersize,'.','MarkerEdgeColor',grey)
axis([0 max(x) 0 max(y)]);
set(gca,'XTick',[],'YTick',[])

hold on
%plots cc value for paths, filter based on z vals of skel ini
for ii = 1:length(cc)
    if comz(ii) >= min(z_2) %switch <=max(z_2) or >=min(z_2) to flip between halves  
        comx_2(ii)=comx(ii);
        comy_2(ii)=comy(ii);
        comz_2(ii)=comz(ii);
        cc_2(ii)=cc(ii);
    end
end
        
markerSize = 20;
scatter3(comx_2,comy_2,comz_2,markerSize,cc_2,'filled')
colorbar
title('Node Betweeness Centrality Map')
%view(2)

%Custom Color Bar
set(axes1,'CLim',[0.00355 1],'Colormap',...
    [0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0.0833333358168602 1 0.0833333358168602;0.16666667163372 1 0.16666667163372;0.25 1 0.25;0.333333343267441 1 0.333333343267441;0.416666656732559 1 0.416666656732559;0.5 1 0.5;0.583333313465118 1 0.583333313465118;0.666666686534882 1 0.666666686534882;0.75 1 0.75;0.833333313465118 1 0.833333313465118;0.916666686534882 1 0.916666686534882;1 1 1;1 1 1;1 1 1;1 1 1;1 0.933333337306976 1;1 0.866666674613953 1;1 0.800000011920929 1;1 0.733333349227905 1;1 0.666666686534882 1;1 0.600000023841858 1;1 0.533333361148834 1;1 0.466666668653488 1;1 0.400000005960464 1;1 0.333333343267441 1;1 0.266666680574417 1;1 0.200000002980232 1;1 0.133333340287209 1;1 0.0666666701436043 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1],...
    'XColor','none','XTick',[],'YColor','none','YTick',[],'ZColor','none');
% Create colorbar
colorbar(axes1);

%% Remove Zeros from cc vector
        
count=1;
for i=1:length(cc)
    if cc(i) > 0
        valid_cc(count)=cc(i);
        comx_new(count)=comx(i);
        comy_new(count)=comy(i);
        comz_new(count)=comz(i);
        count=count+1;
    end
end

 % Create figure
figure3 = figure;

% Create axes
axes1 = axes('Parent',figure3);
hold(axes1,'on');

%plots skeleton data
grey = [.68,.68,.68];
[x, y, z] = ind2sub(size(skel_ini), find(skel_ini));
markersize = 2;
scatter3(x, y, z,markersize,'.','MarkerEdgeColor',grey);
axis([0 max(x) 0 max(y)]);
set(gca,'XTick',[],'YTick',[])

hold on
%plots cc value for paths
markerSize = 20;
scatter3(comx_new,comy_new,comz_new,markerSize,valid_cc,'filled')
colorbar
title('Node Betweeness Centrality Map')
%view(2)

%Custom Color Bar
view(axes1,[0.325500000000021 90]);
% Set the remaining axes properties
set(axes1,'CLim',[0.00355 1],'Colormap',...
    [0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0.0714285746216774 1 0.0714285746216774;0.142857149243355 1 0.142857149243355;0.214285716414452 1 0.214285716414452;0.28571429848671 1 0.28571429848671;0.357142865657806 1 0.357142865657806;0.428571432828903 1 0.428571432828903;0.5 1 0.5;0.571428596973419 1 0.571428596973419;0.642857134342194 1 0.642857134342194;0.714285731315613 1 0.714285731315613;0.785714268684387 1 0.785714268684387;0.857142865657806 1 0.857142865657806;0.928571403026581 1 0.928571403026581;1 1 1;1 0.833333313465118 1;1 0.666666686534882 1;1 0.5 1;1 0.333333343267441 1;1 0.16666667163372 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1],...
    'XColor','none','XTick',[],'YColor','none','YTick',[],'ZColor','none');
% Create colorbar
colorbar(axes1,'Position',...
    [0.912499999999999 0.10952380952381 0.0285714285714286 0.815476190476191],...
    'FontWeight','bold',...
    'FontSize',12);

%% Plot half with zeros removed

% Create figure
figure4 = figure;

% Create axes
axes1 = axes('Parent',figure4);
hold(axes1,'on');

%select a portion
x_2=x(round(length(x))/2:end); %flip which half is graphed  (1:round(length(y))/2) vs (round(length(y))/2:end)
y_2=y(round(length(y))/2:end);
z_2=z(round(length(z))/2:end);

%plots skeleton data
markersize = 2;
grey = [.68,.68,.68];
scatter3(x_2, y_2, z_2, markersize,'.','MarkerEdgeColor',grey)
axis([0 max(x) 0 max(y)]);
set(gca,'XTick',[],'YTick',[])
hold on

%select cc value for paths, filter based on z vals of skel ini
%chose z range
for ii = 1:length(cc) 
    if comz(ii) >= min(z_2) %switch <=max(z_2) or >=min(z_2) to flip between halves 
        comx_2(ii)=comx(ii);
        comy_2(ii)=comy(ii);
        comz_2(ii)=comz(ii);
        cc_2(ii)=cc(ii);
    end
end

%remove cc vals of zero
count=1;
for i=1:length(cc_2)
    if cc_2(i) > .0
        valid_cc_2(count)=cc_2(i);
        comx_new_2(count)=comx_2(i);
        comy_new_2(count)=comy_2(i);
        comz_new_2(count)=comz_2(i);
        count=count+1;
    end
end

%plots cc value for paths
markerSize = 20;
scatter3(comx_new_2,comy_new_2,comz_new_2,markerSize,valid_cc_2,'filled')
colorbar
title('Node Betweeness Centrality Map')
%view(2)

%Custom Color Bar
set(axes1,'CLim',[0.00355 1],'Colormap',...
    [0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0 1 0;0.0833333358168602 1 0.0833333358168602;0.16666667163372 1 0.16666667163372;0.25 1 0.25;0.333333343267441 1 0.333333343267441;0.416666656732559 1 0.416666656732559;0.5 1 0.5;0.583333313465118 1 0.583333313465118;0.666666686534882 1 0.666666686534882;0.75 1 0.75;0.833333313465118 1 0.833333313465118;0.916666686534882 1 0.916666686534882;1 1 1;1 1 1;1 1 1;1 1 1;1 0.933333337306976 1;1 0.866666674613953 1;1 0.800000011920929 1;1 0.733333349227905 1;1 0.666666686534882 1;1 0.600000023841858 1;1 0.533333361148834 1;1 0.466666668653488 1;1 0.400000005960464 1;1 0.333333343267441 1;1 0.266666680574417 1;1 0.200000002980232 1;1 0.133333340287209 1;1 0.0666666701436043 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1;1 0 1],...
    'XColor','none','XTick',[],'YColor','none','YTick',[],'ZColor','none');
% Create colorbar
colorbar(axes1);