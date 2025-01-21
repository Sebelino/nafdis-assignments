V = load_mat_hw1(1000,100);

[Q,R,errs] = cpqr(V, @greedyidx);

plot(1:minsz(V), errs)
set(gca,'YScale','log')