A = makeDataMatrix(3);
ee = 2.5;
Dist = makeDistances(A);
W = makeWeights(Dist,ee);
D = makeDegreeMatrix(W);

n=size(W,1);
z=exp(((1:n)-1)*2i*pi/n);

L = D-W;
eig(L)

f = figure('Visible','off','Units', 'pixels', 'Position', [0,0,400,400]);
plotGraph(z,W);
saveas(f, [mfilename,'.png']);
f.Visible = 'on';