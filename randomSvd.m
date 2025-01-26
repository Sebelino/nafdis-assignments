function [errs,elapsed] = randomSvd(ps)
A = read_images('roundabout_snapshots');

k = 5;
[m,n] = size(A);
errs = [];
OmegaOrg = randn(n,k+25);
tic;
for p = ps
    % Stage A
    %Omega = OmegaOrg(:,1:k+p);
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