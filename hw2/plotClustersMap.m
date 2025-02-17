function clusters = plotClustersMap(timeseries,x_coords,y_coords,k,outImagePath)
Dist = makeDistances(timeseries);
W = makeKnnWeights(Dist, k);
D = makeDegreeMatrix(W);
L = D - W;
clusterCount = 7;
% [U, ~] = eigs(L, 7, 'smallestabs');
[U, ~] = eig(L);
U = U(:,1:clusterCount);
randn('seed',0); % Reproducibility
clusters = kmeans(U, clusterCount);

f = figure('Visible','off','Units', 'pixels', 'Position', [0, 0, 500, 800]);
t = tiledlayout(4,2);
t.Padding = 'compact';
t.TileSpacing = 'compact';
for i = 1:clusterCount
    bengali = imread('bengali_map.png');
    nexttile;
    imshow(bengali); hold on;
    indices = find(clusters == i);
    plot(y_coords(indices),x_coords(indices),'r.','MarkerSize',4);
end
exportgraphics(t,outImagePath);
f.Visible = 'on';
end