figure; hold on;
%Change 'Normal' to 'Exp'

x=random('Normal', 0, 1, 1000, 10);
xbar=mean(x, 2);
s=std(x, 0, 2);
plot(xbar, s, '.r')

x=random('Normal', 0, 1, 1000, 100);
xbar=mean(x, 2);
s=std(x, 0, 2);
plot(xbar, s, '.b')
