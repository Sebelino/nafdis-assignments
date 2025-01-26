%A = readImages('testbild_snapshots');
A = readImages('roundabout_snapshots');

ranks = [5,10,20];
for p = ranks
    [Q,R,errs] = gsceb(A, @greedyidx, p);

    B = Q*R;

    height = 437;
    width = 824;

    images = reshape(B,height,width,56);
    img1 = uint8(images(:,:,1));
    img1 = cat(3, img1, img1, img1);
    %img2 = uint8(images(:,:,3));
    %img2 = cat(3, img2, img2, img2);
    %img50 = uint8(images(:,:,50));
    %img50 = cat(3, img50, img50, img50);
    figure;
    %subplot(3,1,1);
    imshow(img1);
    %subplot(3,1,2);
    %imshow(img2);
    %subplot(3,1,3);
    %imshow(img50);
end