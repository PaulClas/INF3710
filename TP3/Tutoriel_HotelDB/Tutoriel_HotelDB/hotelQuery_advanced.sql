SET search_path=HotelDB;


-- Lister le prix et le type des chambres au Grosvenor Hotel en utilisant une sous-requête

SELECT price, typeroom FROM HotelDB.Room 
WHERE hotelNo = 
(SELECT hotelNo FROM HotelDB.Hotel 
WHERE hotelName = 'Grosvenor Hotel');

-- Lister le prix et le type des chambres au Grosvenor Hotel en utilisant une jointure 
SELECT price, typeroom, h.hotelName 
FROM Room r, Hotel h
WHERE h.hotelNo = r.hotelNo
AND hotelName = 'Grosvenor Hotel';



SELECT price, typeroom, hotelName into test
FROM Room JOIN Hotel h
ON h.hotelNo = Room.hotelNo
WHERE hotelName = 'Grosvenor Hotel';

select * from test;

-- Lister les clients qui sont actuellement au Grosvenor Hotel avec des sous-requêtes.

SELECT * FROM HOTELDB.Guest 
WHERE guestNo IN 
(SELECT guestNo FROM HOTELDB.Booking
WHERE dateFrom <= current_date AND 
dateTo >= current_date AND
hotelNo = 
(SELECT hotelNo FROM Hotel
WHERE hotelName = 'Grosvenor Hotel'));


-- Lister le nombre de chambres de chaque hôtel à London
SELECT h.hotelNo, COUNT(roomNo) AS count 
FROM Room r, Hotel h
WHERE r.hotelNo = h.hotelNo 
AND city = 'London'
GROUP BY h.hotelNo;

-- Effectuez le produit cartésien de Hôtel et Room de deux manières. Que remarquez-vous?
select * from HotelDB.Hotel, HotelDB.Room;
select * from HotelDB.Hotel CROSS JOIN HotelDB.Room;


-- Indiquez les chambres qui sont réservées ainsi que leur hôtel (Proposez deux manières différentes)
SELECT roomNo, b.HotelNo 
FROM HotelDB.Booking b, HotelDB.Hotel h
 WHERE b.hotelNo = h.hotelNo;

SELECT roomNo, b.HotelNo 
FROM HotelDB.Booking b 
NATURAL JOIN HotelDB.Hotel h;

-- Lister le prix et le type des chambres au Grosvenor Hotel en utilisant une jointure

SELECT r.price, r.typeroom FROM Hotel h, Room r
WHERE h.hotelNo = r.hotelNo
AND hotelName = 'Grosvenor Hotel';

--- Affichez les détails de tous les clients qui ont effectué une réservation
Select Guest.guestNo, guestName, guestcity
From Guest, Booking
Where Guest.guestNo =Booking.guestNo;

--- Affichez les détails de tous les clients qui ont effectué une réservation (utiliser des alias)
Select g.guestNo, g.guestName, g.guestcity
From Guest g, Booking b
Where g.guestNo = b.guestNo;

--	Affichez les détails de tous les clients qui n'ont pas effectué une réservation 
-- Vérifiez votre requête avec les données que vous êtes censés obtenir
Select g.guestNo, g.guestName, g.guestcity
From Guest g
Where g.guestNo NOT IN (
SELECT g.guestNo
From Booking b
WHERE g.guestNo = b.guestNo);


-- Lister les chambres (Num) et le nom de l'hôtel qui sont actuellement occupées au Grosvenor Hotel .
SELECT roomNo, h.hotelName 
FROM HOTELDB.Booking b, HOTELDB.Hotel h
WHERE dateFrom <= current_date  
AND dateTo >= current_date 
AND b.hotelNo = h.hotelNo 
AND hotelName = 'Grosvenor Hotel';

-- En utilisant la requête précédente, lister le détail des chambres actuellement inoccupées au Grosvenor Hotel.
SELECT r.* 
FROM HOTELDB.Room r
WHERE r.roomNo NOT IN (
	SELECT roomNo FROM HOTELDB.Booking b, HOTELDB.Hotel h
	WHERE 
	dateFrom <= current_date  
	AND dateTo >= current_date  
	AND b.hotelNo = h.hotelNo 
	AND hotelName = 'Grosvenor Hotel')  
AND r.hotelNo = (select hotelNo from HOTELDB.hotel where hotelName = 'Grosvenor Hotel');



-- Créer une table temporaire qui contient les données de la requête: Lister les chambres qui sont actuellement occupées au Grosvenor Hotel.
CREATE TEMPORARY TABLE IF NOT EXISTS tableTest AS (
SELECT roomNo FROM HOTELDB.Booking b, HOTELDB.Hotel h
WHERE dateFrom <= current_date  
AND dateTo >= current_date 
AND b.hotelNo = h.hotelNo 
AND hotelName = 'Grosvenor Hotel'
);

-- Même requête avec la table temporaire
SELECT r.* FROM HOTELDB.Room r
WHERE r.roomNo 
NOT IN (SELECT roomNo FROM tableTest) 
AND r.hotelNo = (select hotelNo from HOTELDB.hotel where hotelName = 'Grosvenor Hotel'); 

-- En utilisant la requête précédente (Lister les chambres qui sont actuellement occupées au Grosvenor Hotel.), 
-- quel est le revenu perdu de ces chambres non occupées?


SELECT SUM(price) AS Revenu
FROM HOTELDB.Room r
WHERE r.roomNo 
NOT IN (
	SELECT roomNo FROM HOTELDB.Booking b, HOTELDB.Hotel h
	WHERE 
	dateFrom <= current_date  
	AND dateTo >= current_date  
	AND b.hotelNo = h.hotelNo 
	AND hotelName = 'Grosvenor Hotel')  
AND r.hotelNo = (select hotelNo from HOTELDB.hotel where hotelName = 'Grosvenor Hotel');




-- Lister tous les hôtels et leurs réservations qu’ils en aient ou pas.

select h.hotelNo, hotelName, b.guestNo 
from HOTELDB.Hotel h 
LEFT JOIN HOTELDB.Booking b 
on h.hotelNo = b.hotelNo;



-- Utiliser une jointure simple et une jointure naturelle pour afficher le numero de chambre, 
-- le numero d'hotel et le nom de l'hotel pour les chambres réservées 
SELECT roomNo, b.HotelNo, h.hotelName 
FROM HotelDB.Booking b, HotelDB.Hotel h
WHERE b.hotelNo = h.hotelNo;

SELECT roomNo, b.HotelNo, h.hotelName 
FROM HotelDB.Booking b 
NATURAL JOIN HotelDB.Hotel h;




/**** LEFT OUTER JOIN**/


select *
from HotelDB.Hotel 
natural left outer join 
HotelDB.Booking;

select *
from HotelDB.Hotel natural left join HotelDB.Booking;

/**** RIGHT OUTER JOIN**/

select *
from HotelDB.Hotel h  right outer join HotelDB.Booking b 
on H.hotelNo = b.hotelNo;

select *
from HotelDB.Booking b  right outer join HotelDB.Hotel h
on H.hotelNo = b.hotelNo;


select *
from HotelDB.Hotel natural right outer join HotelDB.Booking;

select *
from HotelDB.Booking natural right outer join HotelDB.Hotel;


/**** EMULATE FULL OUTER JOIN**/
select *
from HotelDB.Hotel h right outer join HotelDB.Booking b on h.hotelNo = b.hotelNo
UNION
select *
from HotelDB.Hotel h left outer join HotelDB.Booking b on h.hotelNo = b.hotelNo;

---- OR --- Use Full outer join!

select *
from HotelDB.Hotel h full outer join HotelDB.Booking b on h.hotelNo = b.hotelNo;
