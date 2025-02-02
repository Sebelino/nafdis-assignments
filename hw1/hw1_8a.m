load('zalando_items.mat');
A = item5;

[m,n] = size(A);
[U,S,V] = svd(A);
maxk = 30;

errsSvd = [];
errsId = [];

for k = 1:maxk
    Atilde = U(:,1:k)*S(1:k,1:k)*V(1:n,1:k)';
    errSvd = norm(A-Atilde,2) / norm(A,2);
    errsSvd = [errsSvd errSvd];
    [C,Z] = ID_col(A,k);
    errId = norm(A-C*Z,2) / norm(A,2);
    errsId = [errsId errId];
end

svdRank = find(errsSvd <= 0.25, 1);
idRank = find(errsId <= 0.25, 1);

disp(['Randomized SVD rank: ', num2str(svdRank)])
disp(['ID rank:             ', num2str(idRank)])

f = figure('Visible','off');
semilogy(1:maxk, errsSvd, 'DisplayName', 'SVD');
hold on;
yline(0.25, '--r', 'LineWidth', 1.5, 'DisplayName', 'y = 0.25');
semilogy(1:maxk, errsId, 'DisplayName', 'ID');
axis square;
xlabel('Rank k')
ylabel('Relative error', 'Interpreter', 'latex')
legend show;
saveas(f, [mfilename,'.png']);
f.Visible = 'on';