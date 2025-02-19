% Compute a semiseparable matrix of size n times n
n=6000;
randn('seed',0);
v=randn(n,1);
D=diag(randn(n,1));
A=v*v'+D;
x=randn(n,1);

% Build a bisection tree
stopsize=8; % Do not subdivide intervals smaller than this.
% You may want to experiment with smaller or larger stopsize to
% improve performance
[index_dict,child_dict]=bisection_tree(1,n, stopsize);

display('Computed tree');

% HODLR matrix vector multiply
disp('HODLR')
tic
b1 = matvec_hodlr(x, A, v, index_dict, child_dict);
tt1=toc;

% Naive matrix vector multiply
disp('Naive')
tic
b2 = matvec_naive(x, A);
tt2=toc;

disp(['Timing HODLR: ' num2str(tt1)])
disp(['Timing naive: ' num2str(tt2)])

norm(b1-b2) % should be zero