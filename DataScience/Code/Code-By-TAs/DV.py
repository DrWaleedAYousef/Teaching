# -*- coding: utf-8 -*-
"""
Created on Mon Nov 20 13:51:01 2017

@author: Wael Eid
"""

import pandas as pd              # Data analysis library
import seaborn as sns            #DV library
import matplotlib.pyplot as plt  #DV library

 
# load data file using pandas

iris = pd.read_csv("iris.csv") # the iris dataset is now a Pandas DataFrame(similar to excel file)
 
# return the first 10 examples from iris
iris.head(10)


#Statistical description for data
iris.describe()


#information about classes
iris["classes"].value_counts()

iris.corr()

#heatmap
#fmt--FORMAT,annot:Write Data
sns.heatmap(iris.corr(), annot=True, fmt=".2f")

#Count obs in classes(categorical var)
sns.countplot(x='classes', data=iris)

#Plots using Pandas
#plot scatter between two features   
#many kinds pie area bar ......          
iris.plot(kind="scatter", x="sepal_length", y="petal_length")
iris.plot(kind="bar", x="sepal_length") #head of 10 obs



#Histogram
sns.distplot(iris.sepal_length)  

#plot scatter using seaborn Draw a plot of two variables 
# kind=scatter or reg
sns.jointplot(x="sepal_width", y="sepal_length", data=iris, size=5)
sns.jointplot(x="sepal_width", y="sepal_length", kind="reg",data=iris, size=5)



#Two features in all classes
sns.FacetGrid(iris, hue="classes", size=5) \
   .map(plt.scatter, "petal_width", "petal_length") \
   .add_legend()


#each fearture versus others
#hue means that variable will have different colors (categorical var)
#kde diagram type for diagonal of matrix kde or hist
sns.pairplot(iris, hue="classes",  size=3,kind='scatter',diag_kind='kde').add_legend()

#plot box plot to indicate quartiles
# horizontal vs vertical
sns.boxplot(y="classes", x="petal_length", data=iris,orient='h')  


#with datapoints
ax = sns.boxplot(x="petal_length", y="classes", data=iris)
#Draw a categorical scatterplot with NON-overlapping points.
ax = sns.swarmplot(x="petal_length", y="classes", data=iris, color=".25")

#plot feature in all classes
#Draw a scatterplot where one variable is categorical.
sns.stripplot(x="classes", y="petal_length", data=iris, jitter=False)
sns.stripplot(x="classes", y="petal_length", data=iris, jitter=True)


sns.swarmplot(x="classes", y="petal_length", data=iris,hue="classes")
#Scatter plot
sns.swarmplot(x="sepal_width", y="sepal_length", data=iris,hue="classes")

#Rug Plot
sns.stripplot(x="petal_length", data=iris)

sns.violinplot(x="classes", y="petal_length", hue="classes", data=iris)


#merge two plots
sns.violinplot(x="classes", y="petal_length", data=iris, inner=None)
sns.swarmplot(x="classes", y="petal_length", data=iris, color="w", alpha=0.5)

sns.barplot(x="classes", y="petal_length", hue="classes", data=iris)

sns.boxplot(data=iris, orient="h")
iris.plot(kind="hist", x="sepal_length")


#try the following 
from sklearn.datasets import load_boston

dataset = load_boston()
df = pd.DataFrame(dataset.data, columns=dataset.feature_names)
df['target'] = dataset.target

iris["petal_length"].mean()
x=iris.sample(5)
x["sepal_length"].mean()
x["sepal_length"].var()
x["petal_length"].cov(x["petal_width"])
