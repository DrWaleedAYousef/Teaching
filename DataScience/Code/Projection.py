import numpy as np
import math
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
import scipy as sp

## Setup
N = 100;

mu = np.array([0,2,2]);
sigma = np.array([
    [1,0,0],
    [0,2,0],
    [0,0,0.1]
])
Y = np.random.multivariate_normal(mu, sigma, N);

Y2 = Y - mu;
theta = np.radians(30)
rotmat = np.array([[np.cos(theta), -np.sin(theta)], [np.sin(theta), -np.cos(theta)]])

Y2[:, 1:3] = np.dot(Y2[:, 1:3], rotmat).copy()
Y2 = Y2 + mu;

v = np.array([0, np.sin(theta), np.cos(theta)])
X = np.linalg.svd(v.reshape(3,1))[0][:,1:3]

proj = np.dot(np.dot(X, X.T), Y2.T).T

## Plotting
fig = plt.figure()
ax = Axes3D(fig)
ax.set_xlabel('X_1'); ax.set_ylabel('X_2'); ax.set_zlabel('X_3');
tmp = 4; ax.set_xlim3d(left=-tmp, right=tmp); ax.set_ylim3d(bottom=-tmp, top=tmp); ax.set_zlim3d(bottom=0, top=tmp);

ax.scatter(Y2[:,0],Y2[:,1],Y2[:,2], c=[1,0,0], s=2)
ax.scatter([0], [0], [0], c=[0,0,0], s = 10)
ax.plot([0, X[0,0]], [0,X[1,0]], [0, X[2,0]], c=[0,0,0])
ax.plot([0, X[0,1]], [0,X[1,1]], [0, X[2,1]], c=[0,0,0])
ax.plot([0, v[0]], [0,v[1]], [0, v[2]], c=[0,0,0])
ax.scatter(Y2[:,0], Y2[:,1], np.zeros_like(Y2[:,2]), c=[0,1,0], s=2)

ax.scatter(proj[:,0],proj[:,1],proj[:,2], c=[0, 0, 1], s=2)

for i in range(0,N):
    ax.plot([proj[i,0], Y2[i,0]], [proj[i,1],Y2[i,1]], [proj[i,2], Y2[i,2]], c=[0,0,0], linewidth=.125)

xx, yy = np.meshgrid(range(-4,4), range(-4,4))
z = (-v[0] * xx - v[1] * yy) * 1. /v[2]
ax.plot_surface(xx,yy,z, alpha=0.25, shade=True)

plt.show()

## Show the Multinormal dist
fig = plt.figure()
ax = Axes3D(fig)
ax.set_xlabel('X_1'); ax.set_ylabel('X_2'); ax.set_zlabel('X_3');
tmp = 4; ax.set_xlim3d(left=-tmp, right=tmp); ax.set_ylim3d(bottom=-tmp, top=tmp); ax.set_zlim3d(bottom=0, top=tmp);

ax.scatter(Y[:,0],Y[:,1],Y[:,2], c=[1, 0, 0], s=2)
plt.show()
######################NOT NEEDED##################

# X1 = [0, 1, -v[1]/v[2]]; #X1 = X1/np.linalg.norm(X1)
# X2 = [0, -v[2]/v[1], 1]; #X2 = X2/np.linalg.norm(X2)
# tmp = np.hstack((X1.reshape(3,1), X2.reshape(3,1)))
# X = np.linalg.qr(tmp)[0]


