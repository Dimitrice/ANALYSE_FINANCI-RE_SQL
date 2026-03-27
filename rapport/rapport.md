# Rapport d'analyse — Transactions Bancaires 2023

## 1. Introduction

Ce rapport présente les conclusions de l'analyse de **2512 transactions bancaires** extraites du dataset Kaggle "Bank Transaction Dataset". l'analyse a été réalisée avec **MySQL** via **DBeaver** et couvre la période de **Janvier 2023 à Janvier2024**. 
L'objectif principal est de comprendre les comportements financiers des clients, d'identifier les tendances par canal et profession, et de détecter les transactions potentiellement frauduleuses.

---

## 2. Comportement général des transactions

les transactions de type **Debit dominent largement** avec 1944 opérations soit **77% du total**, contre 568 **credits**(23%). cependant, malgré leur faible fréquence, les crédits affichent un montant moyen légèrement supérieur (**306,5$ vs 294,99$**), ce qui suggère que les entrées d'argent sont moins fréquents mais plus importantes en valeur.
Interprétation: les clients dépensent souvent mais reçoivent de l'argent en moins grande quantité.

---

## 3. Analyse des canaux de transaction

les 3 cannaux sont remarquablement équilibrés entre 32% et 35% :
- **Branch** (34,6%) est le canal le plus utilisé mais génère le montant moyen le plus bas 288,23$ 
Les 3 canaux sont remarquablement équilibrés entre 32% et 35% :
- **ATM** (33,2%) génère le montant moyen le plus élevé (307,72$)
- **Online** (32,3%) est le canal le moins utilisé

Interprétation : malgré la tendance mondiale vers le digitale, le canal physique Branch reste dominant. les retraits ATM sont moins fréquents mais ils concernent des montants plus importants 

---

## 4. Profil financier par profession

L'analyse par profession révèle des disparités importantes :

**Lest Etudiants ** sont les plus actifs (657 transactions, 26,2%) avec le montant moyen le plus élevé (313$), mais paradoxalement ils détiennent le **solde moyen le plus bas** (1507$). ce profil suggère une population qui dépense beaucoup par rapport à ses revenus, avec un risque de découvert plus élevé.

**les Docteurs** affichennt le **solde moyen le plus élevé** (8978$), soit presque 6 fois celui des Etudiants. ils effectuent 631 transactions avec un montant moyen de 292$, profil d'une population financière stable.

**Les Engineers** présentent un profil équilibré avec un solde moyen de 5 486$ et 625 transactions.

**Les Retired** sont les moins actifs (599 transactions) avec un solde moyen de 4 542$.

 Interprétation : la profession est un indicateur fort  du niveau d'épargne, mais pas nécessairement du volume de dépenses.

---

## 5. Évolution mensuelle

L'activité transactionnelle est globalement stable sur l'année 2023, oscillant entre **7,8% et 9%** du volume mensuel.

Deux mois se distinguent particulièrement :

- **Septembre 2023** enregistre le **volume financier le plus élevé** (72 832$) avec le montant moyen le plus fort (340$), soit 29% de plus que le mois le plus faible

- **Octobre 2023** comptabilise le **plus grand nombre de transactions** (226), suggérant une période d'activité intense en automne

Le mois d'**avril 2023** est le plus faible avec seulement 161 transactions et un volume de 41 003$.

---

## 6. Classement des comptes les plus actifs

Le compte **AC00460** est le plus actif du dataset avec **12 transactions** et un volume total de **5 570$**, soit presque le double du 10ème compte le plus actif (AC00179 — 3 819$).

Les 10 premiers comptes concentrent entre 6 et 12 transactions chacun, avec des volumes allant de 3 819$ à 5 570$.

---

## 7. Analyse des anomalies et détection de fraude

###  Principe de détection utilisé
La détection repose sur le champ **LoginAttempts** qui indique le nombre de tentatives de connexion avant une transaction. Dans une situation normale un client se connecte du premier coup 
(LoginAttempts = 1). Plusieurs tentatives suggèrent une tentative d'accès non autorisé.

###  Résultats
**122 transactions (4,9%)** ont déclenché une alerte avec LoginAttempts > 1. Parmi elles, la transaction **TX000089** effectuée à San Diego détient le montant suspect le plus élevé avec **1 531,31$**.

### Comptes récurrents
**11 comptes** ont été détectés comme suspects sur plusieurs transactions différentes. Le compte **AC00272** est le cas le plus préoccupant avec **3 détections consécutives** via ATM à Chicago, suggérant des tentatives répétées d'accès non autorisé sur ce compte.

---

## 8. Recommandations

1. **Surveiller AC00272 en priorité** — 3 alertes consécutives nécessitent une vérification manuelle immédiate

2. **Renforcer la sécurité ATM** — canal le plus concerné par les tentatives suspectes

3. **Accompagner les Students** — fort volume de dépenses avec solde bas, risque de découvert élevé

4. **Investiguer septembre 2023** — pic de volume inhabituel   à approfondir pour comprendre l'origine

5. **Abaisser le seuil d'alerte** à LoginAttempts > 1  pour une détection plus précoce

---

## 9. Conclusion

Cette analyse révèle un dataset globalement sain avec **4,9% de transactions suspectes**. Les requêtes SQL permettent d'identifier rapidement les anomalies et les profils à risque, constituant une première ligne de défense efficace contre la fraude bancaire. 
Les disparités entre professions, notamment entre Students et Doctors, ouvrent des perspectives intéressantes pour des produits financiers adaptés à chaque segment de clientèle.

---

*Rapport réalisé  par **Dimitrice Wabo***
*Outils : MySQL • DBeaver • VS Code*
*Dataset : Kaggle — Bank Transactions Dataset*