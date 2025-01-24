V = load_mat_hw1(1000,100);

[Q,R,errs] = gsce(V, @standardidx);

disp(['3rd error: ', num2str(errs(3))])

figure;
plot(1:minsz(V), errs)
set(gca,'YScale','log')
axis square;
set(gca,'YLim',[1e-20, 1e5])
xlabel('j')
ylabel('$||A_j||$', 'Interpreter', 'latex')
exportgraphics(gcf, [mfilename,'.png']);