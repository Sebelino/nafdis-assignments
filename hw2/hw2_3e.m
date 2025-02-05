load('bengali_cleanup.mat');

outImagePath = [mfilename,'.png'];
k = 2;
plotClustersMap(timeseries,x_coords,y_coords,k,outImagePath);