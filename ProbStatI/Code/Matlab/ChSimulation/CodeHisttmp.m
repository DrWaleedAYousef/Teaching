n=1000000; mu=0; sigma=1;
x = random('normal', mu, sigma, [n,1]);

[N, xout]=hist(x, min(x):.01:max(x));
bar(xout', N'/(n*(xout(2)-xout(1))), 'barwidth', 1, 'facecolor', 'r');

hold on;

z=-4:.01:4;
y=1/(sqrt(2*pi*sigma)) *exp(-(z-mu).^2 / (2*(sigma^2)));
plot(z, y, 'k', 'LineWidth', 2);
