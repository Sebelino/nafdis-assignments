p_values = [10,12,14];

sampleCount = 3;
f = figure('Visible','off','Units', 'pixels', 'Position', [0, 0, 1200, 600]);
t = tiledlayout(1,3);
t.Padding = 'compact';
t.TileSpacing = 'compact';

for p = p_values
    T1=zeros(p,sampleCount);
    T2=zeros(p,sampleCount);
    T3=zeros(p,sampleCount);

    for s = 1:sampleCount
        for j = 1:p
            b = rand(2.^j,1);
            Fn = dftMatrix(numel(b));

            tic;
            Fn*b;
            T1(j,s) = toc;

            tic;
            fftx(b);
            T2(j,s) = toc;

            tic;
            fftx2(b);
            T3(j,s) = toc;
        end
    end

    t1 = mean(T1,2);
    t2 = mean(T2,2);
    t3 = mean(T3,2);

    nexttile;
    plot(2.^(1:p),t1,2.^(1:p),t2,2.^(1:p),t3);
    legend('naive','FFT', 'FFT Improved');
    xlabel('n');
    ylabel('CPU time');
    title(['CPU Time Comparison (p = ', num2str(p), ')']);
    exportgraphics(t,[mfilename,'.png']);
    f.Visible = 'on';
end