P={x1,...,xM}; %Data Generated
S=0;
for m=1:M
    if (R(xm))
        S=S+g(xm);
end;
ret=S/M;
