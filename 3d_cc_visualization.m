%% 3d proj plot of cc

%navigate to file containing data
uiwait(msgbox('Select Folder Containing Images'));
[pathname] = uigetdir;

 
load('node.mat')
load('n.mat')
load('skel_ini.mat')

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

%plots cc value for paths
markerSize = 25;
scatter3(comx,comy,comz,markerSize,cc,'o')
colorbar
view(2)

%Custom Color Bar
set(axes1,'Colormap',...
    [0.800000011920929 0.800000011920929 0.800000011920929;0.809523820877075 0.761904776096344 0.809523820877075;0.819047629833221 0.723809540271759 0.819047629833221;0.828571438789368 0.685714304447174 0.828571438789368;0.838095247745514 0.647619068622589 0.838095247745514;0.84761905670166 0.609523832798004 0.84761905670166;0.857142865657806 0.571428596973419 0.857142865657806;0.866666674613953 0.533333361148834 0.866666674613953;0.876190483570099 0.495238095521927 0.876190483570099;0.885714292526245 0.457142859697342 0.885714292526245;0.895238101482391 0.419047623872757 0.895238101482391;0.904761910438538 0.380952388048172 0.904761910438538;0.914285719394684 0.342857152223587 0.914285719394684;0.92380952835083 0.304761916399002 0.92380952835083;0.933333337306976 0.266666680574417 0.933333337306976;0.942857146263123 0.228571429848671 0.942857146263123;0.952380955219269 0.190476194024086 0.952380955219269;0.961904764175415 0.152380958199501 0.961904764175415;0.971428573131561 0.114285714924335 0.971428573131561;0.980952382087708 0.0761904790997505 0.980952382087708;0.990476191043854 0.0380952395498753 0.990476191043854;1 0 1;0.977591037750244 0.0238095242530107 1;0.955182075500488 0.0476190485060215 1;0.932773113250732 0.0714285746216774 1;0.910364151000977 0.095238097012043 1;0.887955188751221 0.119047619402409 1;0.865546226501465 0.142857149243355 1;0.843137264251709 0.16666667163372 1;0.820728302001953 0.190476194024086 1;0.798319339752197 0.214285716414452 1;0.775910377502441 0.238095238804817 1;0.753501415252686 0.261904776096344 1;0.73109245300293 0.28571429848671 1;0.708683490753174 0.309523820877075 1;0.686274528503418 0.333333343267441 1;0.663865566253662 0.357142865657806 1;0.641456604003906 0.380952388048172 1;0.61904764175415 0.404761910438538 1;0.596638679504395 0.428571432828903 1;0.574229717254639 0.452380955219269 1;0.551820755004883 0.476190477609634 1;0.529411792755127 0.5 1;0.507002830505371 0.523809552192688 1;0.484593838453293 0.547619044780731 1;0.462184876203537 0.571428596973419 1;0.439775913953781 0.595238089561462 1;0.417366951704025 0.61904764175415 1;0.394957989454269 0.642857134342194 1;0.372549027204514 0.666666686534882 1;0.350140064954758 0.690476179122925 1;0.327731102705002 0.714285731315613 1;0.305322140455246 0.738095223903656 1;0.28291317820549 0.761904776096344 1;0.260504215955734 0.785714268684387 1;0.238095238804817 0.809523820877075 1;0.215686276555061 0.833333313465118 1;0.193277314305305 0.857142865657806 1;0.17086835205555 0.88095235824585 1;0.148459389805794 0.904761910438538 1;0.126050427556038 0.928571403026581 1;0.103641457855701 0.952380955219269 1;0.0812324956059456 0.976190447807312 1;0.0588235296308994 1 1]);
% Create colorbar
colorbar(axes1);

hold on

%plots skeleton data
[x, y, z] = ind2sub(size(skel_ini), find(skel_ini));
markersize = 2;
plot3(x, y, z, 'k.');

