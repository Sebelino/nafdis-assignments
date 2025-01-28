A = readImages('testbild_snapshots');

u = A(:,1);
v = ones(size(A,2),1);
diff = A-u*v';

tol = norm(diff, 2);

[X,k] = approxsvd(A,tol);

disp(['||A-X|| = ', num2str(norm(A-X, 2))])