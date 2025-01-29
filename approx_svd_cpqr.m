function [U, S, V] = approx_svd_cpqr(A, tol)
    % Step 1: Compute Column-Pivoted QR (CPQR)
    [Q, R, P] = qr(A, 'vector');  % QR with column pivoting
    
    % Step 2: Determine rank k based on tolerance
    diagR = abs(diag(R)); % Extract diagonal elements of R
    k = find(diagR >= tol * diagR(1), 1, 'last'); % Find largest k such that diag(R) >= tol
    
    if isempty(k)
        k = 1; % Ensure at least rank-1 approximation
    end
    
    % Step 3: Truncate matrices to rank k
    Qk = Q(:, 1:k);
    Rk = R(1:k, 1:k);
    Pk = P(1:k); % Extract first k pivot indices
    
    % Step 4: Compute SVD of the small matrix R_k
    [Uk, S, Vk] = svd(Rk, 'econ');
    
    % Step 5: Recover the left singular vectors
    U = Qk * Uk;
    
    % Step 6: Reorder V according to permutation matrix P
    V = zeros(size(A, 2), k);
    V(Pk, :) = Vk;
    
    % Return the truncated SVD components
    U = U(:, 1:k);
    S = S(1:k, 1:k);
    V = V(:, 1:k);
end