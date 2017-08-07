% Show Gibbs
%% Input data
y = [-0.39 0.12 0.94 1.67 1.76 2.44 3.72 4.28 4.92 5.53
    0.06 0.48 1.01 1.68 1.80 3.25 4.12 4.60 5.28 6.22];
y = y(:);
figure
hist(y, -0.25:0.5:6.25);
h = findobj(gca,'Type','patch');
set(h,'FaceColor','r','EdgeColor','w')

%% Gibbs Sampling
% Initialization
N = length(y);
u1 = 4.6;
u2 = 1.0;

% Set s1, s2 and pi at their MLE
s1 = 0.87;
s2 = 0.77;
pi = 0.546;
mu1 = 4.62; % for plotting only
mu2 = 1.06; % for plotting only

% Iteration
maxit = 1000;
U1 = zeros(maxit,1);
U2 = zeros(maxit,1);
D = zeros(maxit,1);

for t = 1:maxit
	ph1 = normpdf(y, u1, sqrt(s1)); % Density of Normal
    ph2 = normpdf(y, u2, sqrt(s2));
    v = pi*ph2./((1-pi)*ph1 + pi*ph2); % Eq. 8.42
    
    delta = binornd(ones(N,1), v); % Draw delta from Bernoulli
    D(t) = sum(delta)/N;
    
    hu1 = sum((1-delta).*y)/sum(1-delta); % hat(u1)
    hu2 = sum(delta.*y)/sum(delta); % hat(u2)
    
    u1 = normrnd(hu1, sqrt(s1)); % Draw u1 from Normal
    u2 = normrnd(hu2, sqrt(s2));
	U1(t) = max([u1 u2]);
    U2(t) = min([u1,u2]);
end

% Plotting
figure
subplot(1,2,1);
plot(1:maxit, U1', '-r');
axis square;
hold on;
plot(1:maxit, U2', '-b');
line([0 maxit],[mu1 mu1]);
line([0 maxit],[mu2 mu2]);
hold off;

subplot(1,2,2);
plot(1:maxit, D', '-m');
axis square;
hold on;
line([0 maxit],[pi pi]);
hold off;
