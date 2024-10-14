#!/bin/bash
# Esperar a que MySQL inicie completamente
while ! mysqladmin ping -h "localhost" --silent; do
    echo "Esperando a que MySQL se inicie..."
    sleep 5
done

# Importar datos en partes para evitar la sobrecarga
echo "Importando datos en centinelamima_fc..."
mysql -u root -p"$MYSQL_ROOT_PASSWORD" centinelamima_fc < /docker-entrypoint-initdb.d/02-centinelamima_fc.sql
echo "Importación en centinelamima_fc completada."

echo "Esperando antes de la siguiente importación..."
sleep 10

echo "Importando datos en centinelamima_sistema..."
mysql -u root -p"$MYSQL_ROOT_PASSWORD" centinelamima_sistema < /docker-entrypoint-initdb.d/03-centinelamima_sistema.sql
echo "Importación en centinelamima_sistema completada."

echo "Inicialización completada."