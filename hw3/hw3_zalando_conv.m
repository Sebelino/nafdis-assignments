load 'hw3_zalando.mat';
% Filter to use
zz=[-14:-1, 1:14];
alpha=5;
filter=exp(-zz.^2/alpha).*zz;

n=28;  % size of each image
items_conv=zeros(size(items)); % Filtered images

for i=1:size(items,2) % Apply a one-dimensional filter
    X=reshape(items(:,i),n,n);
    Z=zeros(n,n);
    for j=1:n
        z=real(matvec_circulant(filter(:),X(:,j)));
        Z(:,j)=z;
    end
    items_conv(:,i)=Z(:);
end

I=kmeans(items_conv',2); % kmeans returns 1 or 2. But we don't know
                         % which one corresponds to 4 and 9. Try the best
guess1=(I==1)*4+(I==2)*9;
guess2=(I==1)*9+(I==2)*4;
% How many incorrectly classified images?
min(sum(guess1 ~= correct ), sum(guess2 ~= correct ))

incorrectlyClassifiedIndices = find(guess2 ~= correct);

firstIncorrectlyClassifiedIndex = 60;

%% Circulant matrix multiplication

function x=matvec_circulant(z,b)
    % Naive method
    C=toeplitz(z,[z(1);z(end:-1:2)]); % Create the circulant matrix
    x=C*b;
end
