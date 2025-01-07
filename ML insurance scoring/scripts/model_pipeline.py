'*/Ce scripts definis une deuxième class de fonctions qui est spécifique aux modèles que j utilise/*'


import os
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, roc_auc_score, auc, roc_curve

class ModelPipeline:

    def __init__(self, model=LogisticRegression(penalty='l2',C=1.0,solver='liblinear',max_iter=100)):
        self.model=model

    def train(self, x_train, y_train):
        self.model.fit(x_train,y_train)

    def predict(self, x_test):
        return self.model.predict(x_test)
    
    def predict_proba(self, X_test):
        return self.model.predict_proba(X_test)[:,1]
    
    def evaluate(self, y_true , y_pred):
        return accuracy_score(y_true, y_pred)
        
    def roc(self, y_test, y_soft):
        fpr_model, tpr_model, _ = roc_curve(y_test, y_soft)
        roc_auc_model = auc(fpr_model, tpr_model)
        return fpr_model, tpr_model, roc_auc_model
    
    #soft => means softmax in classification