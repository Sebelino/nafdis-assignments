A = load_mat_hw1(1000,100);
[X,k] = approxsvd(A,1e-10);
error = norm(X-A,2);

disp(['Lowest rank: ', num2str(k)])
disp(['||A-X|| = ',num2str(error)])