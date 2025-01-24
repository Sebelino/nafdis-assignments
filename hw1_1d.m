V = load_mat_hw1(1000,100);

[Q,R,errs] = gsce(V, @greedyidx);

figure;
semilogy(1:minsz(V), errs)
axis square;
set(gca,'YLim',[1e-20, 1e5])
xlabel('j')
ylabel('$||A_j||$', 'Interpreter', 'latex')
exportgraphics(gcf, [mfilename,'.png']);