function plotGraph(nodes,edges)
z = nodes;
W = edges;
plot(z,'o','MarkerFaceColor','k'); % Plot all nodes
hold on;
for i=1:size(W,1)
    for j=1:size(W,1)
        if (W(i,j)>0)
            plot([z(i),z(j)],'k');   % Plot edges
        end
    end
end
end