SELECT Nom, Prenom 
FROM Passager
WHERE (SELECT NoVol FROM Vol
            WHERE (SELECT NoVol FROM Vol
                    WHERE( SELECT CodeAeroport FROM Aeroport 
                        WHERE Ville = 'Rabat')));
