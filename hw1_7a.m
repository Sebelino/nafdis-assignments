A = readImages('roundabout_snapshots');

k = 5;
pMax = 25;
[errs,~] = randomSvd(A, k, pMax);

f = figure('Visible','off');
semilogy(0:pMax, errs)
axis square;
xlabel('s')
ylabel('$||A-UDV^{\top}||$', 'Interpreter', 'latex')
saveas(f, [mfilename,'.png']);
f.Visible = 'on';
drawnow;