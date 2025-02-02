function [Q,R,errs]=gsce(V, idxfn) % Graham-Schimdt Column Elimination
R = [];
A = V;
[m, n] = size(V);
p = min(m,n);
Q = [];
errs = [];

for j = 1:p
    i = idxfn(j,A); % id function - greedy or standard
    q = A(:,i) / norm(A(:,i));
    r = q' * A;
    Q = [Q,q];
    R = [R ; r];
    A = A - q*r;
    errs = [errs norm(A,2)];
end
end