A = makeDataMatrix(2);
ee = 2.5;
Dist = makeDistances(A);
W = makeWeights(Dist,ee);

n=size(W,1);
z=exp(((1:n)-1)*2i*pi/n);

f = figure('Visible','off','Units', 'pixels', 'Position', [0,0,400,400]);
plotGraph(z,W);
saveas(f, [mfilename,'.png']);
f.Visible = 'on';