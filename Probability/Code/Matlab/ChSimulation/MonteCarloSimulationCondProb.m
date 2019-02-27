P={x1,...,xM}; %Data Generated
S=0; Mprim=0;
for m=1:M
    if (e(xm))
        Mprim=Mprim+1;
        if (R(xm))
            S=S+g(xm);
        end;
    end;
end;
ret=S/Mprim;
