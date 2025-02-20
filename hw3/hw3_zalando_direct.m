load 'hw3_zalando.mat';
p=size(items,2); % Nof items
% The data contains exactly
%   p/2 images of item category 4 and
%   p/2 images of item category 9

I=kmeans(items',2); % kmeans returns 1 or 2. But we don't know
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
zalando_plot(items(:,firstIncorrectlyClassifiedIndex))
exportgraphics(f,'hw3_4b.png');
f.Visible = 'on';