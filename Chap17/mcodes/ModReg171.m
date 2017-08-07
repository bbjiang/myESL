function [W,Q] = ModReg171(S,T)
% Version 2 of 17.1

p = size(S,1);
maxit = 1000;

W = S; % Initialization
Q = zeros(p,p); % Theta

for i = 1:maxit
    Wold = W;
    for j = 1:p
        [W11, s12, t] = parmat(W,S,T,j);
        [W11s, s12s] = dezeros(W11,s12,t,j);
        bs = W11s\s12s;
        b0 = padz(bs,t);
        w12 = W11*b0;
        W = wupdate(W,w12,j);
    end
    if norm(Wold - W, 'fro') < 1e-8
        disp('Terminated at iteration ',num2str(i))
        break;
    end
end

% Solve Theta
for j = 1:p
    [W11, s12, t] = parmat(W,S,T,j);
    [W11s, s12s] = dezeros(W11,s12,t,j);
    bs = W11s\s12s;
    b0 = padz(bs,t);
    w12 = W11*b0;
    q22 = 1/(S(j,j) - w12'*b0);
    q12 = -b0*q22;
    Q(j,j) = q22;
    Q = wupdate(Q,q12,j);
end