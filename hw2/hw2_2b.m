A = makeDataMatrix(2);
ee = 2.5;

Dist=zeros(size(A,1));
for i=1:size(A,1)
   for j=1:size(A,1)
       Dist(i,j)=norm(A(i,:)-A(j,:),2);
   end
end

W=ones(size(Dist));
W(Dist>ee)=0; % Set too far away to
W(Dist==0)=0;  % Avoid an edge to itself

D=zeros(size(A,1));
for i=1:size(A,1)
    D(i,i)=sum(W(i,:));
end

L = D-W;

eig(L)