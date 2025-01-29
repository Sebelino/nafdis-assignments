A = load_mat_hw1(1000,100);

[X,~] = svdapprox(A,1e-10);

disp(['Rank: ', num2str(rank(X))])