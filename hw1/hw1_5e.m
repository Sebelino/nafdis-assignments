A = readImages('testbild_snapshots');

tols = 1e4 * 2.^(0:3);

P=3; % number of samples

T1=zeros(length(tols),P);
T2=zeros(length(tols),P);
T3=zeros(length(tols),P);

for p=1:P
    for k=1:length(tols)
        tol=tols(k);

        % Method one
        tic
        svd(A,0);
        T1(k,p)=toc;

        % Method two
        tic
        svdapprox(A, tol);
        T2(k,p)=toc;

        % Method three
        tic
        svdapprox(A, tol, 'fro');
        T3(k,p)=toc;
    end
end

t1=mean(T1,2); % Plot the mean of the runs
t2=mean(T2,2);
t3=mean(T3,2);

disp(['Tolerance levels:       ', num2str(tols)])
disp(['Naive SVD:              ', num2str(t1')])
disp(['Approx SVD, Euclidean:  ', num2str(t2')])
disp(['Approx SVD, Frobenius:  ', num2str(t3')])

clf;
f = figure('Visible','off');
plot(tols,t1,tols,t2,tols,t3,'LineWidth',2);
set(gca, 'XScale', 'log');
legend('t1','t2','t3');
xlabel('tol');
ylabel('CPU time (s)');
saveas(f, [mfilename,'.png']);
f.Visible = 'on';