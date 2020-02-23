--1) (1 point) Retourner le nombre d'appareils produits par pays.
select Count(*) as nbApp, c.pays
from avion a inner join constructeur c on a.idConstructeur = c.idConstructeur
group by c.idConstructeur, c.pays
--2) (1.5 point) Retourner le nombre d'appareils produits par pays dont le nombre de sièges est supérieur à 200.
select Count(*) as nbApp, c.pays
from avion a inner join constructeur c on a.idConstructeur = c.idConstructeur
WHERE
nbSieges > 200
group by c.idConstructeur, c.pays

--3)(1 point) Préparer une requête afin de réaliser une analyse de l’état de la flotte à partir des données suivantes : le modèle, le nombre de sièges, le nombre d’heures accumulées et la vitesse.
SELECT idMoteur.modele AS MODELE from Moteur,
idAvion.nbSieges AS NBSIEGES from Avion, 
heuresVol AS HEURESVOL from Flotte,

