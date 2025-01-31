A = readImages('roundabout_snapshots');

k = 5;
sMax = 25;
errs = randomSvd(A, k, 0:sMax);

f = figure('Visible','off');
semilogy(0:sMax, errs)
axis square;
xlabel('s')
ylabel('$||A-UDV^{\top}||$', 'Interpreter', 'latex')
saveas(f, [mfilename,'.png']);
f.Visible = 'on';
drawnow;