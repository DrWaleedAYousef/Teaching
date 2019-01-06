f1(x1,x2,x3) = x1+2*x2+3*x3
f2(x1,x2,x3) = x1+x2-4*x3
P1=implicit_plot3d(f1==0,(x1,-3,3), (x2,-3,3), (x3,-3,3), color="blue", alpha=0.1)
P2=implicit_plot3d(f2==0,(x1,-3,3), (x2,-3,3), (x3,-3,3), color="red", mesh=True, alpha=0.1)
L1=line( [ (0, 0, 0), (1, 2, 3) ], color="blue", thickness=2 )
L2=line( [ (0, 0, 0), (1, 1, -4) ], color="red", thickness=2)

show(P1+P2+L1+L2, figsize=4)
