A = readImages('roundabout_snapshots');

pMax = 25;
[~,elapsed] = randomSvd(A, 15);
disp(['Elapsed time for s=15: ',num2str(elapsed)]);