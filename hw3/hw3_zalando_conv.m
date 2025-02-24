load 'hw3_zalando.mat';
p=size(items,2); % Nof items
% Filter to use
zz=[-14:-1, 1:14];
alpha=5;
filter=exp(-zz.^2/alpha).*zz;

% Optional: shift the image so it doesn't look like crap
%filter = [filter(n/2+1:end),filter(1:n/2)]

n=28;  % size of each image
items_conv=zeros(size(items)); % Filtered images

tic;
for i=1:size(items,2) % Apply a one-dimensional filter
    X=reshape(items(:,i),n,n);
    Z=zeros(n,n);
    for j=1:n
        z=real(matvec_circulant(filter(:),X(:,j)));
        Z(:,j)=z;
    end
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
t = tiledlayout(1,2);
t.Padding = 'compact';
t.TileSpacing = 'compact';

nexttile;
zalando_plot(items(:,firstIncorrectlyClassifiedIndex))
nexttile;
zalando_plot(items_conv(:,firstIncorrectlyClassifiedIndex))
exportgraphics(f,'hw3_4c.png');
f.Visible = 'on';