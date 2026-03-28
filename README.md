# Analyse des transactions bancaires avec Sql 
## Objectif du projet :
Analyser un dataset de ** 2512 transactions bancaires** pour:
-comparer les types de transactions (debit/credit)
-pour identifier le comportement des clients selon leur profil
-comparer les canaux de transaction(Onligne, Branch, ATM)
-suivre l'évolution mensuelle des flux financiers 
-détecter les transactions potentiellement suspect et identifier les comptes les plus récurents

---

## Technologies utilisées
- Base relationnelle : **MySQL**
- Interface de gestion et exécution des requêtes: **Dbeaver**
- Editeur de code: **VScode** 
- Dataset: Bank [Transactions Dataset](https://www.kaggle.com)

---

## Structure du projet
```
ANALYSE_FINANCIÈRE_SQL/
|
├── capture_ecran
├── rapport
├── sql
│   ├── 01_stat_base.sql
│   ├── 02_analyse_canaux_transactions.sql
│   ├── 03_analyse_profession.sql
│   ├── 04_évolution_mensuelle.sql
│   ├── 05_classement_comptes.sql
│   ├── 06_analyse_fraudes_anomalies.sql
│   ├── analyse_recurences_fraudes.sql
├── README.md

```

...

## Description du dataset: 
- **TransactionID**: identifiant unique de la transaction 
- **AccountID** : identifiant du compte client 
- **TransactionAmount**:  montant de la transaction en dollar 
- **TransactionDate** :  Horodatage de chaque transaction, capture de la date et de l’heure 
- **TransactionType** :  champ catégoriel indiquant les transactions: Debit / Credit  
- **Location** :  Emplacement géographique de la transaction, représenté par les noms des villes américaines 
- **DeviceID** : Identifiant alphanumérique pour les appareils utilisés pour effectuer la transaction 
- **IP Address** : Adresse IPv4 associée à la transaction, avec des changements occasionnels pour certains comptes 
- **MerchantID** : Identifiant unique pour les commerçants, affichant les commerçants préférés et les valeurs aberrantes pour chaque compte 
- **AccountBalance** : Solde du compte après transaction, avec des corrélations logiques basées sur le type de transaction et le montant 
- **PreviousTransactionDate** : Horodatage de la dernière transaction du compte, aidant à calculer la fréquence des transactions. 
- **Channel** : Canal par lequel la transaction a été effectuée:ATM / Online / Branch  
- **CustomerAge** : Âge du titulaire du compte, avec des regroupements logiques selon la profession 
- **CustomerOccupation** : Profession du titulaire du compte: Doctor / Student /,  Engineer / Retired, reflétant les tendances de revenus 
- **TransactionDuration** : Durée de la transaction en secondes, variant selon le type de transaction 
- **LoginAttempts** : Nombre de tentatives de connexion avant la transaction, avec des valeurs plus élevées indiquant des anomalies potentielles  

...

## Analyses réalisées et Résultats
### 01. Statistiques générales
| type_transaction |nombre_transaction | montant_moyen_tra | transaction_min | transaction_max |
| --- | --- | --- | --- | --- |
| credit | 568 |306,5$ | 2,03$ | 1831,02$  |
| debit | 1944 | 294,99$ | 0,26$ | 1919,11$ |

### 02. Analyse par canal 
| canal_trans | nombre_transaction | pourcentage | montant_moyen_tra | transaction_max | transaction_min |
| --- | --- | --- | --- | --- | --- |
| Online | 811 | 32,3% | 297,21$ | 1831,02$ | 0,26$ |
| ATM | 833 | 33,2% | 307,72$ | 1919,11$ | 0,32$ |
| Branch | 868 | 34,6% | 288,23$ | 1664,33$ | 0,45$ |

### 03. Analyse par profession 
| profession | nombre_transaction | pourcentage | montant_moyen_tra | solde_moyen |
| --- | --- | --- | --- | --- |
| Engineer | 625 | 24,9% | 289,04$ | 5486,41$ |
| Doctor | 631 | 25,1% | 292,7$ | 8978,99$ |
| Retired | 599 | 23,8% | 294,53$ | 4542,16$ |
| Student | 657 | 26,2% | 313.22$ | 1570.21$ |

### 04. Evolution mensuelle 
| mois | nombre_transaction | pourcentage | volume_tra_total | montant_moyen_tra |
| --- | --- | --- | --- | --- |
| 2023-01 | 207 | 8,2% | 63899,04$ | 308,69$ |
| 2023-02 | 218 | 8,7% | 57516,1$ | 263,84$ |
| 2023-03 | 197 | 7,8% | 61036,12$ | 309,83$ |
│ 2023-04 | 161 | 6,4% | 41003,84$ | 254,68$ |
| 2023-05 | 220 | 8,8% | 62868,01$ | 285,76$ |
| 2023-06 | 212 | 8,4% | 61559,58$ | 290,38$ |
| 2023-07 | 195 | 7,8% | 58861,58$ | 301,85$ |
| 2023-08 | 224 | 8,9% | 71437,76$ | 318,92$ |
| 2023-09 | 214 | 8,5% | 72832,25$ | 340,34$ |
| 2023-10 | 226 | 9% | 64705,62$ | 286,31$ |
| 2023-11 | 221 | 8,8% | 66051,13$ | 298,87$ |
| 2023-12 | 204 | 8,1% | 63719,43$ | 312,35$ |
| 2024-01 | 13 | 0,5% | 2065,3$ | 158,87$ |

### 05 Classement du TOP 10 des comptes les plus actifs 
| accountid | nombre_transaction | volume_tra_total  | classement |
| --- | --- | --- | --- |
| AC00460 | 12 | 5570,34$  | 1 | 
| AC00363 | 12 | 4702,91$  | 2 | 
| AC00337 | 8 | 4393,41$  | 3 | 
| AC00021 | 8 | 4263,34$  | 4 | 
| AC00439 | 9 | 4185,81$  | 5 | 
| AC00385 | 7 | 4141,2$  | 6 | 
| AC00071 | 8 | 4050,12$  | 7 | 
| AC00265 | 9 | 3953,6$  | 8 | 
| AC00136 | 8 | 3880,53$  | 9 | 
| AC00179 | 6 | 3819,73$  | 10 | 

### 06 Analyse des anomalies/mouvements suspects
| Indicateur | Resultats (nombres de transaction suspectes ) |
| Transaction suspect (loginAttempts > 1) | 122 (4.9% ) |
| compte détectés plusieurs fois suspect (suspect sur des transactions différentes ) | 11 comptes |
| compte le plus suspect | AC00272 (3 fois) |

...

### Insights 
1- les **Debits représentent 77%** des transactions (1944/2512) mais le montant moyen des transactions est légèrement élevé pour les **Crédits**(306$ vs 295$)
2- les canaux sont relativement équilibrés autour de (32-34%) des transactions, mais cependant, le montant moyen des transactions généré par l'*ATM* est de 307,72$ tandis que *Branch* dont le pourcentage de transactions est le plus élevé a généré un montant moyen plus bas que les autres soit: 288.23$
3- les **Etudiants** font le plus de transaction avec un montant moyen plus élevé soit (313$) mais cependant ils ont le solde moyen le plus bas
4- les **Docteurs** ont le solde moyen le plus élevé
5- **Septembre** est le mois où le volume de transaction est le plus élevé : 72832 avec le montant moyen le plus élevé, 
7- **Octobre 2023** est le moi où il y a plus de transaction
8- le **Compte AC00460** est le compte le plus actif avec **12 transactions**, pour un volume total de 5570$. ce montant est presque deux fois supérieur à celui du 10eme le plus actif, dont le volume total de transaction est de 3819$. 
9- **122 transactions suspectes** détectées soit 4.9% des transactions. la transaction suspecte **TX0089** éffectuée dans la ville de **San Diego** detient la somme la plus élevée soit : 1531.31$
10- **11 comptes**  ont été désignés suspects au cours de plusieurs transactions. le compte **AC00272** est le cas le plus préocupent car il a été **désigné trois fois comme suspect**. 


## Auteur : Dimitrice Wabo 