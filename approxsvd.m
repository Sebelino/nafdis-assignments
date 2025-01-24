function [X,k] = approxsvd(A,tol)
[m, n] = size(A);
[U,S,V] = svd(A,0);

largestErrorIndex = find(diag(S) > tol,1,'last') + 1;
k = largestErrorIndex - 1;
lowRankApproximationS = S(1:k,1:k);
X = U(1:m,1:k)*lowRankApproximationS*V(1:n,1:k)';
end