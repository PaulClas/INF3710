--1) (1 point) Retourner le nombre d'appareils produits par pays.
select idConstructeur, count(*) as nbappareils from Avion
group by pays, Constructeur
order by nbappareils desc, pays
--2) (1.5 point) Retourner le nombre d'appareils produits par pays dont le nombre de sièges est supérieur à 200.
select idConstructeur, count(*) as nbappareils from Avion
WHERE
nbSieges > 200
group by pays, Constructeur
order by nbappareils desc, pays
--3)(1 point) Préparer une requête afin de réaliser une analyse de l’état de la flotte à partir des données suivantes : le modèle, le nombre de sièges, le nombre d’heures accumulées et la vitesse.
SELECT idMoteur.modele AS MODELE from Moteur,
idAvion.nbSieges AS NBSIEGES from Avion, 
heuresVol AS HEURESVOL from Flotte,

