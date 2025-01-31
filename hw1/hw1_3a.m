A = load_mat_hw1(1000,100);
[m,n] = size(A);
tol = 1e-10;

[U,S,V] = svd(A,'econ');

largestErrorIndex = find(diag(S) > tol,1,'last') + 1;
k = largestErrorIndex - 1;
lowRankApproximationS = S(1:k,1:k);
X = U(1:m,1:k)*lowRankApproximationS*V(1:n,1:k)';
error = norm(X-A,2);

disp(['Lowest rank: ', num2str(k)])
disp(['||A-X|| = ',num2str(error)])