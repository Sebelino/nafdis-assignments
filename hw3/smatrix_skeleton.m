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



%% Naive matrix vector multiplication

function b = matvec_naive(x, A)
n = size(A,1);
b=zeros(n,1);
for i=1:n
    for j=1:n
        b(i)=b(i)+A(i,j)*x(j);
    end
end

end

%% HODLR matrix vector multiplication

function b = matvec_hodlr(x, A, v, index_dict, child_dict)

n = size(A,1);
b=zeros(n,1);

node_keys=keys(index_dict);

for tau=1:length(node_keys);
    
    node_key=node_keys(tau);
    Itau=index_dict(node_key{1});
    if (~isKey(child_dict,node_key))
        b(Itau)=b(Itau)+A(Itau,?? )*x(??); % What goes here?
    else
        children=child_dict(node_key{1});
        
        child1=children(1,:);
        child2=children(2,:);
        Isigma1=index_dict(child1);
        Isigma2=index_dict(child2);
        
        block1_add=A(Isigma1,??)*x(Isigma2); % What goes here?
        block2_add=??*x(??);                 % What goes here?
        b(Itau)=b(Itau)+[block1_add;block2_add];
    end
end


end





