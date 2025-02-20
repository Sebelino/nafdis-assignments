load 'hw3_zalando.mat';
p=size(items,2); % Nof items
% Filter to use
zz=[-14:-1, 1:14];
alpha=5;
filter=exp(-zz.^2/alpha).*zz;

n=28;  % size of each image
items_conv=zeros(size(items)); % Filtered images

P = eye(n^2);
P = [P(:,14+1:end),P(:,1:14)]; % Permutation matrix

tic;
for i=1:size(items,2) % Apply a one-dimensional filter
    X=reshape(items(:,i),n,n);
    Z=zeros(n,n);
    for j=1:n
        z=real(matvec_circulant(filter(:),X(:,j)));
        Z(:,j)=z;
    end
    %Z = P'*Z(:); % Shift the image so it doesn't look like crap
    items_conv(:,i)=Z(:);
end
toc;

I=kmeans(items_conv',2); % kmeans returns 1 or 2. But we don't know
                         % which one corresponds to 4 and 9. Try the best
guess1=(I==1)*4+(I==2)*9;
guess2=(I==1)*9+(I==2)*4;

if sum(guess1 ~= correct) < p/2
    guess = guess1;
else
    guess = guess2;
end

incorrectlyClassifiedIndices = find(guess ~= correct);
firstIncorrectlyClassifiedIndex = incorrectlyClassifiedIndices(1);
misclassifiedImagesCount = numel(incorrectlyClassifiedIndices);

disp(['Number of misclassified images: ', num2str(misclassifiedImagesCount)])
disp(['First misclassified image: ', num2str(firstIncorrectlyClassifiedIndex)])

f = figure('Visible','off','Units', 'pixels', 'Position', [0, 0, 400, 400]);
zalando_plot(items_conv(:,firstIncorrectlyClassifiedIndex))
exportgraphics(f,'hw3_4c.png');
f.Visible = 'on';