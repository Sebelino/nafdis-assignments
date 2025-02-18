function F = dftMatrix(n)
    % Validate input
    if ~isscalar(n) || n <= 0 || floor(n) ~= n
        error('Input must be a positive integer.');
    end

    % Define indices
    k = (0:n-1)'; % Column vector
    m = (0:n-1);  % Row vector

    % Compute the DFT matrix
    omega = exp(-2*pi*1i/n); % Primitive nth root of unity
    F = omega .^ (k * m);
end