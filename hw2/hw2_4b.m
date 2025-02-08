load('zalando_clustering.mat');

n = 1000;
w = ones(n);
D = buildDistance(items, w);

disp(D)