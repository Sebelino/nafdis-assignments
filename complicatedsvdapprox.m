function [X,k] = svdapprox(A, tol)
[Q,R,J] = cpqr(A, tol);

n = size(R,2);
P = eye(n);
Jc = setdiff(1:n,J);
P = [P(:,J),P(:,Jc)];

[Uhat,S,V] = svd(R*P', 'econ');

s = size(J,2);
S = S(1:s,1:s);
Uhat = Uhat(:,1:s);
V = V(:,1:s);

U = Q*Uhat;

k = s;
X = U*S*V';
end