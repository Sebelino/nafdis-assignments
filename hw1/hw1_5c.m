A = readImages('testbild_snapshots');

u = A(:,1);
v = ones(size(A,2),1);
diff = A-u*v';

disp(['Rank of u*v: ', num2str(rank(u*v'))])
disp(['||A-uv''||: ', num2str(norm(diff, 2))])