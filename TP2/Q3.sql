
DROP SCHEMA IF EXISTS volsDB CASCADE;
CREATE SCHEMA volsDB;

SET search_path = volsDB;

--
--  Création des tables
--


CREATE TABLE Client (
NoClient    VARCHAR(15) NOT NULL, 
Nom         VARCHAR(15) NOT NULL, 
Prenom      VARCHAR(15) NOT NULL,
CONSTRAINT Client_PK
       PRIMARY KEY (NoClient)
);

CREATE TABLE Passager (
NoPassager  VARCHAR(15) NOT NULL, 
Nom         VARCHAR(15) NOT NULL, 
Prenom      VARCHAR(15) NOT NULL, 
sex         CHAR
    		CONSTRAINT Passager_sexCHK 
			CHECK (sex IN ('M', 'F')),

CONSTRAINT Passager_PK
       PRIMARY KEY (NoPassager)
);

CREATE TABLE Bagage (
NoBagage    VARCHAR(15) NOT NULL, 
CONSTRAINT Bagage_PK
       PRIMARY KEY (NoBagage)
);

CREATE TABLE CarteDeCredit (
NoCarte         VARCHAR(15) NOT NULL, 
Nom             VARCHAR(15) NOT NULL, 
Expiration      DATE NOT NULL,
CONSTRAINT CarteDeCredit_PK
       PRIMARY KEY (NoCarte)
);

CREATE TABLE Reservation (
NoReservation        CHAR(15) NOT NULL, 
DateReservation      DATE NOT NULL, 
PrixTotal            DECIMAL(7,2) NOT NULL, 
PaiementEffectue     DECIMAL(7,2) NOT NULL, 
NoPassager  VARCHAR(15) NOT NULL, 
NoClient    VARCHAR(15) NOT NULL, 
	
CONSTRAINT Reservation_PK
       PRIMARY KEY (NoReservation),
CONSTRAINT Reserv_Pass_FK
       FOREIGN KEY (NoPassager)
              REFERENCES Passager(NoPassager),

CONSTRAINT Reserv_Client_FK
       FOREIGN KEY (NoClient)
              REFERENCES Client(NoClient)
);

CREATE TABLE Billet (
NoBillet    VARCHAR(15) NOT NULL, 
NoPassager  VARCHAR(15) NOT NULL, 
NoReservation        CHAR(15) NOT NULL, 

CONSTRAINT Billet_PK
       PRIMARY KEY (NoBillet),

CONSTRAINT Billet_Passager_FK
       FOREIGN KEY (NoPassager)
              REFERENCES Passager(NoPassager),

CONSTRAINT Billet_Reservation_FK
       FOREIGN KEY (NoReservation)
              REFERENCES Reservation(NoReservation)       
);

CREATE TABLE Paiement (
NoPaiement      VARCHAR(15) NOT NULL, 
DatePaiement    DATE NOT NULL,
Montant         DECIMAL(7,2) NOT NULL,
Mode            CHAR
    			CONSTRAINT Paiement_ModeCHK 
				CHECK (Mode IN ('C', 'D', 'S')),
NoCarte         VARCHAR(15) NOT NULL, 	
NoReservation        CHAR(15) NOT NULL, 	

CONSTRAINT Paiement_PK
       PRIMARY KEY (NoPaiement),

CONSTRAINT Paiement_Carte_FK
       FOREIGN KEY (NoCarte)
              REFERENCES CarteDeCredit(NoCarte),

CONSTRAINT Paiement_Reservation_FK
       FOREIGN KEY (NoReservation)
              REFERENCES Reservation(NoReservation)       
);

CREATE TABLE EnregistrementBagage (
NoEnregistrement      VARCHAR(15) NOT NULL, 
DateEnregistrement    DATE NOT NULL,
Heure                 TIME NOT NULL,
NoBagage    VARCHAR(15) NOT NULL, 	

CONSTRAINT EnregistrementBagage_PK
       PRIMARY KEY (NoEnregistrement),

CONSTRAINT EnregistrementBagage_Bagage_FK
       FOREIGN KEY (NoBagage)
              REFERENCES Bagage(NoBagage)
);

CREATE TABLE Aeroport (
CodeAeroport    VARCHAR(15) NOT NULL, 
Ville           VARCHAR(15) NOT NULL, 
CONSTRAINT Aeroport_PK
       PRIMARY KEY (CodeAeroport)
);

CREATE TABLE Avion (
NoAppareil      VARCHAR(15) NOT NULL, 
Fabricant       VARCHAR(150) NOT NULL, 
Modele          VARCHAR(150) NOT NULL, 
DateAcquisition DATE NOT NULL,
NombreDeSiege   INT NOT NULL,

CONSTRAINT Avion_PK
       PRIMARY KEY (NoAppareil)
);

CREATE TABLE Vol (
NoVol           VARCHAR(15) NOT NULL, 
DateDepart      DATE NOT NULL,
HeureDepart     TIME NOT NULL,
DateArrivee     DATE NOT NULL,
JourArrivee     VARCHAR(15) NOT NULL, 
CodeAeroport    VARCHAR(15) NOT NULL, 
NoAppareil      VARCHAR(15) NOT NULL, 

CONSTRAINT Vol_PK
       PRIMARY KEY (NoVol),

CONSTRAINT Vol_Aeroport_FK
       FOREIGN KEY (CodeAeroport)
              REFERENCES Aeroport(CodeAeroport),

CONSTRAINT Vol_Avion_FK
       FOREIGN KEY (NoAppareil)
              REFERENCES Avion(NoAppareil)
);

CREATE TABLE Annulation (
NoAnnulation    VARCHAR(15) NOT NULL, 
Raison          VARCHAR(150) NOT NULL, 
NoVol           VARCHAR(15) NOT NULL, 

CONSTRAINT Annulation_PK
       PRIMARY KEY (NoAnnulation),

CONSTRAINT Annulation_Vol_FK
       FOREIGN KEY (NoVol)
              REFERENCES Vol(NoVol)
);

CREATE TABLE Retard (
NoRetard            VARCHAR(15) NOT NULL, 
MinutesAuDepart     INT NOT NULL, 
MinuteArrive        INT NOT NULL, 
Raison              VARCHAR(150) NOT NULL, 
NoVol           VARCHAR(15) NOT NULL, 


CONSTRAINT Retard_PK
       PRIMARY KEY (NoRetard),

CONSTRAINT Retard_Vol_FK
       FOREIGN KEY (NoVol)
              REFERENCES Vol(NoVol)
);

CREATE TABLE Tarif (
CodeTarif       VARCHAR(15) NOT NULL, 
Condition       VARCHAR(150) NOT NULL, 

CONSTRAINT Tarif_PK
       PRIMARY KEY (CodeTarif)
);

CREATE TABLE AppliqueA (
CodeTarif       VARCHAR(15) NOT NULL, 
NoVol           VARCHAR(150) NOT NULL, 
NoReservation   VARCHAR(150) NOT NULL, 

CONSTRAINT AppliqueA_PK
       PRIMARY KEY (CodeTarif, NoVol, NoReservation),

CONSTRAINT AppliqueA_Tarif_FK
       FOREIGN KEY (CodeTarif)
              REFERENCES Tarif(CodeTarif),

CONSTRAINT AppliqueA_Vol_FK
       FOREIGN KEY (NoVol)
              REFERENCES Vol(NoVol),

CONSTRAINT AppliqueA_Reservation_FK
       FOREIGN KEY (NoReservation)
              REFERENCES Reservation(NoReservation)            
);

CREATE TABLE AppartientA (
NoPassager          VARCHAR(15) NOT NULL, 
NoEnregistrement    VARCHAR(150) NOT NULL, 
NoVol               VARCHAR(150) NOT NULL, 

CONSTRAINT AppartientA_PK
       PRIMARY KEY (NoPassager, NoEnregistrement, NoVol),

CONSTRAINT AppartientA_Passager_FK
       FOREIGN KEY (NoPassager)
              REFERENCES Passager(NoPassager),

CONSTRAINT AppartientA_EnregistrementBagage_FK
       FOREIGN KEY (NoEnregistrement)
              REFERENCES EnregistrementBagage(NoEnregistrement),

CONSTRAINT AppartientA_Vol_FK
       FOREIGN KEY (NoVol)
              REFERENCES Vol(NoVol)           
);

CREATE TABLE Siege (
NoSiege     VARCHAR(15) NOT NULL, 
Classe      VARCHAR(15) NOT NULL, 
NoAppareil  VARCHAR(15) NOT NULL, 

CONSTRAINT Siege_PK
       PRIMARY KEY (NoSiege),

CONSTRAINT Siege_Avion_FK
       FOREIGN KEY (NoAppareil)
              REFERENCES Avion(NoAppareil)
);

CREATE TABLE Employee (
NoEmployee      VARCHAR(15) NOT NULL, 
DateEmbauche    DATE NOT NULL, 

CONSTRAINT Employee_PK
       PRIMARY KEY (NoEmployee)
);

CREATE TABLE Pilote (
NoLicence               VARCHAR(15) NOT NULL, 
DateObtentionLicence    DATE NOT NULL, 
PiloteFlag              VARCHAR(15) NOT NULL,    
NoEmployee               VARCHAR(15) NOT NULL, 

CONSTRAINT Pilote_PK
       PRIMARY KEY (NoLicence),

CONSTRAINT Pilote_Employee_FK
       FOREIGN KEY (NoEmployee)
              REFERENCES Employee(NoEmployee)
);

CREATE TABLE Responsabilite (
NoVol                   VARCHAR(15) NOT NULL, 
NoEmployee              VARCHAR(15) NOT NULL, 
TypeDeREsponsabilite    VARCHAR(15) NOT NULL, 

CONSTRAINT Responsabilite_PK
       PRIMARY KEY (NoVol, NoEmployee),

CONSTRAINT Responsabilite_Vol_FK
       FOREIGN KEY (NoVol)
              REFERENCES Vol(NoVol),

CONSTRAINT Responsabilite_Employee_FK
       FOREIGN KEY (NoEmployee)
              REFERENCES Employee(NoEmployee)
);




