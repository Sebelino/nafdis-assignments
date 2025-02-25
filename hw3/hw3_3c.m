ns = [1000,1500,2000,4000,8000];
randn('seed',0);

for n = ns
    v=randn(n,1);
    D=diag(randn(n,1));
    A=v*v'+D;
    x=randn(n,1);

    stopsize=8;
    [index_dict,child_dict]=bisection_tree(1,n, stopsize);

    f_naive = @(x) matvec_naive(x, A);
    f_smat = @(x) matvec_hodlr(x, A, v, index_dict, child_dict);

    tic; [V,D]=eigs(f_naive,n,3,'sr'); t1 = toc;
    tic; [V,D]=eigs(f_smat,n,3,'sr'); t2 = toc;
    disp(['For n=', num2str(n), ', t1=', num2str(t1), ', t2=', num2str(t2)]);
end