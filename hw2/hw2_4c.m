load('zalando_clustering.mat');

n = 1000;
w = ones(n);
D = buildDistance(items, w);

W = zeros(n);
alpha = 0.5;
for i = 1:n
    sgma = std(D(:,i));
    for j = 1:n
        W(i,j) = exp(-alpha*D(i,j)^2/sgma^2);
    end
end
W = W-diag(diag(W));
W = (W+W')/2; % We want an undirected graph

De = makeDegreeMatrix(W);
L = De - W;

[V,~] = eig(L);
v2 = V(:,2);

smallClusterIndices = find(v2<0);

f = figure('Visible','off','Units', 'pixels', 'Position', [0, 0, 800, 800]);
t = tiledlayout(2,2);
t.Padding = 'compact';
t.TileSpacing = 'compact';

nexttile;
plot(v2/norm(v2), '*')
ylim([-1.1,0.1]);
grid on;

nexttile;
plot(v2/norm(v2), '*')
ylim([-0.003,0.003]);
grid on;

nexttile;
zalando_plot(items(:,smallClusterIndices(1)));

nexttile;
zalando_plot(items(:,smallClusterIndices(2)));

outImagePath = [mfilename,'.png'];
exportgraphics(t,outImagePath);
f.Visible = 'on';