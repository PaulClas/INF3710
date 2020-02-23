
--- Affichez tous les clients par ordre alphabétique croissant de nom (et décroissant)
select * from HOTELDB.GUEST 
order by guestName DESC;

---- Lister le nom et l’adresse des clients à Kingston par ordre alphabétique de nom.
select guestName, guestCity 
from HOTELDB.GUEST 
where guestCity = 'Kingston'
order by guestName;

---- Affichez les informations des chambres de l’hôtel H111 incluant un prix incrémenté de 10%
select roomNo, hotelNo, price, (price + price *10/100) AS NewP
from HOTELDB.room
where hotelNo = 'H111'
order by (price);


---- Affichez le nom des hôtels qui sont à London ou  Kingston
Select*
from HOTELDB.Hotel
where city = 'London' or city='Kingston';

select * from Hotel 
where city in ('London','Kingston');


----- Affichez le nom des hôtels qui ne sont ni à London ni à Kingston
select * from HOTELDB.Hotel; 
Select*
from HOTELDB.Hotel
where city != 'London' and city!='Kingston';

------- OU
Select*
from HOTELDB.Hotel
where city NOT IN ('London','Kingston');

---- Lister toutes les réservations pour lesquelles aucune dateTo n’a été spécifiée
Select * from HotelDB.Booking
where dateTo IS NULL;

---- Retrouvez tous les clients dont le nom contient Kat et dont le sexe est féminin.

Select * from Guest;

Select guestname
from HOTELDB.GUEST
where guestName LIKE '%Kat%' 
AND gender = 'F';


-- Affichez les chambres par ordre croissant d’hôtel et par ordre décroissant de prix
select * from room
order by hotelNo, price DESC;
