load('bengali_cleanup.mat');

outImagePath = [mfilename,'.png'];
k = 3;
plotClustersMap(timeseries,x_coords,y_coords,k,outImagePath);