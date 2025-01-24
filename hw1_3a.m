A = load_mat_hw1(1000,100);
[m, n] = size(A);
epsilon = 1e-10;
[U,S,V] = svd(A);
largestErrorIndex = find(diag(S) > 1e-10,1,'last') + 1;
k = largestErrorIndex - 1;

lowRankApproximationS = S(1:k,1:k);

X = U(1:m,1:k)*lowRankApproximationS*V(1:n,1:k)';

disp(['Lowest rank: ', num2str(k)])

S(largestErrorIndex,largestErrorIndex)
norm(X-A,2)