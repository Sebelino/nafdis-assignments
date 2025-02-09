load('zalando_clustering.mat', 'items', 'correct');

w = crazyWeight;
[v2,~,~] = spectralClustering(items,w);
tau = median(v2);
predicted = (v2<tau)+1;
n = size(items,2);

[truePositives,~] = size(find(predicted-correct==0));
accuracy = truePositives/n;

fprintf('Tau: %f \n',tau)
fprintf('True positives: %d \n',truePositives)
fprintf('Accuracy: %.1f %% \n',accuracy*100)

negativeClusterIndices = find(v2<0);

f = figure('Visible','off','Units', 'pixels', 'Position', [0, 0, 800, 400]);
t = tiledlayout(1,2);
t.Padding = 'compact';
t.TileSpacing = 'compact';

nexttile;
zalando_plot(w);

nexttile;
plot(v2/norm(v2), '*')
grid on;

outImagePath = [mfilename,'.png'];
exportgraphics(t,outImagePath);
f.Visible = 'on';