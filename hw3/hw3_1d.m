p = 12;

sampleCount = 3;
T1=zeros(p,sampleCount);
T2=zeros(p,sampleCount);
T3=zeros(p,sampleCount);

for s = 1:sampleCount
    for j = 1:p
        b = rand(2.^(j),1);
        Fn = dftMatrix(numel(b));

        tic;
        Fn*b;
        T1(j,s) = toc;

        tic;
        fftx(b);
        T2(j,s) = toc;

        tic;
        fftx2(b);
        T3(j,s) = toc;
    end
end

t1 = mean(T1,2);
t2 = mean(T2,2);
t3 = mean(T3,2);

clf;
plot(2.^(1:p),t1,2.^(1:p),t2,2.^(1:p),t3);
legend('naive','FFT', 'FFT Improved');
xlabel('n');
ylabel('CPU time');