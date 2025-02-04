load('bengali_cleanup.mat');

A=imread('bengali_map.png');
figure(1); clf;
imshow(A); hold on;
jv=[102,280,10];
plot(y_coords(jv),x_coords(jv),'r*')

Dist = makeDistances(timeseries);

Dist(102, 280)
Dist(102, 10)
Dist(10, 280)

% 102 280 = Two points to the left
% 10 = East