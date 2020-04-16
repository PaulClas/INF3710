SET SEARCH_PATH = hoteldb;

CREATE OR REPLACE FUNCTION totalHotelRecords ()
RETURNS integer AS $total$
declare
	total integer;
BEGIN
   SELECT count(*) into total FROM hotelDB.hotel;
   RETURN total;
END;
$total$ LANGUAGE plpgsql;

select totalHotelRecords();

-- Pour vérifier que la fonction est correcte, comptez le nombre de tuples: 
select * from Hotel;
