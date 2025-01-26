A = read_images('testbild_snapshots');

u = A(:,1);
v = ones(size(A,2),1);
diff = A-u*v';

tol = norm(diff, 2);

[X,k] = approxsvd(A,tol);

norm(A-X,2)