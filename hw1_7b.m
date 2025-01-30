A = readImages('roundabout_snapshots');
k = 5;
s = 15;

tic; randomSvd(A, k, s); toc;
%disp(['Elapsed time for s=15: ',num2str(elapsed)]);

tic; gsceb(A, @greedyidx, k); toc;