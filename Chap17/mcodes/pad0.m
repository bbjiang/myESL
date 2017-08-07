function b0 = pad0(b1, T, j)
r = size(T,1);
if j > r
    error('Index out of range!');
end

t = T(:,j);
t(j) = [];

b0 = b1;

for h = 1:length(t)
    if t(h) == 1
        b0(h) = 0;
    end
end