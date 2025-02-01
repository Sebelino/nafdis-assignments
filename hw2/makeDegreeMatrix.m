function D = makeDegreeMatrix(A,W)
D=zeros(size(A,1));
for i=1:size(A,1)
    D(i,i)=sum(W(i,:));
end
end