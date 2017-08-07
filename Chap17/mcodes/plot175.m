function plot175(Q)
% Plotting Figure 17.5
p = size(Q,1);
r = 10;

ia = 2*pi/p;
a = 0:ia:(2*pi);
a = a + pi/2;
x = r*cos(a');
y = r*sin(a');

plot(x,y,'bo');
axis square;
hold on;

E = triu(Q,1);
for i = 1:(p-1)
    for j = (i+1):p
        if E(i,j) ~= 0
            line([x(i) x(j)],[y(i) y(j)]);
        end
    end
end
hold off;