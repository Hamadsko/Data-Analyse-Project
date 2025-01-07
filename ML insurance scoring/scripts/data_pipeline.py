'*/Ce scripts definis une première class de fonctions de traitements de données depuis la recolte, le nettoyage, codage'
'et entrainement des modèles/*'

import pandas as pd
import os
import seaborn as sns
from sklearn.model_selection import train_test_split



class DataPipeline:

 #J'importe les données 
    def __init__(self, data_filename : str):
        current_dir=os.getcwd()
        project_root= os.path.abspath(os.path.join(current_dir,'..'))
        data_dir=os.path.join(project_root,'data')
        self.data_path = os.path.join(data_dir,data_filename)
        self.data = None
        self.X_train = None
        self.X_test = None
        self.y_test = None
        self.y_train = None
        self.dummies = ['Tage','Vmatri','Diplome','Occupa',
                             'Work','Urbani','Zeat','Nbenfq']


    def get_data(self):
        self.data = pd.read_csv(self.data_path)
    

#J'encode les variables 
    def processing(self):
        columns_to_encode = ['Sexe','Couple','Herit','Jgrav',
                             'Livep','Epalo','qpep','vmob','asdecv',
                             'Retrait','livdf','pel','cel','terre','dette',
                             'bdetre','hdetvo','Iogoc','Pere','Mere',
                             'Gparp','gparm','statut','Qpea','fepsal']
        try :
            self.encode(columns_to_encode=columns_to_encode)
            print ('💯 Encoding Réussi')
        except :
            print('😞 Encoding KO')

        self.drop_columns()


    def encode(self, columns_to_encode):
        for col in columns_to_encode:
            self.data[col] = self.data[col].astype('category')
            self.data[col+'_num'] = self.data[col].cat.codes
        self.data.drop(columns=columns_to_encode, inplace = True)

#Je visualise une matrice de corrélation
    def viz_corr(self):
        matrice_corr=self.data.corr()
        sns.set(rc = {'figure.figsize':(20,13)})
        sns.heatmap(matrice_corr,annot=True)


#Je supprime les variables non nécéssaires à mon analyse
    def drop_columns(self):
        self.data.drop(columns=['livdf_num','Age','ident','Asvi','Nbenf'],inplace=True)
        

    
    def freq_feature(self, feature):
        print('Nombre d\'instances du feature ', feature, ': ',self.data[feature].nunique())
        print('Fréquences : \n',self.data[feature].value_counts()/len(assu))

    
    def corr_features(self, feature,dim_fig):
        toto=pd.get_dummies(self.data[feature])
        toto['AsviR']=self.data['AsviR']
        sns.set(rc = {'figure.figsize':(dim_fig,dim_fig)})
        sns.heatmap(toto.corr(),annot=True)



#J'encode les variables à plusieurs modalités 
    def dumies_modalite(self):
        
        try :
            self.get_dumies()
            print ('🔥 Dummies Réussi')
        except :
            print('😞 Dummies KO')

    def get_dumies(self):
        for cols in self.dummies:
            if cols in self.data.columns:
                self.data[cols] = self.data[cols].astype('category')
                dummies = pd.get_dummies(self.data[cols], prefix=cols)
                self.data = pd.concat([self.data, dummies], axis=1)
            else:
                print(f"Colonne '{cols}' introuvable dans les données.")
        self.data.drop(columns=self.dummies, inplace=True)


#Je split ma base de données en 80% d'entrainement et 20% de test puis je prédis et évalue
    def split_train(self):
        features = self.data.columns.values.tolist()
        features.remove('AsviR')

        X = self.data.loc[:, features]
        y= self.data['AsviR']

        self.X_train, self.X_test, self.y_train, self.y_test = train_test_split(X, y, test_size=0.2, random_state=42)

#J'établis un score d'attrition pour chaques individus
    def get_attrition_score(self, attrition_score, model_name : str):
        self.X_test['score_client_'+model_name] = attrition_score
