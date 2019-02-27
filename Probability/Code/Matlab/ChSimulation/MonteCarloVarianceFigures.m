figure1 = figure;
set(gcf, 'Units', 'inches');
haxes=axes('Parent', figure1, 'XLim', [-.15 .15], 'YLim', [0 41], 'FontSize', 16);
hold all;

%%
M=10000; mu=0; sigma=1; K=100;
muhat=zeros([K,1]);
for k=1:K %repeating MC
    D=random('normal',mu,sigma,[M,1]);
    muhat(k)=mean(D);
end;

[N, xout]=hist(muhat);
figure1=bar(xout', N'/(sum(N)*(xout(2)-xout(1))), 'barwidth', 1, 'facecolor', 'r');

%%
M=1000; mu=0; sigma=1; K=100;
muhat=zeros([K,1]);
for k=1:K %repeating MC
    D=random('normal',mu,sigma,[M,1]);
    muhat(k)=mean(D);
end;

[N, xout]=hist(muhat);
figure1=bar(xout', N'/(sum(N)*(xout(2)-xout(1))), 'barwidth', 1, 'facecolor', 'none', 'LineWidth', 3);

title('M = 1000, 10,000 trials')
