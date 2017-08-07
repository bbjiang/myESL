% Show EM
%% Input data
y = [-0.39 0.12 0.94 1.67 1.76 2.44 3.72 4.28 4.92 5.53
    0.06 0.48 1.01 1.68 1.80 3.25 4.12 4.60 5.28 6.22];
y = y(:);
figure
hist(y, -0.25:0.5:6.25);
h = findobj(gca,'Type','patch');
set(h,'FaceColor',[1 0 0],'EdgeColor','w')


%% EM iteration
% Initialization
N = length(y);
pi = 0.5;
rn = randi(20,2,1);
u1 = y(rn(1));
u2 = y(rn(2));
s1 = sum((y - mean(y)).^2)/N;
s2 = s1;

% Iteration
maxit = 100; % max iteration times
PI = zeros(maxit,1);
LLH = zeros(maxit,1);
r = 0;
for i = 1:maxit
    % E step
    ph1 = normpdf(y, u1, sqrt(s1));
    ph2 = normpdf(y, u2, sqrt(s2));
    v = pi*ph2./((1-pi)*ph1 + pi*ph2); % Eq. 8.42
    
    % M step
    u1 = sum((1-v).*y)/sum(1-v);
    u2 = sum(v.*y)/sum(v);
    s1 = sum((1-v).*(y-u1).^2)/sum(1-v);
    s2 = sum(v.*(y-u2).^2)/sum(v);
    pi = sum(v)/N;
    
    % Termination?
    PI(i) = pi;
    LLH(i) = sum(log((1-pi)*ph1 + pi*ph2));
    r = r + 1;
    if (i > 10 && norm(LLH(i-10) - LLH(i)) < 1e-8) || i == maxit
        S = ['Early terminated! The number of iteration is ',num2str(i)];
        disp(S);
        break;
    end
end
PI = PI(1:r);
LLH = LLH(1:r);

figure
subplot(1,2,1);
plot(1:length(PI), PI', '-ob');
axis square;
subplot(1,2,2);
plot(1:length(LLH), LLH', '-og');
axis square;