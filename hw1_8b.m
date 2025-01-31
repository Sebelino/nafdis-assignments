load('zalando_items.mat');
A = item3;

[U,S,V] = svd(A,'econ');
[C,Z] = ID_col(A,size(U,1));

both = zeros(size(U,1),2*size(U,2));
both(:,1:2:end) = U;
both(:,2:2:end) = C;

imageSize=28;
imageCount = 3;
niter = 2*imageCount;

f = figure('Visible','on');

for i = 1:niter
    subplot(3,2,i);
    img = zalandoImage(both(:,i));
    imshow(img,'InitialMagnification', 1000);
    drawnow;
end
saveas(f, [mfilename,'.png']);