A = readImages('roundabout_snapshots');

k = 5;
pMax = 25;
[~,elapsed] = randomSvd(A, k, 15);
disp(['Elapsed time for s=15: ',num2str(elapsed)]);