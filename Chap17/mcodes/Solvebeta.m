function b = Solvebeta(W11,s12,lambda)
% Solve beta using Cyclical coordinate-descent algorithm (17.26)
p1 = size(W11,1);
b = zeros(p1,1);
maxit = p1*500;

for c = 1:maxit
    bold = b;
    for j = 1:p1
        vb = 0;
        for k = 1:p1
            if k ~= j
                vb = vb + W11(k,j)*b(k);
            end
        end
        b(j) = Sfun(s12(j) - vb, lambda)/W11(j,j);
    end
    % Check convergence
    if norm(b - bold) < 1e-8
        break;
    end
end