CREATE DATABASE PARCSAE51;

USE PARCSAE51;

CREATE TABLE `Machines` (
  `ID` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Marque` varchar(50),
  `OS` varchar(50),
  `RAM` int,
  `DateAchat` date,
  `Utilisateur_ID` int
);

CREATE TABLE `Logiciels` (
  `ID` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `Machine_ID` int,
  `Nom` varchar(100),
  `Version` varchar(20)
);

CREATE TABLE `Utilisateurs` (
  `ID` int AUTO_INCREMENT NOT NULL PRIMARY KEY,
  `Nom` varchar(50),
  `Prenom` varchar(50)
);

CREATE TABLE `InterventionsTechniques` (
  `ID` int PRIMARY KEY NOT NULL  AUTO_INCREMENT,
  `DateIntervention` date,
  `Technicien` varchar(50),
  `Description` varchar(255),
  `Machine_ID` int
);

ALTER TABLE `Machines` ADD FOREIGN KEY (`Utilisateur_ID`) REFERENCES `Utilisateurs` (`ID`);

ALTER TABLE `Logiciels` ADD FOREIGN KEY (`Machine_ID`) REFERENCES `Machines` (`ID`);

ALTER TABLE `InterventionsTechniques` ADD FOREIGN KEY (`Machine_ID`) REFERENCES `Machines` (`ID`);

#Charger des données dans la table Machines
LOAD DATA LOCAL INFILE '/home/Utilisateur.csv'
INTO TABLE Utilisateurs
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Nom,Prenom);

#Charger des données dans la table Utilisateurs
LOAD DATA LOCAL INFILE '/home/Machines.csv'
INTO TABLE Machines
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Marque,OS,RAM,DateAchat,Utilisateur_ID);


#Charger des données dans la table Logiciels
LOAD DATA LOCAL INFILE '/home/Logiciels.csv'
INTO TABLE Logiciels
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Machine_ID,Nom,Version);

#Charger des données dans la table InterventionsTechniques
LOAD DATA LOCAL INFILE '/home/InterventionsTechniques.csv'
INTO TABLE InterventionsTechniques
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(DateIntervention,Technicien,Description,Machine_ID);
