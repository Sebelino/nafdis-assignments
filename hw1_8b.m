load('zalando_items.mat');
A = item3;

[U,S,V] = svd(A);
[C,Z] = ID_col(A,784);

zalando_plot(C(:,1));