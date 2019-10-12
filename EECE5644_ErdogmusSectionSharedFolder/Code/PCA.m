clear all, close all,

n = 2; N = 1000;
mu = 100*ones(n,1); A = rand(n,n); Sigma = A*A';
x = A*randn(n,N)+mu*ones(1,N);

muhat = mean(x,2); Sigmahat = cov(x');
xzm = x - muhat*ones(1,N);
[Q,D] = eig(Sigmahat);
[d,ind] = sort(diag(D),'descend');
Q = Q(:,ind);
D = diag(d);
y = Q'*xzm;
z = D^(-1/2)*Q'*xzm;

figure(1), 
subplot(3,1,1),plot(x(1,:),x(2,:),'.b'); axis equal,
subplot(3,1,2),plot(y(1,:),y(2,:),'.r'); axis equal,
subplot(3,1,3),plot(z(1,:),z(2,:),'.k'); axis equal,

