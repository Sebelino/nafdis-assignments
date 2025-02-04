load('bengali_cleanup.mat');
A=imread('bengali_map.png');
f = figure('Visible','off','Units', 'pixels', 'Position', [0, 0, 400, 400]);
imshow(A); hold on;
jv=1:numel(x_coords);
plot(y_coords(jv),x_coords(jv),'r.','MarkerSize',4);
saveas(f, [mfilename,'.png']);
f.Visible = 'on';