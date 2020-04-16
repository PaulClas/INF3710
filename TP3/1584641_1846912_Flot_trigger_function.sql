-- d) Triggers (3 points)

SET search_path = flotteDB;

-- 1) (0.5 points) Une fonction nbAvions en PL/pgSQL qui retourne le nombre total d’avions;
CREATE FUNCTION nbAvions() 
RETURNS bigint AS $$
SELECT COUNT(idAvion) FROM avion;
$$ LANGUAGE SQL;

--2) (2.5 points) Un trigger contrôle_inspection qui crée une insertion dans une table nommée
--   Controle. Ce trigger se déclenche lorsqu’il y a une mise à jour d’un nouveau modèle d’avion.
--   On veut conserver les informations de l’avion ainsi que la date de la mise à jour.
CREATE OR REPLACE FUNCTION controleInspection() RETURNS TRIGGER AS $controleInspectionTrigger$
BEGIN
   IF (TG_OP = 'UPDATE') THEN
        INSERT INTO controle SELECT NEW.*, now();
        RETURN NEW;
   END IF;
END;
$emp_audit$ LANGUAGE plpgsql;


--- Trigger qui se déclenche apres avoir insérer des données
DROP TRIGGER IF EXISTS controle_inspection on controle;

CREATE TRIGGER controle_inspection
AFTER INSERT ON controle
FOR EACH ROW EXECUTE PROCEDURE controleInspection();


