%A = readImages('testbild_snapshots');
A = readImages('roundabout_snapshots');

p = 20;
[Q,R,errs] = gsceb(A, @greedyidx, p);

f = figure('Visible','off');
semilogy(1:p, errs)
axis square;
set(gca,'YLim',[1e-20, 1e5])
xlabel('j')
ylabel('$||A_j||$', 'Interpreter', 'latex')
saveas(f, [mfilename,'.png']);
f.Visible = 'on';