mu=3+zeros(1, 2); samples=10;
s1=1; s2=1; r=.8; sigma=[s1^2 s1*s2*r; s1*s2*r s2^2];
X=mvnrnd(mu, sigma, samples);
h=scatter(X(:,1),X(:,2),20,'*r'); hold on;

muhat=mean(X);
sigmahat=cov(X);
x=0:.1:10; y=muhat(1)+sigmahat(1, 2)/(sigmahat(2,2)) * (x-muhat(2));
plot(x, y, '-r', 'LineWidth', 2);

x=0:.1:10; y=mu(1)+sigma(1, 2)/(sigma(2,2)) * (x-mu(2));
plot(x, y, '-b', 'LineWidth', 2);

xlim([-1, 7]);
ylim([-1, 7]);
%%
delete(h)