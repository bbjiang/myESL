function D = smoothterm(H,q)
m = length(q) + 4;
D = zeros(m,m);

d = zeros(m,1);
d(3) = 4;

a = min(H(:,2));
b = max(H(:,2));

d(4) = 12*(b^3 - a^3);
for i = 5:m
    d(i) = integral33(q(i-4),b,q(i-4),q(i-4));
end

q = [0 q];
for i = 3:(m-1)
    for j = (i+1):m
        if i == 3 && j == 4
            D(i,j) = 6*(b^2 - a^2);
        elseif i == 3 && j > 4
            dd1 = 12*(q(j-3)^2/2 - q(j-3)*q(j-3));
            dd2 = 12*(b^2/2 - q(j-3)*b);
            D(i,j) = dd2 - dd1;
        else
            D(i,j) = integral33(max(q(i-3),q(j-3)), b, q(i-3), q(j-3));
        end
    end
end

D = D + D' + diag(d);