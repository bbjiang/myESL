function [W,Q] = GraphLasso(S, lambda)
% Implementation of Algorithm 17.2 in ESL

% Initialization
p = size(S,1);
W = S + lambda*eye(p);
Q = zeros(p);

maxit = 1000;
for i = 1:maxit
    Wold = W;
    r = 0;
    W12 = zeros(p-1,p);
    B = W12;
    for j = 1:p
        % Step (a), Partition
        W11 = W;
        W11(:,j) = [];
        W11(j,:) = [];
        s12 = S(:,j);
        s12(j) = [];
        % Step (b), Solve beta
        b = Solvebeta(W11,s12,lambda);
        r = r + 1;
        B(:,r) = b;
        % Step (c), Update w12
        w12 = W11*b;
        W = wupdate(W,w12,j);
        W12(:,r) = w12;
    end
    % Check convergence
    if norm(Wold - W, 'fro') < 1e-8
        for k = 1:p
            Q(k,k) = 1/(W(k,k) - W12(:,k)'*B(:,k));
            q12 = -B(:,k)*Q(k,k);
            Q = wupdate(Q,q12,k);
        end
        break;
    end
end