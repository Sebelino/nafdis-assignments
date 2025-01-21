V = load_mat_hw1(1000,100);

[Q,R,errs] = cpqr(V, @standardidx);

disp(['3rd error: ', num2str(errs(3))])

plot(1:minsz(V), errs)
set(gca,'YScale','log')