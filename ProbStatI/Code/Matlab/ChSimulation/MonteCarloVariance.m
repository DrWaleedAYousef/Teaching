M=1000; mu=0; sigma=1; K=100;
muhat=zeros([1,K]);
for k=1:K %repeating MC
    P=random('normal',mu,sigma,[M,1]);
    S=0;
    for m=1:M
        S=S+P(m);
    end;
    muhat(k)=S/M;
end;
%Shorter:
P=random('normal',mu,sigma,[M,K]);
muhat=mean(P,1);
