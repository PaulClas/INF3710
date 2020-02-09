
DROP SCHEMA IF EXISTS volsDB CASCADE;
CREATE SCHEMA volsDB;

SET search_path = volsDB;

--
--  Création des tables
--

CREATE TABLE Reservation (
NoReservation        CHAR(15) NOT NULL, 
DateReservation      DATE NOT NULL, 
PrixTotal            VARCHAR(15) NOT NULL, 
PaiementEffectue     VARCHAR(15) NOT NULL, 
CONSTRAINT Reservation_PK
       PRIMARY KEY (NoReservation),
CONSTRAINT Reserv_Pass_FK
       FOREIGN KEY (NoPassager)
       REFERENCES Passager(NoPassager),
CONSTRAINT Reserv_Paie_FK
       FOREIGN KEY (NoPaiment)
       REFERENCES Paiement(NoPaiement),
CONSTRAINT Reserv_Client_FK
       FOREIGN KEY (NoClient)
       REFERENCES Client(NoClient)
);

CREATE TABLE Passager (
NoPassager    VARCHAR(15) NOT NULL, 
CONSTRAINT Passager_PK
       PRIMARY KEY (NoPassager)
);

CREATE TABLE Client (
NoClient    VARCHAR(15) NOT NULL, 
CONSTRAINT Client_PK
       PRIMARY KEY (NoClient)
);
