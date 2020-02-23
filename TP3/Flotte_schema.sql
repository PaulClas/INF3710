SET search_path = flotteDB;

DROP SCHEMA IF EXISTS FLOTTEDB CASCADE;
CREATE SCHEMA FLOTTEDB;

CREATE DOMAIN FLOTTEDB.typeConstructeur AS CHAR
	CHECK (VALUE IN ('Motoriste', 'avionneur', 'systemes'));

CREATE TABLE FLOTTEDB.Constructeur (
    idConstructeur      SERIAL              NOT NULL,
    nomCompagnie        VARCHAR(20)         NOT NULL,
    type_constructeur   typeConstructeur    NOT NULL,
    pays                VARCHAR(20)         NOT NULL,
    
    PRIMARY KEY (idConstructeur)
);

CREATE TABLE Avion (
    idAvion         SERIAL     NOT NULL,
    modele          VARCHAR(20)     NOT NULL,
    idConstructeur  SERIAL          NOT NULL,
    nbMoteurs       INT             NOT NULL,
    nbSieges        INT             NOT NULL,
    PRIMARY KEY (idAvion),
    FOREIGN KEY (idConstructeur) REFERENCES Constructeur(idConstructeur));

CREATE TABLE Moteur (
    idMoteur        SERIAL        NOT NULL,
    modele          VARCHAR(20)     NOT NULL,
    idConstructeur  SERIAL          NOT NULL,
    diametre        VARCHAR(20)     NOT NULL,
    longueur        INT             NOT NULL,
    poids           INT             NOT NULL,
    poussee         INT             NOT NULL,
    PRIMARY KEY (idMoteur),
    FOREIGN KEY (idConstructeur) REFERENCES Constructeur(idConstructeur)
);

CREATE TABLE Flotte (
    noSerieAvion    SERIAL        NOT NULL,
    noSerieMoteur   SERIAL        NOT NULL,
    idMoteur        SERIAL        NOT NULL,
    idAvion         SERIAL        NOT NULL,
    vitesse         INT           NOT NULL,
    autonomie       NUMERIC(3, 1) NOT NULL,
    poussee         INT           NOT NULL,
    dateService     DATE          NOT NULL,
    heuresVol       INT,
    dateRetrait     DATE,

    PRIMARY KEY (idMoteur),
    FOREIGN KEY (idMoteur) REFERENCES Moteur(idMoteur),
    FOREIGN KEY (idAvion)  REFERENCES Avion(idAvion)
);
