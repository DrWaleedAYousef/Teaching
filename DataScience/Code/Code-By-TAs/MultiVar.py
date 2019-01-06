## @author: Eman Ismail

import numpy as np
import pandas as pd              #Data analysis library
import matplotlib.pyplot as plt  #DV library

data_sample = np.array([[1,1],[-1,-1],[1,-1],[-1,1]])
data_sample2 = np.array([[1,1],[-1,-1],[0.5,-0.5],[-0.5,0.5]]) #More corr

df=pd.DataFrame(data_sample)
df.columns=['feature1','feature2']
df.rename({0:'obs1',1:'obs2',2:'obs3',3:'obs4'})

df.plot(kind="scatter", x="feature1", y="feature2")
plt.show()

Covariance_Mat = df.corr()
mean_vector = df.mean()


