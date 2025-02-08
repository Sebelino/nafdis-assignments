load('zalando_clustering.mat');

n = 1000;
w = ones(n);
D = buildDistance(items, w);

W = zeros(n);
alpha = 0.5;
for i = 1:n
    sgma = std(D(:,i));
    for j = 1:n
        W(i,j) = exp(-alpha*D(i,j)^2/sgma^2);
    end
end
W = W-diag(diag(W));
W = (W+W')/2; % We want an undirected graph

De = makeDegreeMatrix(W);
L = De - W;

[V,~] = eig(L);
v2 = V(:,2);

tau = median(v2);

predicted = (v2<tau)+1;

[truePositives,~] = size(find(predicted-correct==0));
accuracy = truePositives/n;

fprintf('True positives: %d \n',truePositives)
fprintf('Accuracy: %.1f %% \n',accuracy*100)
