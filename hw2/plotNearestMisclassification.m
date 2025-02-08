function plotNearestMisclassification(items,idx,correct,D)
nexttile;
n = size(items,2);
misclassifiedTrueClass = correct(idx);
irrelevantIndices = find(correct == misclassifiedTrueClass);
Db = D + (max(D(:))+1)*eye(n); % Ignore diagonal values when minimizing
distances = Db(:,idx);
distances(irrelevantIndices) = max(D(:))+1;
[nearestDist,nearestIdx] = min(distances);
zalando_plot(items(:,nearestIdx));
title(sprintf('%d: Dist from %d: %f', nearestIdx, idx, nearestDist));
end