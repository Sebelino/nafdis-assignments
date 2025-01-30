function errs = randomSvd(A, k, sList)
[~,n] = size(A);
errs = zeros(numel(sList),1);
for p = sList
    % Stage A
    Omega = randn(n,k+p);
    Y = A * Omega;
    [Q,~] = qr(Y,'econ');

    % Stage B
    B = Q'*A;
    [Uhat,D,V] = svd(B,'econ');
    U = Q * Uhat;
    U = U(:,1:k);
    D = D(1:k,1:k);
    V = V(:,1:k);
    error = norm(U*D*V' - A, 2);
    errs(p+1) = error;
end
end