SET search_path = flotteDB;

DROP SCHEMA IF EXISTS FLOTTEDB CASCADE;
CREATE SCHEMA FLOTTEDB;

CREATE TABLE FLOTTEDB.Constructeur (
    idConstructeur      SERIAL              NOT NULL,
    nomCompagnie        VARCHAR(150)         NOT NULL,
    type_constructeur   VARCHAR(20) CONSTRAINT typeConstructeur CHECK (type_constructeur IN ('Motoriste', 'Avionneur', 'Systemes')),
    pays                VARCHAR(150)         NOT NULL,
    
    PRIMARY KEY (idConstructeur)
);

CREATE TABLE FLOTTEDB.Avion (
    idAvion         SERIAL     NOT NULL,
    modele          VARCHAR(50)     NOT NULL,
    idConstructeur  SERIAL          NOT NULL,
    nbMoteurs       INT             NOT NULL,
    nbSieges        INT             NOT NULL,
    PRIMARY KEY (idAvion),
    FOREIGN KEY (idConstructeur) REFERENCES Constructeur(idConstructeur));

CREATE TABLE FLOTTEDB.Moteur (
    idMoteur        SERIAL        NOT NULL,
    modele          VARCHAR(50)     NOT NULL,
    idConstructeur  SERIAL          NOT NULL,
    diametre        VARCHAR(50)     NOT NULL,
    longueur        INT             NOT NULL,
    poids           INT             NOT NULL,
    poussee         INT             NOT NULL,
    PRIMARY KEY (idMoteur),
    FOREIGN KEY (idConstructeur) REFERENCES Constructeur(idConstructeur)
);

CREATE TABLE FLOTTEDB.Flotte (
    noSerieAvion    VARCHAR(50)        NOT NULL,
    noSerieMoteur   VARCHAR(50)        NOT NULL,
    idMoteur        SERIAL        NOT NULL,
    idAvion         SERIAL        NOT NULL,
    vitesse         INT           NOT NULL,
    autonomie       NUMERIC(3, 1) NOT NULL,
    dateService     DATE          NOT NULL,
    heuresVol       INT,
    dateRetrait     DATE,

    PRIMARY KEY (idMoteur),
    FOREIGN KEY (idMoteur) REFERENCES Moteur(idMoteur),
    FOREIGN KEY (idAvion)  REFERENCES Avion(idAvion)
);
