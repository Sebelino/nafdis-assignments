function [X,k]=svdapprox(B, tol)
A = B;
[m, n] = size(B);
p = min(m,n);
R = zeros(p,n); % Preallocate
Q = zeros(m,p); % Preallocate

for j = 1:p
    [~, i] = max(vecnorm(A, 2, 1));
    q = A(:,i) / norm(A(:,i));
    r = q' * A;
    Q(:,j) = q;
    R(j,:) = r;
    A = A - q*r;
    t = norm(A,'fro');

    if t < tol
        k = j;
        break;
    end
end

Q = Q(:,1:k); % Strip unfilled zeros
R = R(1:k,:); % Strip unfilled zeros

[Uhat,S,V] = svd(R,'econ');
U = Q*Uhat;
X = U*S*V';
end