A = load_mat_hw1(1000,100);

tol = 1e-10;
[X,~] = svdapprox(A,tol);

disp(['Rank: ', num2str(rank(X))])