function A = read_testbild
folder = 'misc/testbild_snapshots';
files = dir(fullfile(folder, '*.png'));
numSnapshots = numel(files);
firstImage = imread(fullfile(folder, files(1).name));
[height, width, ~] = size(firstImage);
n = height * width;
m = numSnapshots;
A = zeros(n, m);

for i = 1:m
    % Read the image
    snapshot = imread(fullfile(folder, files(i).name));
    % Convert to grayscale
    snapshotGray = rgb2gray(snapshot);
    % Reshape the image into a column vector
    A(:, i) = double(snapshotGray(:));
    %A(:, i) = snapshot(:);
end
end