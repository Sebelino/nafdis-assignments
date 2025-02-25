p_values = [10,12,14];
%p_values = [5,6,7];

p = max(p_values);

sampleCount = 3;
f = figure('Visible','off','Units', 'pixels', 'Position', [0, 0, 1200, 400]);
t = tiledlayout(1,3);
t.Padding = 'compact';
t.TileSpacing = 'compact';

disp(['Benchmarking with p=',num2str(p), ', sampleCount=',num2str(sampleCount)])

T1=zeros(p,sampleCount);
T2=zeros(p,sampleCount);
T3=zeros(p,sampleCount);

for s = 1:sampleCount
    for j = 1:p
        disp(['Iteration (s,j) = (',num2str(s),',',num2str(j),')'])

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

for p = p_values
    nexttile;
    t1s = t1(1:p);
    t2s = t2(1:p);
    t3s = t3(1:p);
    x = 2.^(1:p);
    plot(x,t1s,x,t2s,x,t3s,'LineWidth',2);
    legend('naive','FFT', 'FFT Improved');
    xlabel('n');
    ylabel('CPU time');
    title(['CPU Time Comparison (p \leq ', num2str(p), ')'], 'Interpreter', 'tex');
end

exportgraphics(t,[mfilename,'.png']);
f.Visible = 'on';