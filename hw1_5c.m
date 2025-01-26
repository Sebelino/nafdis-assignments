A = read_testbild;

u = A(:,1);
v = ones(size(A,2),1);
diff = A-u*v';