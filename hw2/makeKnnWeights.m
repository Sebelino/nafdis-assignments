function W = makeKnnWeights(Dist,k)
n = size(Dist,1);
W = zeros(n,n);
for i = 1:n
    [~, idx] = sort(Dist(i, :));
    neighbors = idx(2:k+1);
    W(i, neighbors) = 1;
end
W = max(W, W');
end