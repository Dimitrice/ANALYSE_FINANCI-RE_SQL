--===================================================================================
---ANALYSE 02 : Analyse par canal 
---Requête SQL 
=====================================================================================
use finance_data;
select 
	   channel as canal_trans,
	   count(*) as nombre_transaction,
	   round((count(*)/2512)*100.0, 1) as pourcentage,
	   round(AVG(transactionamount), 2)as montant_moyen_tra,
	   max(transactionamount)as transaction_max,
	   min(transactionamount)as transaction_min
from banque_tra 
group by canal_trans
order by nombre_transaction; 