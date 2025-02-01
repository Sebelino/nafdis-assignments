A = makeDataMatrix(2);
ee = 2.5;
Dist = makeDistances(A);
W = makeWeights(Dist,ee);

D=zeros(size(A,1));
for i=1:size(A,1)
    D(i,i)=sum(W(i,:));
end

L = D-W;

eig(L)