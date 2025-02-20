load('hw3_zalando.mat')

f = figure('Visible','off','Units', 'pixels', 'Position', [0, 0, 800, 800]);
t = tiledlayout(1,2);
t.Padding = 'compact';
t.TileSpacing = 'compact';

nexttile;
zalando_plot(items(:,1))
nexttile;
zalando_plot(items(:,3))

exportgraphics(t,[mfilename,'.png']);
f.Visible = 'on';