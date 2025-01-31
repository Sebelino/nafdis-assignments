A = readImages('testbild_snapshots');

% matrixRank == m == 27 because the probability
% of one vector (image) being a perfect linear
% combination of the rest of the images is
% practically zero.
matrixRank = rank(A);