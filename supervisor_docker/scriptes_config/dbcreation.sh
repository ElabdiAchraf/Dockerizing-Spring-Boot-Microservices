#!/bin/bash

envname=$(printenv MYSQL_DATA_BASE_NAME)
envusername=$(printenv MYSQL_USER_NAME)
envuserpass=$(printenv MYSQL_PASSWORD)
envhost=$(printenv MYSQL_HOST)


if [ -z "${envname}" ]; then
    dbname='JwtMicroservice'
else
    dbname=${envname}
fi

if [ -z "${envusername}" ]; then
    username='root'
else
    username=${envusername}
fi

if [ -z "${envuserpass}" ]; then
    password='password'
else
    password=${envuserpass}
fi


host=$(hostname -I)

echo $dbname
echo "Creating new MySQL database..."
mysql -e "CREATE DATABASE ${dbname} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
mysql -e "GRANT ALL PRIVILEGES ON ${dbname}.* TO '${username}'@'${host}';"
echo "Database successfully created!"


echo "Creating new user..."
mysql -e " drop user 'root'@'localhost';CREATE USER ${username}@'localhost' IDENTIFIED BY '${password}';GRANT ALL PRIVILEGES ON *.* TO ${username}@'localhost' WITH GRANT OPTION;CREATE USER ${username}@'%' IDENTIFIED BY '${password}';GRANT ALL PRIVILEGES ON *.* TO ${username}@'%' WITH GRANT OPTION;FLUSH PRIVILEGES;"

