A = load_mat_hw1(1000,100);
[X,k] = approxsvd(A,1e-10);

disp(['Lowest rank: ', num2str(k)])

norm(X-A,2)