function [Q,R,errs]=cpqr(V, idxfn)
R = [];
A = V;
[m, n] = size(V);
p = min(m,n);
Q = [];
errs = [];

for j = 1:p
    i = idxfn(j,A);
    q = A(:,i) / norm(A(:,i));
    r = q' * A;
    r = r';
    Q = [Q,q];
    R = [R ; r'];
    A = A - q*r';
    errs = [errs norm(A,2)];
end
end