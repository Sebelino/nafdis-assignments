function x=matvec_circulant(z,b)
    % Naive method
    C=toeplitz(z,[z(1);z(end:-1:2)]); % Create the circulant matrix
    x=C*b;
end
