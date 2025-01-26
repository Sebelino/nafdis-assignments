%A = read_images('testbild_snapshots');
A = read_images('roundabout_snapshots');

ranks = [1,5];
for p = ranks
    [Q,R,errs] = gsceb(A, @greedyidx, p);

    B = Q*R;

    height = 437;
    width = 824;

    C = [B;B;B];

    makevideo(C,height,width,['out',num2str(p),'.avi']);
end