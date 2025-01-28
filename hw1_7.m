A = readImages('roundabout_snapshots');

% a)
pMax = 25;
[errs,elapsed] = randomSvd(A, pMax);
disp(['Elapsed time for s=25: ',num2str(elapsed)]);

f = figure('Visible','off');
semilogy(1:pMax, errs)
axis square;
xlabel('s')
ylabel('$||A-UDV^{\top}||$', 'Interpreter', 'latex')
saveas(f, [mfilename,'.png']);
f.Visible = 'on';
drawnow;

% b)
[~,elapsed] = randomSvd(A, 1:15);
disp(['Elapsed time for s=15: ',num2str(elapsed)]);