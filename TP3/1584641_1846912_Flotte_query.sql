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
SELECT a.modele, a.nbsieges, f.heuresvol, f.vitesse
FROM flotte f, avion a
WHERE f.idavion = a.idavion;

--4) (1.5 point) Quels sont les avions encore en service ? Proposer une requête en listant
--   l’avion, son modèle, le nombre de sièges et le nombre d’heures de vol.
SELECT f.idavion, a.modele, a.nbsieges, f.heuresvol
FROM flotte f, avion a 
WHERE f.idavion = a.idavion;

--5) (1 point) Retourner le nombre de sièges et le nombre d’heures de vol des flottes.
SELECT f.noserieavion, f.idavion, COUNT(DISTINCT a.nbsieges) AS nbSieges, f.heuresvol
FROM flotte f, avion a
WHERE f.idavion = a.idavion
GROUP BY f.noserieavion, f.idavion, f.heuresvol;

--6) (1 point) Quels sont le ou les modèles d'appareils dont le nombre de sièges est supérieur à
--   300? Affichez le modèle et le nom de la compagnie.
SELECT a.modele, c.nomcompagnie
FROM avion a, constructeur c
WHERE a.nbsieges > 300;

--7) (1.5 point) Quel est le nombre d'appareil (avions) dont le nombre des sièges est supérieur
--   à la moyenne des sièges de tous les appareils, en utilisant une ou des sous-requêtes?
SELECT count(a.idavion) AS NbAppareil
FROM avion a
WHERE a.nbsieges > (SELECT AVG(nbsieges)
				   	FROM avion);

--8) (1.5 point) Quelle est la différence entre le plus grand et le plus petit diamètre d'un
--   moteur ? Affichez le résultat dans une colonne nommée différence.
SELECT (MAX(diametre)- MIN(diametre)) AS difference
FROM moteur;

--9) (1.5 point) Créer une vue Avion_Bombardier_Vue ayant le nom de la compagnie, le
--   modèle, le nombre des sièges et le nombre des moteurs d’avion construit par 'Bombardier
--   Aéro'.
CREATE VIEW Avion_Bombardier_Vue 
AS SELECT c.nomcompagnie, a.modele, a.nbsieges, a.nbmoteurs
FROM avion a, constructeur c
WHERE c.nomcompagnie = 'Bombardier Aero';

--10) (0.5 point) Modifiez la vue en utilisant CHECK Option. Que se passe-t-il ?
CREATE VIEW Avion_Bombardier_Vue 
AS SELECT c.nomcompagnie, a.modele, a.nbsieges, a.nbmoteurs
FROM avion a, constructeur c
WHERE c.nomcompagnie = 'Bombardier Aero'
WITH CHECK OPTION;

-- La modification (rejete mise à jour ou insertion de données) est refuse si elle contrevient à
-- la définition de la vue

--12) (0.5 points) Mettez à jour les tuples de la vue en 11) en changeant l’id constructeur à 2.
--    Que se passe-t-il ?
-- Les changements affectent la vue et la table de base a partir de laquelle la vue a ete creee.
-- En effet l'idconsctructeur est maintenant egal a 2 partout ou il etait egal a 1, dans la vue et la 
-- table de base

--13) (0.5 points) Modifiez la vue en 11) en rajoutant l’option WITH CHECK OPTION. Réexécutez
--    le code de création de la vue et essayez de mettre à jour la vue comme dans 12.
--    Que se passe-t-il ?
-- Cette mise-a-jour est rejete car elle contrvient a la definition de la vue.

