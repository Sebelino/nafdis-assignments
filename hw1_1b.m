% V = [1 2 3;4 5 6;7 8 9];

V = [
    1 2 2003 2005;
    2 2 2002 2004;
    3 2 2001 2003;
    4 7 7005 7012;
    ];

[Q,R,errs] = gsce(V, @standardidx);

disp(['3rd error: ', num2str(errs(3))])

figure;
plot(1:minsz(V), errs)
set(gca,'YScale','log')
axis square;
set(gca,'YLim',[1e-20, 1e5])
xlabel('j')
ylabel('$||A_j||$', 'Interpreter', 'latex')
exportgraphics(gcf, [mfilename,'.png'], 'Resolution', 100);