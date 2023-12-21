-- SQL dump generated using DBML (dbml-lang.org)
-- Database: MySQL
-- Generated at: 2023-12-21T11:24:59.176Z

CREATE TABLE `Machines` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `Marque` varchar(50),
  `OS` varchar(50),
  `RAM` int,
  `AnneeAchat` int,
  `Utilisateur_ID` int
);

CREATE TABLE `Logiciels` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `Machine_ID` int,
  `Nom` varchar(100),
  `Version` varchar(20)
);

CREATE TABLE `Utilisateurs` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `Nom` varchar(50),
  `Prenom` varchar(50)
);

CREATE TABLE `InterventionsTechniques` (
  `ID` int PRIMARY KEY AUTO_INCREMENT,
  `DateIntervention` date,
  `Technicien` varchar(50),
  `Description` varchar(255),
  `Machine_ID` int
);

ALTER TABLE `Machines` ADD FOREIGN KEY (`Utilisateur_ID`) REFERENCES `Utilisateurs` (`ID`);

ALTER TABLE `Logiciels` ADD FOREIGN KEY (`Machine_ID`) REFERENCES `Machines` (`ID`);

ALTER TABLE `InterventionsTechniques` ADD FOREIGN KEY (`Machine_ID`) REFERENCES `Machines` (`ID`);
