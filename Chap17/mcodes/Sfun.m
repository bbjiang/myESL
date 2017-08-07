function s = Sfun(x,t)
% Sfun is the soft-threhold operator
r = length(x);
xt = abs(x) - t;
for i = 1:r
    if xt(i) <= 0
        xt(i) = 0;
    end
end
s = sign(x)*xt;