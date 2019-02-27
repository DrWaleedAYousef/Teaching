x=[];
x=[x; csvread('illinois60.txt')];
x=[x; csvread('illinois61.txt')];
x=[x; csvread('illinois62.txt')];
x=[x; csvread('illinois63.txt')];
x=[x; csvread('illinois64.txt')];

n=length(x) %will be 227
plot(x, zeros(length(x)), '.r')
[N, xout]=hist(x);
bar(xout, N/(n*(xout(2)-xout(1))), 'w'); %normalize
hold on;

mu1  = sum(x)/n          %.2244
mu2  = sum(x.^2)/n       %.1836
alpha= mu1^2/(mu2-mu1^2) %.3779
lmda = mu1/(mu2-mu1^2)   %1.6842 

z=0.05:.01:2;
y1=(lmda^alpha)/gamma(alpha) * z.^(alpha-1) .* exp(-lmda*z);
plot(z, y1, 'b', 'LineWidth', 2);

z=-2:.01:2;
y2=1/(sqrt(2*pi*(mu2-mu1^2))) *exp(-(z-mu1).^2 / (2*(mu2-mu1^2)));
plot(z, y2, 'r', 'LineWidth', 2);


