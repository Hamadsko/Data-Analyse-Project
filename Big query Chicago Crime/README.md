# Etude de la criminalité dans la ville de Chicago

## Introduction 
Cet ensemble de données reflète les incidents criminels signalés (à l'exception des meurtres pour lesquels des données existent pour chaque victime) survenus dans la ville de Chicago de 2001 à aujourd'hui, moins les sept jours les plus récents. Les données sont extraites du système CLEAR (Citizen Law Enforcement Analysis and Reporting) du département de police de Chicago.
Cet ensemble de données public est hébergé dans Google BigQuery contenant plus de 8 000 000 d'observations.

## Objectif 
L'objectif de ce projet est à deux volets :
-Le premier est d'étudier la criminalité dans la ville de chicago sous toutes ses formes, que ce soit par les actes les plus observés, les catégories d'actes criminels, les régions les plus impactées ainsi que les saisonnalités. De ce fait j'ai initialement travaillé sur Big Query pour requêter, mais afin d'avoir un visuel j'ai travaillé sur sqlite où vous retrouverez les requêtes en question dans le dossier 'Queries'
-Le deuxième volet est d'extraire les résultats de nos requêtes afin de rendre parlantes visuellement ces données par le biais de Looker Studio issu du Google Load (directement extraites au format png dans le dossier 'Data visualisation')


## Data Visualisation
Voici deux exemples de capture de Looker studio 

Cette première capture illustre par expemples les régions les plus impactées par la criminalité en 2022
![alt text](<Data visualization/Crimes_regions_2022.png>)

Cette deuxième capture quant à elle classifie les actes criminels les plus observés par locations/lieus
![alt text](<Data visualization/Actes_les_plus_observés.png>)


## Data/Résultats
Les données représentant plus de 8 000 000 d'observations, j'ai extrait via une requête sur big query de manière random 10 000 observations que vous retrouverez dans 'Data'.
Par la suite j'ai créer une table 'Crime' par le biais de ce fichier csv afin de pouvoir requêter directement dans VSCODE.

Pour executer en command et extraire le resultat:
se mettre dans le directory parent
sqlite3 Data/Crime.db ".read Queries/Query.sql" > 'Outputs/test_output.txt'