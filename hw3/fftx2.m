function y = fftx2(x)
n = size(x, 1);
omega = exp(-2i*pi/n);

if rem(n,2) == 0
    k = (0:n/2-1)';
    w = omega.^k;
    % Presume x(1:2:n-1) == x(2:2:n)
    fftxResult = fftx(x(1:2:n-1));
    u = fftxResult;
    v = w.*fftxResult;
    y = [u+v;u-v];
else
    j = 0:n-1;
    k = j';
    F = omega.^(k*j);
    y = F*x;
end
end