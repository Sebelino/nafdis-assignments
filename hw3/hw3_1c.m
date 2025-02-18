p = 12;

sampleCount = 3;
T1=zeros(p,sampleCount);
T2=zeros(p,sampleCount);

for s = 1:sampleCount
    for j = 1:p
        b = rand(2.^j,1);
        Fn = dftMatrix(numel(b));

        tic;
        Fn*b;
        T1(j,s) = toc;

        tic;
        fftx(b);
        T2(j,s) = toc;
    end
end

t1 = mean(T1,2);
t2 = mean(T2,2);

clf;
plot(2.^(1:p),t1,2.^(1:p),t2);
legend('naive','FFT');
xlabel('n');
ylabel('CPU time');