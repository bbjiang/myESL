function A = asbmat(A, a12, a22, j)
a = zeros(size(A,1),1);
r = 0;
for i = 1:size(A,1)
    if i ~= j
        r = r + 1;
        a(i) = a12(r);
    else
        a(i) = a22;
    end
end

A(:,j) = a;
A(j,:) = a';