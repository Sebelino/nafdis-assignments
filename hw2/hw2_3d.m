load('bengali_cleanup.mat');

Dist = makeDistances(timeseries);
k = 3;
W = makeKnnWeights(Dist, k);
D = makeDegreeMatrix(W);
L = D - W;
clusterCount = 7;
%[U, ~] = eigs(L, clusterCount, 'smallestabs');
[U, ~] = eigs(L, clusterCount, 0.0001);
clusters = kmeans(U, clusterCount);

f = figure('Visible','off','Units', 'pixels', 'Position', [0,0,200,800]);
t = tiledlayout(4,2);
t.Padding = 'compact';
t.TileSpacing = 'compact';
for i = 1:clusterCount
    bengali = imread('misc/bengali_map.png');
    nexttile;
    imshow(bengali); hold on;
    indices = find(clusters == i);
    plot(y_coords(indices),x_coords(indices),'r*')
end
f.Visible = 'on';