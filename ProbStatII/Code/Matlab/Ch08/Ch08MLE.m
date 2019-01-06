theta0=10; theta = (0:.01:50)';
C = 1000;
ltheta = zeros(length(theta), C);

figure1 = figure;
set(gcf, 'Units', 'inches');
haxes=axes('Parent',figure1,'YLim',[-40 0],'XLim',[0 50],'FontSize',20);
hold all;

n=10;
for c=1:C
    x=random('Poisson',theta0,[n,1]);
    ltheta(:, c)=mean(x)*log(theta)-theta-sum(log(factorial(x)))/n;
    plot(theta, ltheta(:, c), 'b');
end;

n=1;
for c=1:C
    x=random('Poisson',theta0,[n,1]);
    ltheta(:, c)=x*log(theta)-theta-sum(log(factorial(x)));
    plot(theta, ltheta(:, c), 'r');
end;
plot(theta, mean(ltheta, 2), 'r--', 'LineWidth', 4);   