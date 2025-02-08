function D = buildDistance(items, w)
n = size(items,2);
D = zeros(n);
for i = 1:n
    for j = 1:n
        D(i,j) = norm(w.*(items(:,i)-items(:,j)),2);
    end
end
end