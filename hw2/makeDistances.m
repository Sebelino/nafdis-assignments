function Dist = makeDistances(A)
Dist=zeros(size(A,1));
for i=1:size(A,1)
    for j=1:size(A,1)
        Dist(i,j)=norm(A(i,:)-A(j,:),2);
    end
end
end