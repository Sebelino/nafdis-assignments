load('zalando_clustering.mat');

% Print images
imageCountX = 3;
imageCountY = 4;
imageCount = imageCountY*imageCountX;

reshaped = reshape(correct(1:imageCount).',imageCountX,imageCountY).';
disp(reshaped)

% Plot images
outImagePath = [mfilename,'.png'];

f = figure('Visible','off','Units', 'pixels', 'Position', [0, 0, 500, 800]);
t = tiledlayout(imageCountY,imageCountX);
t.Padding = 'compact';
t.TileSpacing = 'compact';
for i = 1:imageCount
    nexttile;
    zalando_plot(items(:,i)); hold on;
    title(['Image ', num2str(i)]);
end
exportgraphics(t,outImagePath);
f.Visible = 'on';