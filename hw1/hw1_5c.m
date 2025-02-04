A = readImages('testbild_snapshots');

u = A(:,1);
v = ones(size(A,2),1);
diff = A-u*v';
relative_error = norm(diff, 2)/norm(A,2);

disp(['Rank of u*v'': ', num2str(rank(u*v'))])
disp(['||A-uv''||: ', num2str(norm(diff, 2))])
disp(['Relative error of ||A-uv''||/||A||: ', num2str(relative_error)])