A = readImages('roundabout_snapshots');

% a)
ps = 0:25;
[errs,elapsed] = randomSvd(A, ps);
disp(['Elapsed time for s=25: ',num2str(elapsed)]);

f = figure('Visible','off');
semilogy(ps, errs)
axis square;
xlabel('s')
ylabel('$||A-UDV^{\top}||$', 'Interpreter', 'latex')
saveas(f, [mfilename,'.png']);
f.Visible = 'on';
drawnow;

% b)
[~,elapsed] = randomSvd(A, 1:15);
disp(['Elapsed time for s=15: ',num2str(elapsed)]);