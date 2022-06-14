import numpy as np
import pandas as pd
import warnings
import pickle
warnings.filterwarnings("ignore")

dataset=pd.read_csv("C:\\Users\\najee\\Downloads\\deploy-ml-model-flask-master\\deploy-ml-model-flask-master\\weatherAUS.csv")
print(dataset.iloc[:,[2,4,8,13]])
X=dataset.iloc[:,[2,4,8,13]].values
Y=dataset.iloc[:,-2].values
Y=Y.reshape(-1,1)
from sklearn.impute import SimpleImputer
imputer=SimpleImputer(missing_values=np.nan,strategy='most_frequent')
X=imputer.fit_transform(X)
Y=imputer.fit_transform(Y)
from sklearn.preprocessing import LabelEncoder
le_2=LabelEncoder()
Y=le_2.fit_transform(Y)
from sklearn.preprocessing import StandardScaler
sc=StandardScaler()
X=sc.fit_transform(X)
from sklearn.model_selection import train_test_split
X_train,X_test,Y_train,Y_test=train_test_split(X,Y,test_size=0.2,random_state=0)
from sklearn.ensemble import RandomForestClassifier
classifier=RandomForestClassifier(n_estimators=100,random_state=0)
classifier.fit(X_train,Y_train)

pickle.dump(classifier,open('model.pkl','wb'))
model=pickle.load(open('model.pkl','rb'))

"""pred=(13.4,0.6,44.0,71.0)
print(new)
new=sc.fit_transform(new)
print(new)
prediction=classifier.predict(new)
print(prediction)
print(X_test)"""