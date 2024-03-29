SET search_path = volsDB;

INSERT INTO volsDB.Passager VALUES ('P000', 'Clas', 'Paul', 'M');
INSERT INTO volsDB.Passager VALUES ('P001', 'Guermache', 'Sid', 'M');
INSERT INTO volsDB.Passager VALUES ('P002', 'Sid', 'Ali', 'M');

INSERT INTO volsDB.Client VALUES ('C000', 'Clas', 'Paul');
INSERT INTO volsDB.Client VALUES ('C001', 'Guermache', 'Sid');
INSERT INTO volsDB.Client VALUES ('C002', 'Sid', 'Ali');

INSERT INTO volsDB.Bagage VALUES ('BA000');
INSERT INTO volsDB.Bagage VALUES ('BA001');
INSERT INTO volsDB.Bagage VALUES ('BA002');

INSERT INTO volsDB.CarteDeCredit VALUES ('CA00', 'Clas', '2025-01-02');
INSERT INTO volsDB.CarteDeCredit VALUES ('CA01', 'Guermache', '2025-01-02');
INSERT INTO volsDB.CarteDeCredit VALUES ('CA02', 'Sid', '2025-01-02');

INSERT INTO volsDB.Reservation VALUES ('R000', '2020-01-02', '1000.00', '100.00', 'P000', 'C000');
INSERT INTO volsDB.Reservation VALUES ('R001', '2020-01-03', '1100.00', '110.00', 'P001', 'C001');
INSERT INTO volsDB.Reservation VALUES ('R002', '2020-01-04', '1200.00', '120.00', 'P002', 'C002');

INSERT INTO volsDB.Billet VALUES ('B000', 'P000', 'R000');
INSERT INTO volsDB.Billet VALUES ('B001', 'P001', 'R001');
INSERT INTO volsDB.Billet VALUES ('B002', 'P002', 'R002');

INSERT INTO volsDB.Paiement VALUES ('PA00', '2020-01-02', '100.00', 'C', 'CA00', 'R000');
INSERT INTO volsDB.Paiement VALUES ('PA01', '2020-01-03', '110.00', 'C', 'CA01', 'R001');
INSERT INTO volsDB.Paiement VALUES ('PA02', '2020-01-04', '120.00', 'C', 'CA02', 'R002');

INSERT INTO volsDB.EnregistrementBagage VALUES ('E000', '2020-01-02', '18:00', 'BA000');
INSERT INTO volsDB.EnregistrementBagage VALUES ('E001', '2020-01-03', '15:00', 'BA001');
INSERT INTO volsDB.EnregistrementBagage VALUES ('E002', '2020-01-04', '13:00', 'BA002');

INSERT INTO volsDB.Aeroport VALUES ('A000', 'MONTREAL');
INSERT INTO volsDB.Aeroport VALUES ('A001', 'QUEBEC');
INSERT INTO volsDB.Aeroport VALUES ('A002', 'RABAT');

INSERT INTO volsDB.Avion VALUES ('AV00', 'BOEING', 'AAAA', '2005-01-02', 100);
INSERT INTO volsDB.Avion VALUES ('AV01', 'BOMBARDIER', 'BBBB', '2006-01-02', 150);
INSERT INTO volsDB.Avion VALUES ('AV02', 'BRISTOL', 'CCCC', '2007-01-02', 200);

INSERT INTO volsDB.Vol VALUES ('V000', '2020-01-02', '6:00', '2020-01-03', 'MARDI', 'A000', 'AV00');
INSERT INTO volsDB.Vol VALUES ('V001', '2020-01-03', '7:00', '2020-01-04', 'MERCREDI', 'A001', 'AV01');
INSERT INTO volsDB.Vol VALUES ('V002', '2020-01-04', '8:00', '2020-01-05', 'JEUDI', 'A002', 'AV02');


INSERT INTO volsDB.Annulation VALUES ('AN00', 'NEIGE', 'V000');
INSERT INTO volsDB.Annulation VALUES ('AN01', 'PLUIE', 'V001');

INSERT INTO volsDB.Retard VALUES ('RE00', 5, 10, 'NEIGE', 'V000');
INSERT INTO volsDB.Retard VALUES ('RE01', 10, 15, 'PLUIE', 'V001');

INSERT INTO volsDB.Tarif VALUES ('T000', '1 SEUL PASSAGER');
INSERT INTO volsDB.Tarif VALUES ('T001', '2 SEUL PASSAGERS');
INSERT INTO volsDB.Tarif VALUES ('T002', '5+ SEUL PASSAGERS');

INSERT INTO volsDB.AppliqueA VALUES ('T000', 'V000', 'R000');
INSERT INTO volsDB.AppliqueA VALUES ('T001', 'V001', 'R001');
INSERT INTO volsDB.AppliqueA VALUES ('T002', 'V002', 'R002');

INSERT INTO volsDB.AppartientA VALUES ('P000', 'E000', 'V000');
INSERT INTO volsDB.AppartientA VALUES ('P001', 'E001', 'V001');
INSERT INTO volsDB.AppartientA VALUES ('P002', 'E002', 'V002');

INSERT INTO volsDB.Siege VALUES ('S000', 'A', 'AV00');
INSERT INTO volsDB.Siege VALUES ('S001', 'ECONO', 'AV01');
INSERT INTO volsDB.Siege VALUES ('S002', 'AFFAIRE', 'AV02');

INSERT INTO volsDB.Employee VALUES ('EM0000', '2018-01-10');
INSERT INTO volsDB.Employee VALUES ('EM0001', '2016-05-18');
INSERT INTO volsDB.Employee VALUES ('EM0002', '2020-02-05');
INSERT INTO volsDB.Employee VALUES ('EM0003', '2020-02-05');
INSERT INTO volsDB.Employee VALUES ('EM0004', '2020-02-05');

INSERT INTO volsDB.Pilote VALUES ('L000', '2016-01-10', 'PILOTE', 'EM0000');
INSERT INTO volsDB.Pilote VALUES ('L001', '2014-01-10', 'PILOTE', 'EM0001');
INSERT INTO volsDB.Pilote VALUES ('L002', '2012-01-10', 'PILOTE', 'EM0002');

INSERT INTO volsDB.Responsabilite VALUES ('V000', 'EM0000', 'PILOTE');
INSERT INTO volsDB.Responsabilite VALUES ('V000', 'EM0001', 'CO-PILOTE');
INSERT INTO volsDB.Responsabilite VALUES ('V002', 'EM0002', 'SECOND');













