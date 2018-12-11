#check the version of libraries

#python version
import sys
print("Python:"+str(sys.version))
#scipy
import scipy
print("Scipy:"+str(scipy.__version__))
#numpy
import numpy
print("Numpy:" +str(numpy.__version__))
#matplotlib
import matplotlib
print("Matplotlib:"+str(matplotlib.__version__))
#pandas
import pandas
print("Pandas:"+str(pandas.__version__))
#sci-kit-learn
import sklearn
print("sklearn:"+str(sklearn.__version__))

#Load Libraries
import pandas
from pandas.plotting import scatter_matrix
import matplotlib.pyplot as plt
from sklearn import model_selection
from sklearn.metrics import classification_report
from sklearn.metrics import confusion_matrix
from sklearn.metrics import accuracy_score
from sklearn.linear_model import LogisticRegression
from sklearn.tree import DecisionTreeClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.discriminant_analysis import LinearDiscriminantAnalysis
from sklearn.naive_bayes import GaussianNB
from sklearn.svm import SVC

#load dataset
url="https://raw.githubusercontent.com/jbrownlee/Datasets/master/iris.csv"
names=['sepal-learn','sepal-width','petal-length','petal-width','class']
dataset=pandas.read_csv(url,names=names)

#shape
print(dataset.shape)

#head
print(dataset.head)

#describe
print(dataset.describe())

#class distribution
print(dataset.groupby('class').size())

#box and whisker plots
print(dataset.plot(kind='box',subplots=True,layout=(2,2),sharex=False,sharey=False))
plt.show()

#histogram
dataset.hist()
plt.show()

#multivariate scatter plots
scatter_matrix(dataset)
plt.show()

#Split-out Validation dataset
array=dataset.values
print(array)
X=array[:,0:4]
Y=array[:,4]
validation_size=0.20
seed=7
X_train,X_validation,Y_train,Y_validation=model_selection.train_test_split(X,Y,test_size=validation_size,random_state=seed)
