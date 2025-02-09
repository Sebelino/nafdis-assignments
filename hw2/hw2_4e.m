load('zalando_clustering.mat', 'items', 'correct');

w = ones(size(items,1),1);
[v2,D,~] = spectralClustering(items,w);
tau = median(v2);
predicted = (v2<tau)+1;
n = size(items,2);

misclassified = find(predicted ~= correct);
misclassified = misclassified(1:4);

f = figure('Visible','off','Units', 'pixels', 'Position', [0, 0, 900, 400]);
t = tiledlayout(2,4);
t.Padding = 'compact';
t.TileSpacing = 'compact';

plotMisclassification(items,misclassified(1),correct,predicted)
plotMisclassification(items,misclassified(2),correct,predicted)
plotMisclassification(items,misclassified(3),correct,predicted)
plotMisclassification(items,misclassified(4),correct,predicted)

plotNearestMisclassification(items,misclassified(1),correct,D);
plotNearestMisclassification(items,misclassified(2),correct,D);
plotNearestMisclassification(items,misclassified(3),correct,D);
plotNearestMisclassification(items,misclassified(4),correct,D);

outImagePath = [mfilename,'.png'];
exportgraphics(t,outImagePath);
f.Visible = 'on';