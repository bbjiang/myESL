function W = wupdate(W,w12,j)
p = size(W,1);
W(j, [1:(j-1), (j+1):p]) = w12';
W([1:(j-1), (j+1):p], j) = w12;