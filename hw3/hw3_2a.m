fname = 'hw3_terrible_sound_with_hidden_message.ogg';

[y, Fs] = audioread(fname);
n = length(y);
yf = fft(y);
yfa = abs(yf);

annoyingIndices = find(yfa > 100);
%annoyingIndices = [
%    (17658:100:37658)' ;
%    67658 ;
 %   127660 ;
 %   (157660:100:177660)' ;
%];

yf2 = yf;
yf2(annoyingIndices) = 0;
yfa2 = abs(yf2);
y2 = ifft(yf2,'symmetric');

freqs = (0:n-1) * (Fs / n);

audiowrite('cleaned_audio.wav', y2, Fs);

f = figure('Visible','off','Units', 'pixels', 'Position', [0, 0, 800, 800]);
t = tiledlayout(2,2);
t.Padding = 'compact';
t.TileSpacing = 'compact';

nexttile;
plot(1:n, y);
xlabel('Audio sample index');
ylabel('Normalized amplitude');

nexttile;
plot(1:n, y2);
xlabel('Audio sample index');
ylabel('Normalized amplitude');

nexttile;
plot(freqs, yfa);
xlabel('Frequency (Hz)');
ylabel('Magnitude');

nexttile;
plot(freqs, yfa2);
xlabel('Frequency (Hz)');
ylabel('Magnitude');

exportgraphics(t,[mfilename,'.png']);
f.Visible = 'on';