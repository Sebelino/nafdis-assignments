load('bengali_cleanup.mat');

Dist = makeDistances(timeseries);

k = 3;
W = makeKnnWeights(Dist, k);

G = graph(W);
plot(G, 'Layout', 'force');