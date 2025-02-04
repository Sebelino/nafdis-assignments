A = readImages('testbild_snapshots');

u = A(:,1);
v = ones(size(A,2),1);
diff = A-u*v';

tol = norm(diff, 2); % From c)

[X,k] = svdapprox(A,tol); % From d)

[U,S,V] = svd(A,'econ');

U1 = U(:,1);
V1 = V(:,1);
S1 = S(1,1);
A1 = U1*S1*V1'; % From e)

disp(['||A-uv''|| = ', num2str(norm(diff, 2))])
disp(['||A-X|| = ', num2str(norm(A-X, 2))])
disp(['||A-A1|| = ', num2str(norm(A-A1, 2))])