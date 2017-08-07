% Ex 8.6
%% Load data set
clc;
clear;
load('bone.mat');

%% Question (a)
[beta, yh, H] = CubicSmoothSpline(x,y,1e-7);
xx = min(x):0.01:max(x);
q = quantile(x,3);
hh = hx(xx,q);
yy = hh*beta;

% Banding
s2 = sum((y - yh).^2)/length(y);
se = zeros(length(yy),1);
HH = H'*H;
for t = 1:length(yy)
    tse = HH\(hh(t,:))';
    se(t) = hh(t,:)*tse;
    se(t) = sqrt(se(t))*sqrt(s2);
    se(t) = 1.96*se(t);
end

figure;
plot(x,y,'r.');
hold on;
plot(xx,yy,'b-');
plot(xx,yy+se,':k');
plot(xx,yy-se,':k');
title('Cubic Smooth Spline');
hold off;
%%
% Cross Validation: 10 fold
% Split the data set
N = length(x);
sp = randperm(N);
S = zeros(50,10);
for i = 1:N
    S(i) = sp(i);
end
% Cross validation
lambda = 1e-8;
maxit = 15;
L = zeros(maxit,1);
RN = zeros(maxit,1);
RT = zeros(maxit,1);
q = quantile(x,3);
for i = 1:maxit
    ern = 0;
    ert = 0;
    L(i) = lambda;
    for k = 1:10
        t = S(:,k);
        t = t(t>0);
        S1 = S;
        S1(:,k) = [];
        n = S1(:);
        n = n(n>0);
        
        [beta,yh,~] = CubicSmoothSpline(x(n),y(n),lambda);
        ern = ern + norm(y(n) - yh)/length(n);
        ert = ert + norm(y(t) - hx(x(t),q)*beta)/length(t);
    end
    lambda = lambda*10;
    RN(i) = ern;
    RT(i) = ert;
end
% figure;
% plot(log10(L),log10(RN),'-b');
% hold on;
% plot(log10(L),log10(RT),'-r');
% hold off;

%% Question (b)
tau = 10;
Sig = eye(7);
A = HH + s2/tau*Sig;
b = H'*y;
eb = A\b;
cb = A\eye(7)*s2;

dr = 20;
bb = mvnrnd(eb,cb,dr);
figure;
plot(x,y,'r.');
hold on;
for w = 1:dr
    plot(xx, hh*bb(w,:)','-g');
end
title('Bayesian Methods');
hold off;

%% Question (c)
bsn = 100;
nn = length(y);
BE = zeros(7,bsn);
nnx = length(xx);
Y = zeros(nnx,bsn);
for c = 1:bsn
    d = randsample(nn,nn,true);
    bx = x(d);
    by = y(d);
    [BE(:,c),~,~] = CubicSmoothSpline(bx,by,100);
    Y(:,c) = hh*BE(:,c);
end

% Banding by Bootstrap
yu = zeros(nnx,1);
yl = zeros(nnx,1);
ym = zeros(nnx,1);
for f = 1:nnx
    ty = sort(Y(f,:));
    yl(f) = ty(5);
    yu(f) = ty(95);
    ym(f) = mean(ty);
end

figure;
plot(x,y,'r.');
hold on;
plot(xx,yy,'b-');
plot(xx,ym,'k-');
plot(xx,yu,':c');
plot(xx,yl,':c');
title('Bootstrap');
hold off;