function w_weight = crazyWeight
x = 2;
W_weight = ones(28,28);
W_weight(12:16,:) = x;
w_weight = W_weight(:);
w_weight = w_weight/norm(w_weight);
end