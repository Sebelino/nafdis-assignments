function [X,k]=svdapprox(B, tol, normType)
if nargin < 3
    normType = 2; % Spectral norm is default
end

A = B;
[m, n] = size(B);
p = min(m,n);
% Preallocate memory for efficiency
R = zeros(p,n); 
Q = zeros(m,p); 

for j = 1:p
    [~, i] = max(vecnorm(A, 2, 1));
    q = A(:,i) / norm(A(:,i));
    r = q' * A;
    Q(:,j) = q;
    R(j,:) = r;
    A = A - q*r;
    t = norm(A,normType);

    % Stop if the norm falls below the tolerance
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