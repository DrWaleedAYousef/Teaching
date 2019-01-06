%% Illustration of Lemma 57
p = 3;
A=rand(p,p);
B=rand(p,p);
for i=1:p 
    for j=i:p
        if (i==j)
            B(i,i)=1/A(i,i);
        else
            A(i,j)=0;
            B(i,j)=0;
        end
    end
end
A
B
C = A*B

%%
