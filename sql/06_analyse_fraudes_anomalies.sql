--===================================================================================
---ANALYSE 06 : analyse des anomalies et des mouvements suspects 
---Requête SQL 
=====================================================================================
use finance_data; 
select 
     transactionid,
     accountid,
     transactionamount as montant_transaction, 
     location as ville, 
     channel as canal
from banque_tra
where loginattempts > 1
order by loginattempts desc;