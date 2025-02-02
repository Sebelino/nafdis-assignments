function D = makeDegreeMatrix(W)
n = size(W,1);
D=zeros(n);
for i=1:n
    D(i,i)=sum(W(i,:));
end
end