function KalmanFilterDemo()

% Specify system
% Discretize Newton dynamics of motion in 1D with random acceleration
% State vector is x = [p;v]
% x(k+1) = A*x(k) + B*w(k)
% y(k) = C*x(k) + v(k)
SimulationDuration = 5; % in seconds
T = 1e-2;               % sampling period in seconds
A = [1 T;0 1]; B = [T^2/2;T];
C = [1 0]; % Observable - measuring position
%C = [0 1];  % Nonobservable - measuring speed
vara = 1e0^2;
Q = B*vara*B'; R = (1e1)^2;
n = size(A,1); m = size(C,1); 
O = [C;C*A];
disp(['Size(O) = ',num2str(size(O,1)),'x',num2str(size(O,2))']),
disp(['Rank(O) = ',num2str(rank(O))]),
if size(O,2) == rank(O)
    disp('O is full column rank => System is observable.'),
else
    disp('O is not full column rank => System is not observable.'),
end

MaxIter = SimulationDuration/T;
t = [0:T:T*(MaxIter-1)];
w = zeros(n,MaxIter); v = zeros(m,MaxIter);
x = zeros(n,MaxIter); y = zeros(m,MaxIter); 
xhat = zeros(n,MaxIter);
x(:,1) = [1;0.1];
Pp = diag([(1e0)^2,(1e2)^2]);
xhatp = sqrt(Pp)*randn(2,1)+x(:,1);
for k = 1:MaxIter
    waitbar(k/MaxIter),
    w(:,k) = B*sqrt(vara)*randn; v(:,k) = sqrt(R)*randn;
    x(:,k+1) = A*x(:,k) + w(:,k); y(:,k) = C*x(:,k) + v(:,k);
    
    %Kalman Filter
    K = Pp*C'*inv(C*Pp*C'+R);
    xhat(:,k) = A*xhatp+K*(y(:,k)-C*xhatp);
    P = (eye(n)-K*C)*Pp;
    xhatp  = A*xhat(:,k); Pp = A*P*A'+Q;
end
figure(1), clf,
subplot(2,2,1),plot(t,x(1,1:end-1),'r'), xlabel('Time (s)'), ylabel('x_1(t) (m)'), title('Red: Actual, Blue: Estimated'),
subplot(2,2,2),plot(t,x(2,1:end-1),'r'), xlabel('Time (s)'), ylabel('x_2(t) (m/s)'), title('Red: Actual, Blue: Estimated'),
subplot(2,2,1),hold on, plot(t,xhat(1,:),'b'),
subplot(2,2,2),hold on, plot(t,xhat(2,:),'b'),
subplot(2,2,3),plot(t,x(1,1:end-1)-xhat(1,:),'g'), xlabel('Time (s)'), ylabel('e_1(t) (m)'),
subplot(2,2,4),plot(t,x(2,1:end-1)-xhat(2,:),'g'), xlabel('Time (s)'), ylabel('e_2(t) (m/s)'),

x(:,1)-xhat(:,1),
std(x(1,MaxIter-ceil(MaxIter/10)-1:MaxIter)-xhat(1,MaxIter-ceil(MaxIter/10)-1:MaxIter)),
sqrt(R),




