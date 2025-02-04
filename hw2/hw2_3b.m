load('bengali_cleanup.mat');

jv=[102,280,10];

A = imread('bengali_map.png');
f = figure('Visible','off','Units', 'pixels', 'Position', [0, 0, 400, 400]);
imshow(A); hold on;
plot(y_coords(jv),x_coords(jv),'r.','MarkerSize',15);
exportgraphics(f,[mfilename,'.png'],'Resolution',400)
f.Visible = 'on';

Dist = makeDistances(timeseries);

Dist(102, 280)
Dist(102, 10)
Dist(10, 280)

% 102 280 = Two points to the left
% 10 = East