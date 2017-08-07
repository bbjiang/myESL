function [W11, s12, t] = parmat(W, S, T, j)
r = size(W,1);
if j > r
    error('Index out of range!');
end

% s22 = S(j,j);

s12 = S(:,j);
s12(j) = [];

W11 = W;
W11(j,:) = [];
W11(:,j) = [];

t = T(:,j);
t(j) = [];