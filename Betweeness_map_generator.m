clear
close all

load n.mat
cc=n.cc;
bw=n.bw;

load('node.mat')
load('n.mat')
load('skel_ini.mat')

comx=[node.comx].';
comy=[node.comy].';
comz=[node.comz].';

%%
count=1;
for i=1:length(bw)
    if bw(i) > 0.01 %clear off the almost 0 points
        valid_bw(count)=bw(i);
        comx_bw(count)=comx(i);
        comy_bw(count)=comy(i);
        comz_bw(count)=comz(i);
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
scatter3(comx_bw,comy_bw,comz_bw,markerSize,valid_bw,'filled')
colorbar
title('Node Betweeness Centrality Map')
%view(2)

mean_bw = mean(valid_bw)
bw_fract = length(valid_bw)/length(bw)
