fname = 'hw3_terrible_sound_with_hidden_message.ogg';

[y, Fs] = audioread(fname);

yf = fft(y);

n = length(yf);

freqs = (0:n-1) * (Fs / n);
noise_indices = 1:100:n;

yfa = abs(yf);

plot(freqs, yfa);

annoyingIndices = find(yfa > 100);

yf(annoyingIndices) = 0;

y2 = ifft(yf);

audiowrite('cleaned_audio.wav', y2, Fs);