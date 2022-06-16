from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.preprocessing import LabelEncoder
from sklearn.impute import SimpleImputer


from sklearn.metrics import accuracy_score
from sklearn.metrics import f1_score

from sklearn.metrics import precision_score, recall_score
import numpy as np
import pandas as pd
import warnings
import pickle
warnings.filterwarnings("ignore")

dataset=pd.read_csv("C:\\Users\\najee\\OneDrive\\Documents\\GitHub\\Weather-Station\\Prediction webpagee\\deploy-ml-model-flask-master\\weatherAUS.csv")
dataset=pd.DataFrame(dataset)
dataset.drop_duplicates(keep='first',inplace=True)
sc=StandardScaler()

dataset = dataset[dataset['RainToday'].notna()]
#print(dataset["RainToday"].value_counts(dropna=False),"Label Encoded")
le_2=LabelEncoder()
dataset["RainToday"]=le_2.fit_transform(dataset["RainToday"])
dataset=dataset.iloc[:,[2,4,11,13,-2]]
Y1=dataset["RainToday"]
Y1=pd.DataFrame(Y1)
dataset.drop(columns=["RainToday"],inplace=True)

dataset_new=pd.concat([dataset,Y1],axis=1)
print(dataset_new)
print(dataset_new["RainToday"].value_counts(dropna=False))

dataset_new.drop_duplicates(keep='first',inplace=True)
print(dataset_new["RainToday"].value_counts(dropna=False))
Y=dataset_new["RainToday"]
dataset_new.drop(columns=["RainToday"],inplace=True)

imputer=SimpleImputer(missing_values=np.nan,strategy='most_frequent')
X=dataset_new
X=pd.DataFrame(imputer.fit_transform(dataset_new))

# Y=pd.DataFrame(Y)
Y.value_counts(dropna=False)

from sklearn.model_selection import train_test_split
X_train,X_test,Y_train,Y_test=train_test_split(X,Y,test_size=0.5,random_state=42)

from sklearn.ensemble import RandomForestClassifier
classifier=RandomForestClassifier(n_estimators=100,random_state=0)
classifier.fit(X_train,Y_train)

#import xgboost as xgb
#model=xgb.XGBClassifier()
#model.fit(X_train,Y_train)
#preds=model.predict(X_test)
#print(accuracy_score(Y_test,preds))
#print('F1 is: ', f1_score(Y_test,preds,average='micro'))

#print(Y_train)
#classifier.score(X_train,Y_train)


# Y_test=Y_test.reshape(-1,1)
# Y_predict=Y_predict.reshape(-1,1)
# print(classifier.predict(X_test))

#Y_predict=pd.Series(Y_predict)

#Y_test

#Y_predict.value_counts()

#Y_test.value_counts()

# print('Precision is: ', precision_score(Y_test,Y_predict))
# print('Recall is: ', recall_score(Y_test,Y_predict))
# print(accuracy_score(Y_test,Y_predict))

# print('F1 is: ', f1_score(Y_test,Y_predict,average='micro'))
# df=np.concatenate((Y_test,Y_predict),axis=1)
# dataframe=pd.DataFrame(df,columns=["Actual","prediction"])
# # print(dataframe)
# dataframe.to_csv("prediction.csv")

# new=np.array([[13.8,8.6,7.0,67.0]])
# print(new)
# print(new)
# prediction=classifier.predict(new)
# print(prediction)
# print(X_test)

# dataset = pd.read_csv(
#     "Prediction webpagee\\deploy-ml-model-flask-master\weatherAUS.csv")
# print(dataset.iloc[:, [2, 4, 8, 13]])
# X = dataset.iloc[:, [2, 4, 8, 13]].values
# print(X)
# Y = dataset.iloc[:, -2].values
# Y = Y.reshape(-1, 1)
# imputer = SimpleImputer(missing_values=np.nan, strategy='most_frequent')
# X = imputer.fit_transform(X)
# Y = imputer.fit_transform(Y)
# le_2 = LabelEncoder()
# Y = le_2.fit_transform(Y)
# sc = StandardScaler()
# X = sc.fit_transform(X)
# X_train, X_test, Y_train, Y_test = train_test_split(
#     X, Y, test_size=0.2, random_state=0)
# classifier = RandomForestClassifier(n_estimators=100, random_state=0)
# classifier.fit(X_train, Y_train)


# pickle.dump(classifier, open('classifier.pkl', 'wb'))
# classifier = pickle.load(open('classifier.pkl', 'rb'))

"""pred=(13.4,0.6,44.0,71.0)
print(new)
new=sc.fit_transform(new)
print(new)
prediction=classifier.predict(new)
print(prediction)
print(X_test)"""
