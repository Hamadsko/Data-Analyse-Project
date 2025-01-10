---
title: "data_mining"
date: "2025-01-10"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
knitr::include_graphics()
```
####################################################################################################################
# Chargement des bibliothèques nécessaires pour l'analyse
```{r}
library(FactoMineR)
library(vtable)
library(tidyverse)
library(readxl)
library(questionr)
install.packages("factoextra")
library(factoextra)
```

####################################################################################################################
#Importation des bases de données 
```{r}
Df<- read.csv("/Users/hamadoundoucoure/Documents/GitHub Project/Data-Analyse-Project/Data Mining Classification/Data/Df.csv")
```


####################################################################################################################
# Conversion des colonnes en types numériques appropriés
```{r}
Df$life_expec <- as.double(Df$life_expec)
Df$sport_good_services <- as.double(Df$sport_good_services)
Df$outdoor_durable <- as.double(Df$outdoor_durable)
Df$indoor_durable <- as.double(Df$indoor_durable)
Df$gini <- as.numeric(Df$gini)
```

####################################################################################################################
# Attribution du nom de la ligne à partir de la colonne 'TIME.x'
```{r}
rownames(Df) <- Df$TIME.x
```

####################################################################################################################
# Aperçu rapide de la structure du dataframe 'Df'
```{r}
Df %>% glimpse
```

####################################################################################################################
# Génération d'une table de résumé statistique pour le dataframe 'Df'
```{r}
st(data = Df)
```

####################################################################################################################
# Réalisation d'une analyse en composantes principales (ACP) sur les colonnes 2 à 10 de 'Df'
```{r}
res.pca <- PCA(Df[,2:10])
```

####################################################################################################################
```{r}
#histogramme valeur propre
round(res.pca$eig,2)
# Graph avec titres
barplot(res.pca$eig[,1], main="Valeurs propres",names.arg=paste("dim",1:nrow(res.pca$eig)))

# Histogramme (des valeurs propres) en % de l'inertie)
barplot(res.pca$eig[,2], main="Décomposition de l'inertie totale",names.arg=paste("dim",1:nrow(res.pca$eig)))
#
```

####################################################################################################################
# Visualisation des individus de l'analyse en composantes principales (ACP) sur le graphique
```{r}
plot.PCA(res.pca, choix="ind")
```

####################################################################################################################
# Affichage des descripteurs de dimensions pour l'analyse en composantes principales (ACP)
```{r}
dimdesc(res.pca)
```

####################################################################################################################
```{r pressure, echo=FALSE}
plot(pressure)
```

####################################################################################################################
# Représentation graphique des individus de l'ACP, avec sélection des individus en fonction de leurs cos2 
```{r}
plot.PCA(res.pca, choix="ind", cex=0.8, select="cos2 0.7")
plot.PCA(res.pca, choix="ind", cex=0.8, select="cos2 0.9", unselect=1)
plot.PCA(res.pca, choix="ind", cex=0.8, select="contrib 70", unselect=1)

plot.PCA(res.pca, choix="var", cex=0.8, select="cos2 0.7")
plot.PCA(res.pca, choix="var", cex=0.8, select="contrib 5")
```


####################################################################################################################
```{r}
# Réalisation d'une analyse en composantes principales (ACP) sur les colonnes 2 à 10 de Df
res.pca <- PCA(Df[,2:10])
# Affichage du résumé de l'ACP avec tous les axes (ncp=Inf pour afficher tous les axes)
summary(res.pca, ncp = Inf)
# Selection des variables prises en compte
res.pca <- PCA(Df[,2:10])  

# Visualisation des variables de l'ACP avec fviz_pca_var
# Utilisation de "cos2" pour colorier les variables en fonction de leur qualité de représentation
fviz_pca_var(res.pca, col.var = "cos2", 
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
             repel = TRUE  # Eviter le chevauchement des textes
)
```

####################################################################################################################
```{r}
# Calcul de la matrice des distances euclidiennes entre les observations (colonnes 2 à 10)
Df <- dist(Df[,2:10], method = "euclidean")
# Application de l'algorithme de clustering hiérarchique (méthode de Ward)
fit <- hclust(Df, method="ward.D")
# Affichage du dendrogramme du clustering hiérarchique
plot(fit)
# Découpage du dendrogramme en 3 groupes (classes)
groups <- cutree(fit, k=3)
# Dessin du dendrogramme avec des rectangles rouges délimitant chaque groupe
rect.hclust(fit, k=3, border="red")
```