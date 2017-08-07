function g = integral33(a,b,xi1,xi2)

g1 = 36*(a^3/3 - (xi1 + xi2)*a^2/2 + xi1*xi2*a);
g2 = 36*(b^3/3 - (xi1 + xi2)*b^2/2 + xi1*xi2*b);

g = g2 - g1;