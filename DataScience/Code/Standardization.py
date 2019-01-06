import numpy as np
import math
import matplotlib.pyplot as plt
#get_ipython().magic('matplotlib inline')

N = 100;

# Normal
mu = 40; sigma = 0.5;
x1 = np.random.normal(mu, sigma, N);
x1S = (x1-mu)/sigma;
print([np.mean(x1S), np.std(x1S)])

# Exponential
lmda = 10;
x2 = np.random.exponential(lmda, N);
x2S = (x2-lmda)/lmda;
print([np.mean(x2S), np.std(x2S)])

# Uniform
a = -2; b = 0;
x3 = np.random.uniform(b, a, N);
x3S = (x3-(b+a)/2)/((b-a)**2/12)**(1/2);
print([np.mean(x3S), np.std(x3S)])

y = np.ones(N, dtype=float);
fig, ax = plt.subplots(); ax.set_yticks([])
plt.plot(x1, y, '|r', x2, 2*y, '|g', x3, 3*y, '|b');
plt.show();

fig, ax = plt.subplots(); ax.set_yticks([])
plt.plot(x1S, y, '|r', x2S, 2*y, '|g', x3S, 3*y, '|b');
plt.show();
