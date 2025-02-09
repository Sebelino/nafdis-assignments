load('zalando_clustering.mat', 'items', 'correct');

w = ones(size(items,1),1);
[v2,~,~] = spectralClustering(items,w);
tau = median(v2);
predicted = (v2<tau)+1;
n = size(items,2);

[truePositives,~] = size(find(predicted-correct==0));
accuracy = truePositives/n;

fprintf('Tau: %f \n',tau)
fprintf('True positives: %d \n',truePositives)
fprintf('Accuracy: %.1f %% \n',accuracy*100)
