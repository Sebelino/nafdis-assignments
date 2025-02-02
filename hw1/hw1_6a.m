A = readImages('roundabout_snapshots');

p = 20;
% Greedy version of Algorithm 1
[Q,R,errs] = gsceb(A, @greedyidx, p);

f = figure('Visible','off');
semilogy(1:p, errs)
axis square;
xlabel('j')
ylabel('$||A_j||$', 'Interpreter', 'latex')
saveas(f, [mfilename,'.png']);
f.Visible = 'on';