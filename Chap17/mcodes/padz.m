function b0 = padz(bs,t)
b0 = zeros(length(t),1);

b0(t==0) = bs;