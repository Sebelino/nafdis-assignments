A = readImages('roundabout_snapshots');
k = 5;
s = 15;

P=10;
T1=zeros(P,1);
T2=zeros(P,1);

for p=1:P
    % Method one
    tic
    gsceb(A, @greedyidx, k);
    T1(p,1)=toc;

    % Method two
    tic
    randomSvd(A, k, s);
    T2(p,1)=toc;

    fprintf('Iteration %d/%d: Greedy:%g, RandomSVD:%g\n',p,P,T1(p,1),T2(p,1))
end

t1=mean(T1); % Plot the mean of the runs
t2=mean(T2);

disp(['Greedy Algorithm: ', num2str(t1)])
disp(['Randomized SVD:    ', num2str(t2)])