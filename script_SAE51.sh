#DBML
echo "Creation du conteneur DBML... "
cd ~/SAE51/DBML/
sudo bash dbmltosql.sh

sleep 5

ls ~/SAE51/DBML/shared/

#MYSQL
cd ~/SAE51/
sudo bash mysql_srv.sh


