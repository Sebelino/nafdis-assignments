function [X,k]=gsces(B, tol)
R = [];
A = B;
[m, n] = size(B);
p = min(m,n);
Q = [];

for j = 1:p
    [~, i] = max(vecnorm(A, 2, 1));
    q = A(:,i) / norm(A(:,i));
    r = q' * A;
    Q = [Q,q];
    R = [R ; r];
    A = A - q*r;
    t = norm(A,2);

    if t < tol
        k = j;
        break;
    end
end

[Uhat,S,V] = svd(R,'econ');
U = Q*Uhat;
X = U*S*V';
end