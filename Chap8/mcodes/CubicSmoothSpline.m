function [beta,yh,H] = CubicSmoothSpline(x,y,lambda)
% Fit a cubic smooth spline to x and y
% where x is one-dimensional.

% Determine quantiles
q = quantile(x,3); % select three quantiles: 25%, 50% and 75%

H = hx(x,q);
D = smoothterm(H,q);
beta = (H'*H + lambda*D)\(H'*y);
yh = H*beta;