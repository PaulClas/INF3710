SET search_path=HotelDB;



-- Aggregats -------------------------------------------------------

-- Combien y a-t-il d’hôtels? 
SELECT COUNT(*) AS TOTAL_HOTEL 
FROM Hotel;

-- Quel est le revenu total tiré des chambres doubles?
SELECT SUM(price) AS TOTAL_REVENUE
FROM Room 
WHERE typeroom = 'double';

-- Lister le nombre de chambres dans chaque hôtel et ordonnez les par ordre croissant en fonction du nombre de chambres
SELECT hotelNo, COUNT(roomNo) AS NBChambre 
from HOTELDB.room
GROUP BY hotelNo
ORDER BY NBChambre;


-- ESSAYEZ LA REQUETES SUIVANTE - QUe SE PASSE-T-IL ?
SELECT hotelno, COUNT(roomNo) AS NBChambre 
from HOTELDB.room;


-- Lister le nombre de chambres dans chaque hôtel qui contient plus de 1 chambre et ordonnez les résulats par nombre de chambres

SELECT hotelNo, COUNT(roomNo) AS NBChambre 
from HOTELDB.room
GROUP BY hotelNo
HAVING COUNT(roomNo) > 1
order by NBChambre;



