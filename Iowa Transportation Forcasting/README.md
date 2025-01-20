# Iowa Transportation Forecasting

## Description du projet
L'objectif de ce projet est d'analyser et de prédire les données relatives à l'utilisation quotidienne des transports, en exploitant diverses techniques statistiques et d'apprentissage automatique. Plus précisément, l'objectif est de :
- Comprendre les tendances du nombre total de déplacements quotidiens.
- Prévoir les tendances futures en matière d'utilisation des transports.

## Objectif
Le but principal est d'utiliser les données historiques de transport pour modéliser et prédire les valeurs futures, tout en validant la pertinence du modèle sur les trois derniers mois exclus des données d'entraînement.

## Déroulement du projet
### 1. Préparation des données
- Les données sont chargées à partir d'un fichier CSV.
- Les colonnes sont renommées pour être compatibles avec Prophet :
  - `timestamp` devient `ds` (date).
  - `nbre_trajets_total` devient `y` (valeur à prédire).
- Les données sont regroupées par date pour obtenir une agrégation quotidienne des valeurs.

### 2. Séparation des données
- Les trois derniers mois des données sont exclus pour servir de référentiel lors de la validation des prévisions.

### 3. Modélisation avec Prophet
- Le modèle Prophet est initialisé et entraîné sur les données restantes.
- Un dataframe de prévision est créé pour les 180 prochains jours.
- Les prévisions incluent les colonnes suivantes :
  - `yhat`: Valeur prévue.
  - `yhat_lower`: Limite inférieure de l'intervalle de confiance.
  - `yhat_upper`: Limite supérieure de l'intervalle de confiance.

### 4. Validation et visualisation
- Les prévisions sont fusionnées avec les données historiques pour une analyse comparative.
- Un graphique scatter est généré pour visualiser les valeurs historiques (`y`) et prédites (`yhat`).

## Librairies et outils utilisés
- **Python** pour le traitement des données et la modélisation.
- **Pandas** pour la manipulation des données.
- **Prophet** pour la prévision des séries temporelles.
- **Matplotlib** pour la visualisation des résultats.

## Visualisation
Le graphique final permet de comparer les valeurs historiques et prédites en fonction des dates, offrant une validation visuelle de la performance du modèle.

![alt text](../Iowa_sales_forecasting.png)

## Instructions pour exécuter le projet
1. Installer les dépendances nécessaires :
   ```bash
   pip install prophet pandas matplotlib
   ```
2. S'assurer que le fichier CSV contenant les données est présent dans le répertoire `Data` du projet.
3. Exécuter le script Python pour générer les prévisions et visualiser les résultats.

## Limitations
Les prévisions sont basées sur les tendances historiques et peuvent être influencées par des événements imprévus ou des anomalies non présentes dans les données d'entraîment. Les résultats doivent donc être interprétés avec prudence.
