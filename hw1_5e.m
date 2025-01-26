A = readImages('testbild_snapshots');

u = A(:,1);
v = ones(size(A,2),1);
diff = A-u*v';

tol = norm(diff, 2);

tic; svd(A,0) ; toc

tic; approxsvd(A,tol) ; toc