function H = hx(x,q)
% Convert 1d x into a matrix X using cubic spline
m = length(q);
N = length(x);
H = zeros(N, m + 4);

H(:,1) = ones(N,1);
H(:,2) = x;
H(:,3) = x.^2;
H(:,4) = x.^3;

for i = 5:(m+4)
    kx = x - q(i-4);
    for t = 1:N
        if kx(t) > 0
            H(t,i) = kx(t)^3;
        else
            H(t,i) = 0;
        end
    end
end
