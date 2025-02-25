fname = 'hw3_terrible_sound_with_hidden_message.ogg';

[y, Fs] = audioread(fname);

p = 15;
n = 2^p; % cannot exceed 2^16
y = y(1:n);

tic;
Fn = dftMatrix(n);
yf = Fn * y;
freqs = (0:n-1) * (Fs / n);
noise_indices = 1:100:n;
yfa = abs(yf);
annoyingIndices = find(yfa > 100);
yf(annoyingIndices) = 0;
y2 = 1/n * inv(Fn) * yf;
t1 = toc;

tic;
yft = fft(y);
yfta = abs(yft);
annoyingIndicesfft = find(yfta > 100);
yf2 = yft;
yf2(annoyingIndices) = 0;
yfa2 = abs(yf2);
yft2 = ifft(yf2,'symmetric');
t2 = toc;

disp(['Size: n = 2^', num2str(p)]);
disp(['Elapsed time for Naive DFT : ', num2str(t1/60), ' minutes']);
disp(['Elapsed time for FFT : ', num2str(t2/60), ' minutes']);