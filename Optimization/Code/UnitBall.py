import numpy as np
import math
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
import scipy as sp

## radious and p norms
L = 1
plist = [0.5, 1, 1.5, 2, 3, 8]

## preparing matrix A
v1 = np.array([2,1]); v1 = v1.reshape(2,1)/np.linalg.norm(v1)
v2 = np.array([-1,2]); v2 = v2.reshape(2,1)/np.linalg.norm(v2)
l1= 2; l2= 1
A = l1*np.outer(v1,v1.T) + l2*np.outer(v2,v2.T)

## preparing figures and subplots
fig, axs = plt.subplots(2,len(plist), figsize=(12, 4), facecolor='w', edgecolor='k')
fig.subplots_adjust(hspace = 0, wspace=.1)
x = np.linspace(-L,L, 100)

for j in range(len(plist)):
    p = plist[j]
    y = (L**p-np.abs(x)**p)**(1/p)
    tmp = np.block([ [x, x[::-1]],
                      [y, -y[::-1]]])
    T = tmp
    axs[0,j].plot(T[0,:], T[1,:],'b')
    axs[0,j].set_title('p = '+str(plist[j]))
    axs[1,j].plot(T[0,:], T[1,:],'b')
    T = np.matmul(A, tmp)
    axs[1,j].plot(T[0,:], T[1,:],'r')
    axs[1,j].plot([0,2.5*v1[0]], [0,2.5*v1[1]], '--k', [0,2.5*v2[0]], [0,2.5*v2[1]], '--k')
    axs[1,j].plot(T[0,:], T[1,:],'r')
    for i in range(2):
        axs[i,j].set_aspect(1)
        axs[i,j].set_xlim([-2.5*L,2.5*L])
        axs[i,j].set_ylim([-2.5*L,2.5*L])

plt.tight_layout()
plt.savefig('UnitBall.png')
plt.show()
