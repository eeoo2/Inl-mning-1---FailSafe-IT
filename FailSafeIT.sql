/* ============================================================================
   Det osäkra IT-bolaget "FailSafe IT"
   ============================================================================ */

-- ÅTERSTÄLL OCH SKAPA DATABASEN
PRINT 'Återställer och skapar databasen';
USE master;
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'FailSafeIT')
BEGIN
    ALTER DATABASE FailSafeIT SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE FailSafeIT;
END
GO

CREATE DATABASE FailSafeIT;
GO

USE FailSafeIT;
GO

-- SKAPA TABELLER
CREATE TABLE [Kunder] (
  [KundID] INT IDENTITY (1,1), 
  [KundOrgNr] VARCHAR(30),
  [Företagsnamn] NVARCHAR(40),
  [Epost] NVARCHAR(50),
  [TelefonNr] VARCHAR(20),
  PRIMARY KEY ([KundID])
);

CREATE TABLE [Konsulter] (
  [KonsultID] INT IDENTITY (1,1), 
  [PersonNr] VARCHAR(15),
  [Namn] NVARCHAR(40),
  [TimPris] DECIMAL(10,2),
  [Yrkesroll] NVARCHAR(30),
  PRIMARY KEY ([KonsultID])
);

CREATE TABLE [Uppdrag] (
  [UppdragsID] INT IDENTITY (1,1), 
  [KonsultID] INT,
  [KundID] INT,
  [Startdatum] DATE,
  [Slutdatum] DATE,
  [Rollbeskrivning] NVARCHAR (100),
  PRIMARY KEY ([UppdragsID]),
  CONSTRAINT [FK_Uppdrag_KundID]
    FOREIGN KEY ([KundID])
      REFERENCES [Kunder]([KundID]),
  CONSTRAINT [FK_Uppdrag_KonsultID]
    FOREIGN KEY ([KonsultID])
      REFERENCES [Konsulter]([KonsultID])
);

-- 3. POPULERA DATA
PRINT 'Fyller tabellen Kunder:'
insert into Kunder (KundOrgNr, Företagsnamn, Epost, TelefonNr) values ('556087-4258', 'Trilith', 'cgarnsey0@scientificamerican.com', '171-727-9523');
insert into Kunder (KundOrgNr, Företagsnamn, Epost, TelefonNr) values ('556759-2820', 'Babbleopia', 'zmcmeekin1@paypal.com', '763-676-8736');
insert into Kunder (KundOrgNr, Företagsnamn, Epost, TelefonNr) values ('556125-4356', 'Izio', 'cdulen2@squidoo.com', '662-459-0470');
insert into Kunder (KundOrgNr, Företagsnamn, Epost, TelefonNr) values ('556273-7657', 'Skyndu', 'mfranzewitch3@shop-pro.jp', '566-699-2186');
insert into Kunder (KundOrgNr, Företagsnamn, Epost, TelefonNr) values ('556826-8286', 'Browsecat', 'wmckibben4@merriam-webster.com', '146-426-5620');
insert into Kunder (KundOrgNr, Företagsnamn, Epost, TelefonNr) values ('556146-8174', 'Skidoo', 'rdansie5@bbc.co.uk', '211-997-5543');
insert into Kunder (KundOrgNr, Företagsnamn, Epost, TelefonNr) values ('556645-5745', 'Zava', 'kgytesham6@nasa.gov', '363-370-1905');
insert into Kunder (KundOrgNr, Företagsnamn, Epost, TelefonNr) values ('556894-1410', 'Edgeclub', 'mfronsek7@slashdot.org', '442-101-9482');
insert into Kunder (KundOrgNr, Företagsnamn, Epost, TelefonNr) values ('556245-1293', 'Dabvine', 'hkliesl8@google.it', '984-999-8625');
insert into Kunder (KundOrgNr, Företagsnamn, Epost, TelefonNr) values ('556501-3195', 'Linkbuzz', 'amaccracken9@psu.edu', '281-533-3805');
GO

PRINT 'Fyller tabellen Konsulter:'
insert into Konsulter (PersonNr, Namn, TimPris, Yrkesroll) values ('19610502-6068', 'Yorgo Wiggans', 950, 'SOC Analyst');
insert into Konsulter (PersonNr, Namn, TimPris, Yrkesroll) values ('19660617-2743', 'Martie Minchinton', 1550, 'Penetration Tester');
insert into Konsulter (PersonNr, Namn, TimPris, Yrkesroll) values ('19630705-4361', 'Bent Bowness', 1200, 'Database Administrator');
insert into Konsulter (PersonNr, Namn, TimPris, Yrkesroll) values ('19811001-7598', 'Marline Grishanin', 1550, 'Cybersecurity');
insert into Konsulter (PersonNr, Namn, TimPris, Yrkesroll) values ('19871211-8832', 'Helen-elizabeth Rainton', 950, 'C# Developer');
insert into Konsulter (PersonNr, Namn, TimPris, Yrkesroll) values ('19691102-9774', 'Terrence Zelake', 800, 'DevOps Engineer');
insert into Konsulter (PersonNr, Namn, TimPris, Yrkesroll) values ('19631214-2904', 'Andrew Drew-Clifton', 1600, 'Backend Developer');
insert into Konsulter (PersonNr, Namn, TimPris, Yrkesroll) values ('19620216-2515', 'Issi Dearlove', 1500, 'Cloud Architect');
insert into Konsulter (PersonNr, Namn, TimPris, Yrkesroll) values ('19961103-6297', 'Blaire Shallcroff', 1850, 'Cloud Architect');
insert into Konsulter (PersonNr, Namn, TimPris, Yrkesroll) values ('19680804-3170', 'Giselle Morando', 1850, 'C# Developer');
GO

PRINT 'Fyller tabellen Uppdrag:'
insert into Uppdrag (KonsultID, KundID, Startdatum, Slutdatum, Rollbeskrivning) values (8, 10, '2025-11-23', '2026-06-06', 'Säkerhetsgranskning av API-miljö');
insert into Uppdrag (KonsultID, KundID, Startdatum, Slutdatum, Rollbeskrivning) values (3, 4, '2026-04-23', '2026-08-08', 'Penetrationstest av webbapplikation');
insert into Uppdrag (KonsultID, KundID, Startdatum, Slutdatum, Rollbeskrivning) values (7, 2, '2026-03-06', '2026-10-24', 'Uppsättning av CI/CD-pipeline');
insert into Uppdrag (KonsultID, KundID, Startdatum, Slutdatum, Rollbeskrivning) values (4, 2, '2026-06-12', '2027-06-10', 'Migrering av servrar till molnet');
insert into Uppdrag (KonsultID, KundID, Startdatum, Slutdatum, Rollbeskrivning) values (9, 8, '2025-12-20', '2026-02-12', 'Utveckling av internt C#-system');
insert into Uppdrag (KonsultID, KundID, Startdatum, Slutdatum, Rollbeskrivning) values (2, 3, '2025-11-20', '2026-01-26', 'Granskning av brandväggsregler');
insert into Uppdrag (KonsultID, KundID, Startdatum, Slutdatum, Rollbeskrivning) values (9, 1, '2026-02-07', '2026-12-08', 'Implementering av MFA för personal');
insert into Uppdrag (KonsultID, KundID, Startdatum, Slutdatum, Rollbeskrivning) values (8, 8, '2026-08-04', '2026-10-21', 'Sårbarhetsskanning av nätverk');
insert into Uppdrag (KonsultID, KundID, Startdatum, Slutdatum, Rollbeskrivning) values (10, 9, '2026-01-18', '2026-08-23', 'Containerisering med Docker och Kubernetes');
insert into Uppdrag (KonsultID, KundID, Startdatum, Slutdatum, Rollbeskrivning) values (3, 7, '2026-10-14', '2027-09-07', 'Kodgranskning ur säkerhetsperspektiv');
GO

-- FRÅGA A
SELECT Namn, TimPris
FROM Konsulter
WHERE TimPris > 1200
ORDER BY Timpris DESC;

-- FRÅGA B
SELECT Företagsnamn, Namn, Startdatum, Slutdatum
FROM Uppdrag
INNER JOIN Kunder ON Uppdrag.KundID = Kunder.KundID
INNER JOIN Konsulter ON Uppdrag.KonsultID = Konsulter.KonsultID;

-- FRÅGA C
SELECT Företagsnamn, COUNT(UppdragsID) AS AntalUppdrag
FROM Uppdrag
RIGHT JOIN Kunder ON Uppdrag.KundID = Kunder.KundID
GROUP BY Företagsnamn;

-- FRÅGA D
UPDATE Konsulter
SET Timpris = 1300
WHERE KonsultID = 5
GO

Select * from Konsulter

-- FRÅGA E

Select * from Uppdrag

DELETE Kunder
WHERE KundID = 5
GO

Select * from Kunder