function [Q,R,errs]=gsceb(V, idxfn, p)
[m, n] = size(V);
A = V;
R = zeros(p,n);
Q = zeros(m,p);
errs = zeros(1,p);

for j = 1:p
    i = idxfn(j,A);
    q = A(:,i) / norm(A(:,i));
    r = q' * A;
    Q(:,j) = q;
    R(j,:) = r;
    A = A - q*r;
    errs(j) = norm(A,2);
end
end