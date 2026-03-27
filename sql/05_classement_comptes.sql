--===================================================================================
---ANALYSE 05 : Top 10 des comptes les plus actifs 
---Requête SQL 
=====================================================================================
use finance_data;
SELECT 
    AccountID,
    COUNT(*) AS nombre_transaction,
    ROUND(SUM(TransactionAmount), 2) AS volume_tra_total,
    RANK() OVER (ORDER BY SUM(TransactionAmount) DESC) AS classement
FROM banque_tra
GROUP BY AccountID
ORDER BY classement
LIMIT 10;