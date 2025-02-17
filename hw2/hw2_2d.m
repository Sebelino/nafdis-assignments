A = makeDataMatrix(3.1);
ee = 2.8;
Dist = makeDistances(A);
W = makeWeights(Dist,ee);
D = makeDegreeMatrix(W);

n=size(W,1);
z=exp(((1:n)-1)*2i*pi/n);

L = D-W;
[V, D] = eig(L);
v2 = V(:,2);

kmeans(V(:,1:2),2);

f = figure('Visible','off','Units', 'pixels', 'Position', [0,0,400,800]);
t = tiledlayout(2,1);
t.Padding = 'compact';
t.TileSpacing = 'compact';
nexttile;
plotGraph(z,W);

nexttile;
ax = gca; % Get current axes
ax.XTick = 1:1:16; % Set x-ticks with step size of 1
ax.GridLineStyle = '-'; % Solid grid lines
ax.GridAlpha = 0.3; % Adjust grid transparency

scatter(1:16, v2, '*')
grid on;
xlabel('i')
ylabel('v2(i)')

saveas(f, [mfilename,'.png']);
f.Visible = 'on';