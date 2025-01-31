%A = readImages('testbild_snapshots');
A = readImages('roundabout_snapshots');
[~,imageCount] = size(A);

ranks = [5,10,20];
iter = 0;

f = figure('Visible','on');

for p = ranks
    [Q,R,errs] = gsceb(A, @greedyidx, p);

    B = Q*R;

    height = 437;
    width = 824;

    images = reshape(B,height,width,3,imageCount);
    img1 = uint8(images(:,:,:,1));
    iter = iter+1;
    subplot(3,1,iter);
    imshow(img1);
    drawnow;
end
saveas(f, [mfilename,'.png']);