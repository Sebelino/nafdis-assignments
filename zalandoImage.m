function img = zalandoImage(z)
imageSize = 28;
img = reshape(z,imageSize,imageSize);
[~,I]=max(abs(z));
za=z(I);
img=img/za;
img = 1-img';
end