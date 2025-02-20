% Compute a semiseparable matrix of size n times n
n=6000;
randn('seed',0);
v=randn(n,1);
D=diag(randn(n,1));
A=v*v'+D;
x=randn(n,1);

idx = randi(size(A,1));

upperLeftBlock = A(1:3000, 1:3000);
upperRightBlock = A(1:3000, 3001:6000);

rank(lowerLeftBlock) % 1
rank(upperRightBlock) % 1

%idx = randi(6000); rank(A(idx+1:6000,1:idx))