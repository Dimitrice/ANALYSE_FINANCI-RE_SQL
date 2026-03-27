--===================================================================================
---ANALYSE 07 : Analyse des comptes les plus fréquemment impliqués dans des transactions anormales
---Requête SQL 
=====================================================================================
use finance_data; 
SELECT 
    AccountID,
    COUNT(*) AS nb_fois_suspect
FROM banque_tra
WHERE LoginAttempts > 1
GROUP BY AccountID
HAVING COUNT(*) > 1
ORDER BY nb_fois_suspect DESC;