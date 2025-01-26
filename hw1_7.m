A = read_images('roundabout_snapshots');

% a)
ps = 0:25;
[errs,elapsed] = randomSvd(ps);
disp(['Elapsed time for s=25: ',num2str(elapsed)]);

f = figure('Visible','off');
semilogy(ps, errs)
axis square;
xlabel('s')
ylabel('$||U*D*V''-A||$', 'Interpreter', 'latex')
saveas(f, [mfilename,'.png']);
f.Visible = 'on';

% b)
[~,elapsed] = randomSvd(1:15);
disp(['Elapsed time for s=15: ',num2str(elapsed)]);