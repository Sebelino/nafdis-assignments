load('zalando_clustering.mat');

n = 1000;
w = ones(n);
D = buildDistance(items, w);

Db = D + (max(D(:))+1)*eye(n); % Ignore diagonal values when minimizing
[min1, idx1] = min(Db(1,:));
[min2, idx2] = min(Db(2,:));

f = figure('Visible','off','Units', 'pixels', 'Position', [0, 0, 400, 400]);
t = tiledlayout(2,2);
t.Padding = 'compact';
t.TileSpacing = 'compact';

nexttile;
zalando_plot(items(:,1)); hold on;
title('image(:,1)');

nexttile;
zalando_plot(items(:,idx1)); hold on;
title(['image(:,',num2str(idx1),')']);

nexttile;
zalando_plot(items(:,2)); hold on;
title('image(:,2)');

nexttile;
zalando_plot(items(:,idx2)); hold on;
title(['image(:,',num2str(idx2),')']);

outImagePath = [mfilename,'.png'];
exportgraphics(t,outImagePath);
f.Visible = 'on';