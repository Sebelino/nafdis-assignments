folder = 'misc/testbild_snapshots';
files = dir(fullfile(folder, '*.png'));
numSnapshots = numel(files);
firstImage = imread(fullfile(folder, files(1).name));
[height, width, ~] = size(firstImage);
n = height * width;
m = numSnapshots;
A = zeros(n, m);

% Populate matrix A
for i = 1:m
    % Read the image
    snapshot = imread(fullfile(folder, files(i).name));
    % Convert to grayscale if needed (optional, depends on task)
    snapshotGray = rgb2gray(snapshot);
    % Reshape the image into a column vector and store in A
    A(:, i) = double(snapshotGray(:));
    %A(:, i) = snapshot(:);
end

matrixRank = rank(A);

% c)

u = A(:,1);
v = ones(27,1);

diff = A-u*v';

% d)

tol = norm(diff, 2);

[X,k] = approxsvd(A,tol);

rank(X)

% e)

tic; svd(A,0) ; toc

tic; approxsvd(A,tol) ; toc

% f)

norm(A-X,2)