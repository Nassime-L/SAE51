#Création de l'image pour le DBML à partir du dockerfile
echo "Création de l'image dbml... "
docker build -t dbmltosql:2.0 .

#création du dossier shared qui va permettre de récupérer la BDD en sql
echo "Création du dossier shared... "
mkdir -p shared/

#copie du dbml dans ce dossier pour qu'une fois dans le conteneur on puisse le passer en sql
echo "Copie du fichier dbml dans le dossier shared "
sudo cp dbml/*.dbml shared/

#Crétion et lancement du conteneur, avec la commande qui transforme le dbml en sql
echo "Créeation du conteneur DBML... "

docker run -it \
	--workdir /srv \
	--name dbml2sql \
	--mount type=bind,source=$(pwd)/shared,target=/srv \
	dbmltosql:1.0 dbml2sql BDD.dbml --mysql -o BDD.sql

echo "La BDD sql a été créée ! "

