function [v2,D,Es] = spectralClustering(items, w)
n = size(items,2);
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

[V,Es] = eig(L);
v2 = V(:,2);
Es = diag(Es);
end