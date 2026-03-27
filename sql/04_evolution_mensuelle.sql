--===================================================================================
---ANALYSE 04 : Evolution mensuelle
---Requête SQL 
=====================================================================================
use finance_data; 
SELECT 
    DATE_FORMAT(TransactionDate, '%Y-%m') AS mois,
    COUNT(*) AS nombre_transaction,
    round((count(*)/2512)*100.0, 1) as pourcentage,
    ROUND(SUM(TransactionAmount), 2) AS volume_tra_total,
    ROUND(AVG(TransactionAmount), 2) AS montant_moyen_tra
FROM banque_tra
GROUP BY mois
ORDER BY mois;