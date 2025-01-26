function A = readImages(folder)
path = ['misc/',folder];
files = dir(fullfile(path, '*.png'));
numSnapshots = numel(files);
firstImage = imread(fullfile(path, files(1).name));
[height, width, ~] = size(firstImage);
n = height * width;
m = numSnapshots;
A = zeros(3*n, m); % Each color channel: R, G, B

for i = 1:m
    % Read the image
    snapshot = imread(fullfile(path, files(i).name));
    % Convert to grayscale
    %snapshotGray = rgb2gray(snapshot);
    % Reshape the image into a column vector
    %A(:, i) = double(snapshotGray(:));
    A(:, i) = snapshot(:);
end
end