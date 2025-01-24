A = load_mat_hw1(1000,100);

[Q,R] = gsce(A, @greedyidx);

[Uhat,S,V] = svd(R);

rank(S)