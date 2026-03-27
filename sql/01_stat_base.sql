--===================================================================================
---ANALYSE 01 : Statistique de base 
---Requête SQL 
=====================================================================================
create database finance_data;
use finance_data;
/*import du fichier csv(Bank_Transactions_data_2.csv) dans la base finance_data depuis le bureau de mon ordinateur */

/* renommer la table */
use finance_data;
rename table Bank_Transactions_data_2 to banque_tra;

/* Interrogation de la base de données afin de vérifier sa configuration*/
use finance_data;
select * 
from banque_tra
limit 10;

/*Analyse 1 : Statistique de base */
use finance_data;
select 
    transactiontype as type_transaction,
    count(*) as nombre_transaction,
    round(avg(transactionamount), 2) as montant_moyen_tra,
    Min(transactionamount) as transaction_min,
    Max(transactionamount) as transaction_max
from banque_tra
group by transactiontype;