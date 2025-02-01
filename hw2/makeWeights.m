function W = makeWeights(Dist,ee)
W = ones(size(Dist));
W(Dist>ee) = 0;
W(Dist==0) = 0;
end