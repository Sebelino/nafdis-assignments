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

L = D-W;
[V, D] = eig(L);
v2 = V(:,2);

f = figure('Visible','off','Units', 'pixels', 'Position', [0,0,400,800]);
t = tiledlayout(2,1);
t.Padding = 'compact';
t.TileSpacing = 'compact';
nexttile;
plotGraph(z,W);

nexttile;
ax = gca; % Get current axes
ax.XTick = 1:1:16; % Set x-ticks with step size of 1
ax.GridLineStyle = '-'; % Solid grid lines
ax.GridAlpha = 0.3; % Adjust grid transparency

scatter(1:16, v2, '*')
grid on;
xlabel('i')
ylabel('v2(i)')

saveas(f, [mfilename,'.png']);
f.Visible = 'on';