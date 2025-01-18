% V = [1 2 3;4 5 6;7 8 9];

V = [
    1 2 2003 2005;
    2 2 2002 2004;
    3 2 2001 2003;
    4 7 7005 7012;
]

[Q,R,errs] = gsces(V);

errs(3)
plot(1:p, errs)
set(gca,'YScale','log')

V = load_mat_hw1(1000,100)

[Q,R,errs] = gsces(V)

plot(1:min(size(V)), errs)
set(gca,'YScale','log')

[Q,R,errs] = gsceg(V)

plot(1:min(size(V)), errs)
set(gca,'YScale','log')