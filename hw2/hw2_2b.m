A = makeDataMatrix(2);
ee = 2.5;
Dist = makeDistances(A);
W = makeWeights(Dist,ee);
D = makeDegreeMatrix(W);

L = D-W;

eig(L)