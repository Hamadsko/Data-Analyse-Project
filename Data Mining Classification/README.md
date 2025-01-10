# Projet Data Mining: Etude de la relation entre la consommation de biens/services sportifs et le tissu socio-économique

## I) Introduction
Cette étude vise à explorer les nuances de la relation entre la consommation des biens et services sportifs et le tissu socio-économique. En analysant ces connexions, nous cherchons à apporter une compréhension plus profonde des facteurs qui influent sur la manière dont le sport est perçu, pratiqué et intégré dans la vie quotidienne à l'échelle mondiale
Cette analyse vise à explorer les liens intrinsèques entre la passion pour le sport et des indicateurs clés tels que la criminalité, l'espérance de vie, le niveau d'éducation, le revenu moyen, et le coefficient de Gini au sein de diverses nations.

## Données
La base de données représente des données en coupe transversale de 31 pays européens,avec pour chaque pays, différentes caractéristiques correspondant aux variables suivantes : éducation, le niveau de crime, la participation aux événements culturels, l'espérance de vie, la consommation en bien et service, le salaire moyen et l’indice de gini. A travers ces variables, nous voulons capturer les multiples facettes de la réalité socio-économique d'un pays. La criminalité offre un prisme à travers lequel nous pouvons examiner la sécurité et la stabilité d'une société, tandis que l'espérance de vie reflète la qualité de vie et les soins de santé. Le niveau d'éducation est un indicateur de la vitalité intellectuelle d'une population, le revenu moyen témoigne de la prospérité économique, et le coefficient de Gini quantifie les inégalités de revenus. Tous ces éléments contribuent à définir le contexte dans lequel la consommation sportive s'épanouit ou fléchit. Toutes les variables proviennent de bases de données du site eurostat.fr. En prenant chacune des variables dont nous avions besoin en sélectionnant la valeur pour l'année la plus récente (2020). Ainsi nous nous retrouvions avec l’ensemble des données ci-dessous:

![alt text](<Dictionnaire des variables.png>)

Cette étude comporte trois méthodes de classifications => ACP, Cluster Dendrogram, Arbre de décision 

# I) Analyse en Composantes Principales (ACP) sur les Données Européennes

## Contexte
Dans cette étude, nous avons utilisé la méthode de l'Analyse en Composantes Principales (ACP) pour explorer les relations entre différentes variables quantitatives à partir d'une base de données qui croise des individus (pays européens) et des variables socio-économiques. La base a été constituée par fusion des données, en ajustant les types de variables et en supprimant les individus avec des valeurs manquantes.

## Résultats de l'Analyse en ACP
### Définition des Axes
L'ACP a permis de définir les axes principaux en fonction de la décomposition de l'inertie totale et du pourcentage de variance. L'axe 1 (48.29%) et l'axe 2 (18.68%) expliquent au total 66.97% de l'inertie, ce qui permet de limiter l'analyse à ces deux axes.

![alt text](<Output script/Composition_inertie.png>)

### Contribution des Individus aux Axes
- **Axe 1** : Les pays les plus contributifs sont le Luxembourg, la Bulgarie, les Pays-Bas, la Croatie, la Belgique, l'Autriche, le Danemark, la Hongrie, totalisant 79% de l'inertie.
- **Axe 2** : La Bulgarie, la Croatie, la République tchèque, la Grèce, la Slovaquie et la Slovénie contribuent à 78% de l'inertie de cet axe.

### Qualité de Représentation des Individus
13 individus sont bien représentés par les axes principaux, avec un cosinus carré supérieur à 0.6, ce qui indique une bonne qualité de projection sur les axes.

![alt text](<Output script/PCA Graph des individus.png>)

### Nuage des Variables
L'analyse a identifié les variables les mieux représentées sur chaque axe :
- **Axe 1** : Les variables "salaire_anmoy", "sport_good_services", "outdoor_durable", et "participation_culteven" sont fortement corrélées, opposant les pays avec des salaires et une consommation plus élevés à ceux avec des niveaux inférieurs.
- **Axe 2** : Les variables "Gini" et "crime_area" opposent les pays avec des niveaux d'inégalité et de criminalité plus élevés à ceux avec des niveaux plus bas.

![alt text](<Output script/PCA Graph des variables.png>)

### Interprétation des Résultats
- **Axe 1** : Les pays tels que la Belgique, les Pays-Bas, le Luxembourg, l'Autriche, et le Danemark se distinguent par des niveaux élevés de salaires et de consommation. À l'inverse, des pays comme la Hongrie, la Croatie et la Slovaquie présentent des niveaux plus faibles dans ces domaines.
- **Axe 2** : La Bulgarie se caractérise par un niveau d'inégalité et de criminalité plus élevé que la moyenne, contrairement à des pays comme la Slovaquie, la Slovénie, la Croatie et la Pologne qui ont des niveaux plus bas.


# 2) Classification Ascendante Hiérarchique (CAH)

## Contexte
Pour compléter l'analyse, nous avons choisi d'utiliser la méthode de Classification Ascendante Hiérarchique (CAH). Cette méthode génère une structure hiérarchique, visualisée à travers un dendrogramme, qui permet de comprendre les relations entre les individus (pays européens) et de former des groupes à différentes échelles.

## Dendrogramme et Clustering
En se basant sur le dendrogramme obtenu, nous avons déterminé quatre clusters visuellement. Les pays ont été répartis dans ces quatre groupes selon leurs caractéristiques socio-économiques.

![alt text](<Output script/Cluster dendrogram.png>)

## Répartition des Clusters
- **Cluster 1** : Lituanie, Grèce, Pologne, Slovénie, Chypre, Estonie, Lettonie
- **Cluster 2** : Bulgarie, Croatie, Malte, Slovaquie, Hongrie  
Ces deux premiers clusters regroupent les pays ayant une consommation de biens et services sportifs inférieure à la moyenne.
  
- **Cluster 3** : Luxembourg, Pays-Bas, Belgique, Autriche, Danemark
- **Cluster 4** : Italie, Espagne, France, Allemagne  
Les deux derniers clusters incluent des pays avec une consommation de biens et services sportifs supérieure à la moyenne.


# 3) Utilisation d'une méthode de classification supervisée : Arbre de décision

## Contexte
Dans cette analyse, nous avons utilisé un arbre de décision pour prédire la consommation de biens et services sportifs dans différents pays européens. La variable dépendante “Sport_good_services” a été segmentée en une variable binaire basée sur la médiane : 
- **1** : pays dont la consommation est supérieure à la médiane
- **0** : pays dont la consommation est inférieure à la médiane.

## Résultats de l’arbre de décision
L'arbre de décision a généré 5 feuilles (règles), avec un nœud racine reposant sur la variable *participation_culteven* (taux de participation à des activités culturelles). L'arbre segmente les pays en fonction de plusieurs critères :
1. **Taux de participation culturelle** : si supérieur à 72.3, les pays sont répartis selon d'autres variables.
2. **Niveau d'éducation** : pour les pays avec une participation culturelle inférieure à 72.3, le niveau d'éducation est utilisé pour les différencier davantage.
3. **Consommation de biens durables pour activités extérieures** : cette variable est utilisée pour compléter la segmentation.
4. **Seuils utilisés** : Les seuils de segmentation pour chaque variable (participation culturelle, niveau d'éducation, consommation de biens durables) permettent de prédire si un pays aura une consommation de biens et services sportifs supérieure ou inférieure à la médiane.

Les règles finales permettent de prédire si un pays est classé dans la catégorie à forte consommation de biens sportifs ou non, en fonction de la combinaison des critères ci-dessus.

![alt text](<Output script/Arbre de décision.png>)

# Note de fin

Ce projet est à des fins pédagogiques et exploratoires. Les résultats obtenus doivent être pris avec précaution et ne reflètent pas une application réelle ou un impact direct. Une analyse plus approfondie et validée serait nécessaire pour tirer des conclusions définitives.
