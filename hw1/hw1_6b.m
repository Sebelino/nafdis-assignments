A = readImages('roundabout_snapshots');
[~,n] = size(A);

p = 20;
errs = [];
for k = 1:p
    disp(['Approximating with k=',num2str(k)])
    [Q,R,~] = gsceb(A, @greedyidx, k);
    B = Q*R;
    err = norm(A(:,1)-B(:,1),2);
    errs = [errs err];
end

f = figure('Visible','off');
semilogy(1:p, errs)
axis square;
xlabel('k')
ylabel('$||A(:,1) - (QR)(:,1)||$', 'Interpreter', 'latex')
saveas(f, [mfilename,'.png']);
f.Visible = 'on';