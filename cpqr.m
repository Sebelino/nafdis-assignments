function [Q,R,J] = cpqr(V, tol)
[m, n] = size(V);
Q = V;
R = zeros(n, n);
J = 1:n;
p = min(m, n);
s = n;

for j = 1:n
    norms = vecnorm(Q(:, j:n), 2, 1);
    [~, maxIdx] = max(norms);
    maxIdx = maxIdx + j - 1;

    J([j, maxIdx]) = J([maxIdx, j]);
    R(:, [j, maxIdx]) = R(:, [maxIdx, j]);
    Q(:, [j, maxIdx]) = Q(:, [maxIdx, j]);

    rho = norm(Q(:, j));
    q = Q(:, j) / rho;
    R(j, j) = rho;
    Q(:, j) = q;

    if j < n
        rT = q' * Q(:, (j+1):n);
        R(j, (j+1):n) = rT;
        Q(:, (j+1):n) = Q(:, (j+1):n) - q * rT;
    end

    t = norm(Q(:, (j+1):n), 'fro');
    if t < tol
        s = j;
        break;
    end
end

Q = Q(:, 1:s);
R = R(1:s, :);
J = J(1:s);

end
