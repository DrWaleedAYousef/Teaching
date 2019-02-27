M=1000; n=100; mu=0; sigma=1;
y=zeros([M,1]);
for m=1:M
    D=random('normal',mu,sigma,[n,1]);
    y(m)=max(D);
end;