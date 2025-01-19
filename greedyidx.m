function idx = greedyidx(~,A)
[~, idx] = max(vecnorm(A, 2, 1));
end