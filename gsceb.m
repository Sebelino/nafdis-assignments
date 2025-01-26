function [Q,R,errs]=gsce(V, idxfn, p)
R = [];
A = V;
[m, n] = size(V);
Q = [];
errs = [];

for j = 1:p
    i = idxfn(j,A);
    q = A(:,i) / norm(A(:,i));
    r = q' * A;
    Q = [Q,q];
    R = [R ; r];
    A = A - q*r;
    errs = [errs norm(A,2)];
end
end