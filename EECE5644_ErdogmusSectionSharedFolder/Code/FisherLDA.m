clear all, close all,

n = 2; 
N1 = 40; mu1 = -1*ones(n,1); A1 = rand(n,n); %S1 = A*A';
N2 = 28; mu2 = 1*ones(n,1); A2 = rand(n,n);
x1 = A1*randn(n,N1)+mu1*ones(1,N1);
x2 = A2*randn(n,N2)+mu2*ones(1,N2);

mu1hat = mean(x1,2); S1hat = cov(x1');
mu2hat = mean(x2,2); S2hat = cov(x2');

Sb = (mu1hat-mu2hat)*(mu1hat-mu2hat)';
Sw = S1hat + S2hat;

[V,D] = eig(inv(Sw)*Sb);
[~,ind] = sort(diag(D),'descend');
w = V(:,ind(1)); % Fisher LDA projection vector

y1 = w'*x1;
y2 = w'*x2;

figure(1),

subplot(2,1,1), 
plot(x1(1,:),x1(2,:),'r*');
hold on;
plot(x2(1,:),x2(2,:),'bo');
axis equal,

subplot(2,1,2), 
plot(y1(1,:),zeros(1,N1),'r*');
hold on;
plot(y2(1,:),zeros(1,N2),'bo');
axis equal,






