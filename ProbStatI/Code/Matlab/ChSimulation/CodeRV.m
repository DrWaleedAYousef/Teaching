n=100; mu=0; sigma=1;
x = random('normal', mu, sigma, [n,1])
plot(x, zeros([length(x),1]), '.r');
