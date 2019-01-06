mu=3+zeros(1, 2); samples=100;
s1=1; s2=1; r=.8; sigma=[s1^2 s1*s2*r; s1*s2*r s2^2];
X=mvnrnd(mu, sigma, samples);
scatter(X(:,1),X(:,2),20,'*r'); hold on

x=0:.1:10; y=mu(1)+sigma(1, 2)/(sigma(2,2)) * (x-mu(2));
plot(x, y, '-', 'LineWidth', 3);

set(gcf, 'Units', 'inches'); set(gcf, 'position', [1, 1, 4, 4]);