A = readImages('roundabout_snapshots');

ranks = [1, 3];
for p = ranks
    [Q,R,errs] = gsceb(A, @greedyidx, p);

    B = Q*R;

    height = 437;
    width = 824;

    C = B;
    %C = [B;B;B]; % Convert greyscale to grey RGB

    makevideo(C,height,width,['out',num2str(p),'.avi']);
end