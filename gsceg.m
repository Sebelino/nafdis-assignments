function [Q,R,errs]=gsceg(V)
R = [];
A = V;
[m, n] = size(V);
p = min(m,n);
Q = [];
j = 1;
errs = [];

for j = 1:p
    [~, i] = max(vecnorm(A, 2, 1));
    q = A(:,i) / norm(A(:,i));
    r = q' * A;
    r = r';
    Q = [Q,q];
    R = [R ; r'];
    A = A - q*r';
    errs = [errs norm(A,2)];
end
end