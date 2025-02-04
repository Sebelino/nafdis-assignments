load('bengali_cleanup.mat');
A=imread('misc/bengali_map.png');
figure(1); clf;
imshow(A); hold on;
jv=1:numel(x_coords);
plot(y_coords(jv),x_coords(jv),'r.')