load('zalando_clustering.mat', 'items', 'correct');

w = ones(size(items,1),1);
[v2,~,Es] = spectralClustering(items,w);
smallClusterIndices = find(v2<0);

disp('First few eigenvalues:')
disp(Es(1:5))

f = figure('Visible','off','Units', 'pixels', 'Position', [0, 0, 800, 800]);
t = tiledlayout(2,2);
t.Padding = 'compact';
t.TileSpacing = 'compact';

nexttile;
plot(v2/norm(v2), '*')
ylim([-1.1,0.1]);
grid on;

nexttile;
plot(v2/norm(v2), '*')
ylim([-0.003,0.003]);
grid on;

nexttile;
zalando_plot(items(:,smallClusterIndices(1)));

nexttile;
zalando_plot(items(:,smallClusterIndices(2)));

outImagePath = [mfilename,'.png'];
exportgraphics(t,outImagePath);
f.Visible = 'on';