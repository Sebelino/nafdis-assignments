function [errs,elapsed] = randomSvd(A, pMax)
k = 5;
[~,n] = size(A);
errs = [];
tic;
for p = 1:pMax
    % Stage A
    Omega = randn(n,k+p);
    Y = A * Omega;
    [Q,~] = qr(Y,'econ');

    % Stage B
    B = Q'*A;
    [Uhat,D,V] = svd(B,'econ');
    U = Q * Uhat;
    U = U(:,1:5);
    D = D(1:5,1:5);
    V = V(:,1:5);
    error = norm(U*D*V' - A, 2);
    errs = [errs error];
end
elapsed = toc;
end