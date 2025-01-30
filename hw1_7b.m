A = readImages('roundabout_snapshots');

k = 5;
[~,elapsed] = randomSvd(A, k, 15);
disp(['Elapsed time for s=15: ',num2str(elapsed)]);