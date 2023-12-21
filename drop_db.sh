#scriptsuppression de la BDD dans le serveur mysql

mysql -u root -p'foo' -h 127.0.0.1 --port=3306 \
	-e "DROP DATABASE PARCSAE51;"  #création de la base
