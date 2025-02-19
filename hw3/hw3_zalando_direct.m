load 'hw3_zalando.mat';
p=size(items,2); % Nof items
% The data contains exactly
%   p/2 images of item category 4 and
%   p/2 images of item category 9


I=kmeans(items',2); % kmeans returns 1 or 2. But we don't know
                    % which one corresponds to 4 and 9. Try the best
guess1=(I==1)*4+(I==2)*9;
guess2=(I==1)*9+(I==2)*4;
% How many incorrectly classified images?
min(sum(guess1 ~= correct ), sum(guess2 ~= correct ))

incorrectlyClassifiedIndices = find(guess2 ~= correct);

firstIncorrectlyClassifiedIndex = 14;

zalando_plot(items(:,firstIncorrectlyClassifiedIndex))

