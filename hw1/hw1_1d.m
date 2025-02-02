V = load_mat_hw1(1000,100);

% Same algorithm as 1c but with greedy
[Q,R,errs] = gsce(V, @greedyidx);

f = figure('Visible','off');
semilogy(1:minsz(V), errs)
axis square;
set(gca,'YLim',[1e-20, 1e5])
xlabel('j')
ylabel('$||A_j||$', 'Interpreter', 'latex')
saveas(f, [mfilename,'.png']);
f.Visible = 'on';