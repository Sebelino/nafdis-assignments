load('bengali_cleanup.mat');

outImagePath = [mfilename,'.png'];
plotClustersMap(timeseries,x_coords,y_coords,3,outImagePath);