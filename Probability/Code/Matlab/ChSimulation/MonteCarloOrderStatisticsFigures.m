figure1 = figure;
set(gcf, 'Units', 'inches');
haxes=axes('Parent', figure1, 'FontSize', 16);
hold all;

M=10000; n=1000; mu=0; sigma=1;
y=zeros([M,1]);
for m=1:M
    D=random('normal',mu,sigma,[n,1]);
    y(m)=max(D);
end;

[N, xout]=hist(y);
figure1=bar(xout', N'/(sum(N)*(xout(2)-xout(1))), 'barwidth', 1, 'facecolor', 'r');


M=10000; n=10; mu=0; sigma=1;
y=zeros([M,1]);
for m=1:M
    D=random('normal',mu,sigma,[n,1]);
    y(m)=max(D);
end;


[N, xout]=hist(y);
figure1=bar(xout', N'/(sum(N)*(xout(2)-xout(1))), 'barwidth', 1, 'facecolor', 'none', 'LineWidth', 3);

title('n = 10, 100')
