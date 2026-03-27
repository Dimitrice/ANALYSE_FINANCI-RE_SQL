--===================================================================================
---ANALYSE 03 : Analyse par Profession 
---Requête SQL 
=====================================================================================
use finance_data;
select 
	   customeroccupation as profession,
	   count(*) as nombre_transaction,
	   round((count(*)/2512)*100.0, 1) as pourcentage,
	   round(AVG(transactionamount), 2) as montant_moyen_tra,
	   round(AVG(accountbalance), 2) as solde_moyen 
from banque_tra 
group by profession
order by montant_moyen_tra; 