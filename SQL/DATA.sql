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
