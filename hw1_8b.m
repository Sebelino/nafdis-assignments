load('zalando_items.mat');
A = item3;

[U,S,V] = svd(A);
[C,Z] = ID_col(A,784);

imageSize=28;
imageCount = 3;
niter = 2*imageCount;

f = figure('Visible','on');

for i = 1:niter
    subplot(3,2,i);
    img = zalandoImage(C(:,i));
    imshow(img,'InitialMagnification', 1000);
    img = zalandoImage(U(:,i));
    imshow(img,'InitialMagnification', 1000);
    drawnow;
end
saveas(f, [mfilename,'.png']);