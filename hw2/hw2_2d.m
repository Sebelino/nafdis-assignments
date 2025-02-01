n0=5; p=3;
randn('seed',0);
c=3.1;
A1=randn(n0,p)+c*[1,0,0];
A2=randn(n0,p)+c*[0,1,0];
A3=randn(n0,p)+c*[0,0,1];
A4=[0,0,0];
A=[A1;A2;A3;A4];

Dist=zeros(size(A,1));
for i=1:size(A,1)
   for j=1:size(A,1)
       Dist(i,j)=norm(A(i,:)-A(j,:),2);
   end
end

ee = 2.8;

W=ones(size(Dist));
W(Dist>ee)=0; % Set too far away to
W(Dist==0)=0;  % Avoid an edge to itself

D=zeros(size(A,1));
for i=1:size(A,1)
    D(i,i)=sum(W(i,:));
end

n=size(W,1);
z=exp(((1:n)-1)*2i*pi/n);
clf;
subplot(2,1,1);
plot(z,'o','MarkerFaceColor','k'); % Plot all nodes
hold on;

for i=1:size(W,1)
   for j=1:size(W,1)
       if (W(i,j)>0)
            plot([z(i),z(j)],'k');   % Plot edges
       end
   end
end

L = D-W;

[V, D] = eig(L);

v2 = V(:,2);

subplot(2,1,2);

ax = gca; % Get current axes
ax.XTick = 1:1:16; % Set x-ticks with step size of 1
%ax.YTick = min(y):1:max(y); % Set y-ticks with step size of 1

ax.GridLineStyle = '-'; % Solid grid lines
ax.GridAlpha = 0.3; % Adjust grid transparency

scatter(1:16, v2, '*')
grid on;