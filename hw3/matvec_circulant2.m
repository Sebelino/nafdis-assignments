function x=matvec_circulant2(z,b)
    zf = fft(z);
    bf = fft(b);
    xf = diag(zf)*bf;
    x = ifft(xf);
end
