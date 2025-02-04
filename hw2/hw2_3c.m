load('bengali_cleanup.mat');

Dist = makeDistances(timeseries);

k = 3;
W = makeKnnWeights(Dist, k);

G = graph(W);
f = figure('Visible','off','Units', 'pixels', 'Position', [0, 0, 400, 400]);
plot(G,'.','Layout','force','MarkerSize',3);
exportgraphics(gca,[mfilename,'.png'],'Resolution',400)
f.Visible = 'on';