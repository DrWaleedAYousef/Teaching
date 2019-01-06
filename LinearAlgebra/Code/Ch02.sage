### Illustration of Lemma 57
import random
p=4
A = n(random_matrix(RR, p), 10)
B = n(random_matrix(RR, p), 10)
# The following is nested loops over i <= j
for i in range(0,p):
    for j in range(i,p):
        if (i == j):
            B[i,i] = 1/A[i,i]
        else:
           A[i,j]=0
           B[i,j]=0

print A, '\n'
print B, '\n'
print A*B

### Illustration of Lemma 58
import random
p=5
I=2
J=1
A = N(random_matrix(RR, p), 2)
B = N(random_matrix(RR, p),2)

for i in range(0,p):
    for j in range(i,p):
        if (i == j):
            B[i,i] = 1
            A[i,i] = 1
        else:
           A[i,j]=0
           B[i,j]=0

for j in range(J+1,p):
    for i in range(j+1,p):
        A[i,j]=0
for i in range(I+1, p):
    A[i,J]=0

for j in range(0,J):
    for i in range(j+1,p):
        B[i,j]=0
for i in range(J+1, I+1):
    B[i,J]=0

print A, '\n'
print B, '\n'
print A*B

### Solving Linear Equations
A = Matrix([[2, 4, -2],[4, 9, -3],[-2, -3, 7]])
Y = vector([2, 8, 10])
X = A.solve_right(Y)
print A, '\n'
print Y, '\n'
print X


### LU factorization
## pivot='nonzero' to ensure no partial pivoting
A = Matrix([[2, 4, -2],[4, 9, -3],[-2, -3, 7]])
A.LU(pivot='nonzero')
## pivoting: A=PLU

