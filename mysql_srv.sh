#copie de la base de donnée SQL dans le dossier qui sera monté dans le conteneur mysql
echo "copie de la BDD dans le dossier SQL... "
sudo cp DBML/shared/*.sql /home/nass/SAE51/SQL/
sed -i '4i\CREATE DATABASE PARCSAE51; USE PARCSAE51;' /home/nass/SAE51/SQL/BDD.sql

echo "création du serveur mysql...  "
#création du conteneur mysql
docker run --rm -dit \
	--name sql-srv3 \
	-p 3306:3306 \
	--env MYSQL_ROOT_PASSWORD=foo \
	--network bri-sae51 \
	--mount type=bind,source=$(pwd)/SQL/,target=/home/ \
	mysql bash 


