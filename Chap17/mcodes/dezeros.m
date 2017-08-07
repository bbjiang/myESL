function [W11s,s12s] = dezeros(W11,s12,t,j)

W11s = W11;
s12s = s12;

ix = t > 0;

W11s(ix,:) = [];
W11s(:,ix) = [];

s12s(ix) = [];