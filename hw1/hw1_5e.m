A = readImages('testbild_snapshots');

u = A(:,1);
v = ones(size(A,2),1);
diff = A-u*v';

tol = norm(diff, 2);

%tols=[0.5*tol,tol,tol*2,tol*4,tol*8];
tols = 1e4 * (1:4);

P=3; % number of samples

T1=zeros(length(tols),P);
T2=zeros(length(tols),P);

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
    end
end

t1=mean(T1,2); % Plot the mean of the runs
t2=mean(T2,2);

disp(['Tolerance levels: ', num2str(tols)])
disp(['Naive SVD:        ', num2str(t1')])
disp(['Partial SVD:      ', num2str(t2')])

clf;
f = figure('Visible','off');
plot(tols,t1,tols,t2);
set(gca, 'XScale', 'log');
legend('t1','t2');
xlabel('tol');
ylabel('CPU time (s)');
saveas(f, [mfilename,'.png']);
f.Visible = 'on';